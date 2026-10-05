#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

php_version=""
composer_version="2.8.3"

#=================================================
# CUSTOM HELPERS
#=================================================

# Detect the newest available PHP major.minor version used by the system/app.
# YunoHost can keep several PHP branches installed at the same time. Do not
# permanently pin the app to an older branch saved in its settings: after a
# YunoHost upgrade, select the newest installed branch automatically.
detect_php_version() {
    if [ -z "$php_version" ] && [ -d /etc/php ]; then
        while IFS= read -r candidate; do
            if command -v "php$candidate" >/dev/null 2>&1 && [ -f "/etc/php/$candidate/fpm/php-fpm.conf" ]; then
                php_version="$candidate"
            fi
        done < <(find /etc/php -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort -V)
    fi

    if [ -z "$php_version" ] && command -v php >/dev/null 2>&1; then
        php_version=$(php -r 'echo PHP_MAJOR_VERSION . "." . PHP_MINOR_VERSION;' 2>/dev/null || true)
    fi

    [ -n "$php_version" ]
}

# Check if PHP version is available
check_php_version() {
    detect_php_version || ynh_die "Unable to detect an available PHP version on this system"

    if ! command -v "php$php_version" &> /dev/null; then
        ynh_die "PHP $php_version is not available on this system"
    fi

    ynh_app_setting_set --key=php_version --value="$php_version"
}

normalize_site_path() {
    local current_path="${1:-/}"

    if [ "$current_path" = "/" ]; then
        printf '%s' ""
    else
        printf '%s' "${current_path%/}"
    fi
}

build_site_url() {
    local current_domain="$1"
    local current_path="$2"

    printf 'https://%s%s' "$current_domain" "$(normalize_site_path "$current_path")"
}

php_escape() {
    local value="${1:-}"
    value="${value//\\/\\\\}"
    value="${value//\'/\\\'}"
    printf '%s' "$value"
}

load_app_settings() {
    db_name=$(ynh_app_setting_get --key=db_name)
    db_user=$(ynh_app_setting_get --key=db_user)
    db_pwd=$(ynh_app_setting_get --key=db_pwd)

    if [ -z "$db_user" ]; then
        db_user=$(ynh_app_setting_get --key=mysql_user)
    fi

    if [ -z "$db_pwd" ]; then
        db_pwd=$(ynh_app_setting_get --key=mysql_pwd)
    fi

    if [ -z "${admin:-}" ]; then
        admin=$(ynh_app_setting_get --key=admin 2>/dev/null || true)
    fi

    admin_email=${admin_email:-$(ynh_app_setting_get --key=admin_email 2>/dev/null || true)}
    if [ -z "$admin_email" ] && [ -n "${admin:-}" ]; then
        admin_email=$(ynh_user_get_info --username="$admin" --key=mail 2>/dev/null || ynh_user_get_info --username="$admin" --key=email 2>/dev/null || true)
    fi
    if [ -z "$admin_email" ]; then
        admin_email="${admin:-admin}@${domain:-localhost}"
    fi
    ynh_app_setting_set --key=admin_email --value="$admin_email"

    cap_url=${cap_url:-$(ynh_app_setting_get --key=cap_url)}
    cap_site_key=${cap_site_key:-$(ynh_app_setting_get --key=cap_site_key)}
    cap_secret_key=${cap_secret_key:-$(ynh_app_setting_get --key=cap_secret_key)}
    cap_url=${cap_url:-"http://127.0.0.1:3000"}
    smtp_host=${smtp_host:-$(ynh_app_setting_get --key=smtp_host)}
    smtp_port=${smtp_port:-$(ynh_app_setting_get --key=smtp_port)}
    smtp_user=${smtp_user:-$(ynh_app_setting_get --key=smtp_user)}
    smtp_password=${smtp_password:-$(ynh_app_setting_get --key=smtp_password)}
    contact_email=${contact_email:-$(ynh_app_setting_get --key=contact_email)}

    smtp_host=${smtp_host:-"127.0.0.1"}
    smtp_port=${smtp_port:-25}
    contact_email=${contact_email:-"$admin_email"}
    smtp_pass="$smtp_password"

    if [ -n "$smtp_user" ]; then
        smtp_from="$smtp_user"
    else
        smtp_from="$admin_email"
    fi
}

render_app_config() {
    local current_domain="${1:-$domain}"
    local current_path="${2:-$path}"
    local site_url

    date=$(date +"%Y-%m-%d %H:%M:%S")
    site_url=$(build_site_url "$current_domain" "$current_path")

    DB_NAME=$(php_escape "$db_name")
    DB_USER=$(php_escape "$db_user")
    DB_PWD=$(php_escape "$db_pwd")
    SMTP_HOST=$(php_escape "$smtp_host")
    SMTP_PORT=$(php_escape "$smtp_port")
    SMTP_USER=$(php_escape "$smtp_user")
    SMTP_PASS=$(php_escape "$smtp_pass")
    SMTP_FROM=$(php_escape "$smtp_from")
    CONTACT_EMAIL=$(php_escape "$contact_email")
    SITE_URL=$(php_escape "$site_url")
    CAP_URL=$(php_escape "$cap_url")
    CAP_SITE_KEY=$(php_escape "$cap_site_key")
    CAP_SECRET_KEY=$(php_escape "$cap_secret_key")
    INSTALL_DIR=$(php_escape "$install_dir")

    mkdir -p "$install_dir/includes"

    ynh_config_add --template="database.php" --destination="$install_dir/includes/database.php"
    ynh_config_add --template="config.php" --destination="$install_dir/includes/config.php"

    chmod 400 "$install_dir/includes/database.php" "$install_dir/includes/config.php"
    chown "$app:$app" "$install_dir/includes/database.php" "$install_dir/includes/config.php"
}
