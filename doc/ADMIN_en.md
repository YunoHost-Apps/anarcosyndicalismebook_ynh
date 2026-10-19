# Administration

The administration interface is accessible at `https://your-domain.tld/admin/` (or the custom path chosen during installation).

### Administrator Account

The administrator account is created automatically during installation. Use the email and password defined in the YunoHost installation form.

### Interface Menus

- **Dashboard** — Reading statistics and overall site status.
- **Texts** — Complete management of texts, PDFs, and EPUBs.
- **Authors** — Management of authors with profile pictures.
- **Categories** — Thematic organization of the library.
- **Users** — Management of accounts, roles, and access.
- **Pages** — WYSIWYG editor for static pages (About, Legal, etc.).
- **Menus** — Dynamic management of the navigation bar.
- **Universal Import** — Full migration from **Ghost CMS**, WordPress, or **RSS/Atom** feeds.
- **Mass Import** — Drag & drop to import several files simultaneously.
- **Calibre Import** — Synchronization via `metadata.db` or OPDS server.
- **Newsletter** — Complete system for sending emails and managing subscribers in the project's colors.
- **Auto-posting** — Setup for automatic publishing to Mastodon, Bluesky, Facebook, etc.
- **Settings** — Site customization (Title, SEO, Colors, Logos).
- **Diagnostics** — Verification of database integrity and system files.
- **Updates** — Checking and installing new versions from Codeberg.

### Backups

Backups are managed by YunoHost's native system. Persistent data is stored in
the YunoHost data directory (usually
`/home/yunohost.app/anarchosyndicalismebook`): `uploads`, `backups`, `logs`,
and `releases`. Installation and upgrades create these directories and link
them to the application automatically. The Docker volume path
`/var/lib/anarcosyndicalismebook/backups` must not be used for the YunoHost
package.

### Logs (Error Reporting)

The application now features an internal logging system for debugging and migrations:
- **App Logs**: `/home/yunohost.app/anarchosyndicalismebook/logs/error.log`
- **System Logs (FPM)**: `/var/log/php<VERSION>-fpm-anarchosyndicalismebook.log` (replace `<VERSION>` with the PHP version used by the application).
