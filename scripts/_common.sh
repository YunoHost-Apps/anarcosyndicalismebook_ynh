#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

php_version="8.2"
composer_version="2.8"

#=================================================
# CUSTOM HELPERS
#=================================================

# Check if PHP version is available
check_php_version() {
    if ! command -v "php$php_version" &> /dev/null; then
        ynh_die "PHP $php_version is not available on this system"
    fi
}
