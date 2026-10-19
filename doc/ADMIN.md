# Administration

L'interface d'administration est accessible à `https://votre-domaine.tld/admin/` (ou le chemin personnalisé choisi lors de l'installation).

### Compte administrateur

Le compte administrateur est créé automatiquement lors de l'installation. Utilisez l'email et le mot de passe définis dans le formulaire d'installation de YunoHost.

### Menus de l'interface

- **Dashboard** — Statistiques de lecture et état général du site.
- **Textes** — Gestion complète des textes, PDF et EPUB.
- **Auteurs** — Gestion des auteur·ices avec photos de profil.
- **Catégories** — Organisation thématique de la bibliothèque.
- **Utilisateurs** — Gestion des comptes, des rôles et des accès.
- **Pages** — Éditeur WYSIWYG pour les pages statiques (À propos, Mentions légales, etc.).
- **Menus** — Gestion dynamique de la barre de navigation.
- **Importation Universelle** — Migration complète depuis **Ghost CMS**, WordPress ou flux **RSS/Atom**.
- **Import en masse** — Drag & drop pour importer plusieurs fichiers simultanément.
- **Import Calibre** — Synchronisation via `metadata.db` ou serveur OPDS.
- **Newsletter** — Système complet d'envoi et gestion des abonnés aux couleurs du projet.
- **Auto-publication** — Configuration de la publication automatique vers Mastodon, Bluesky, Facebook, etc.
- **Paramètres** — Personnalisation du site (Titre, SEO, Couleurs, Logos).
- **Diagnostics** — Vérification de l'état de la base de données et des fichiers système.
- **Mises à jour** — Vérification et installation des nouvelles versions depuis Codeberg.

### Sauvegardes

Les sauvegardes sont gérées par le système natif de YunoHost. Les données
persistantes se trouvent dans le répertoire de données YunoHost (généralement
`/home/yunohost.app/anarchosyndicalismebook`) : `uploads`, `backups`, `logs` et
`releases`. L'installation et les mises à niveau créent automatiquement ces
répertoires et les relient à l'application. Le chemin de volume Docker
`/var/lib/anarcosyndicalismebook/backups` ne doit pas être utilisé dans le
paquet YunoHost.

### Logs (Journaux d'erreurs)

L'application dispose désormais d'un système de log interne pour le débugage et les migrations :
- **Logs Applicatifs** : `/home/yunohost.app/anarchosyndicalismebook/logs/error.log`
- **Logs Système (FPM)** : `/var/log/php<VERSION>-fpm-anarchosyndicalismebook.log` (remplacez `<VERSION>` par la version PHP utilisée par l’application).
