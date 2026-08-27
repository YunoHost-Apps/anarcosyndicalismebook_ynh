# Changelog

## [1.3.0~ynh1] - 2026-08-27
- **Mise à jour majeure du cœur** : Passage à AnarcosyndicalismeBOOK `v1.3.0-beta.1`.
- **Intégration CAPTCHA CAP autonome** : Migration complète vers l'alternative éthique et libre CAP (Proof of Work + WebAssembly ultra-rapide) avec support d'instance personnalisée (`CAP_URL`, `CAP_SITE_KEY`, `CAP_SECRET_KEY`).
- **Routage Nginx & URLs propres** : Correction des erreurs 404 avec réécriture automatique vers les fichiers `.php` et gestion des slugs `/lire/`, `/auteur/`, `/categorie/`, `/page/`.
- **Support WebAssembly** : Ajout du support des fichiers `.wasm` sous Nginx pour l'exécution fluide du solveur client.
- **Multilinguisme & Protections** : Intégration des dictionnaires 42 langues et du formulaire public `/soumettre`.
- **Correction d'installation** : Résolution automatique de l'email de l'administrateur via `ynh_user_get_info` pour éviter les erreurs de variable non définie.

## [1.0.22~ynh1] - 2026-07-31
- **App Update** : Mise à jour vers le cœur v1.2.88.
- **Import OPDS / Calibre (Correctif 404)** : Résolution robuste des URL relatives OPDS (`resolveOpdsUrl`) empêchant toute troncature du chemin `/opds/`.
- **Navigation automatique d'index OPDS** : Exploration automatique des sous-catalogues de rubriques si aucun livre direct n'est présent sur le flux d'accueil.

## [1.0.21~ynh1] - 2026-07-31
- **App Update** : Mise à jour vers le cœur v1.2.87.
- **Journaux d'erreurs (Logs)** : Détection dynamique de l'isolation `open_basedir` sous YunoHost/Nginx, priorisation du journal applicatif local (`../logs/error.log`) et message guidé pour l'inspection SSH des logs `/var/log/`.
- **Import OPDS / Calibre** : Prise en charge des redirections cURL HTTP 301/302 sous `open_basedir`, support des flux d'acquisition OPDS (*The Anarchist Library*, etc.), multi-auteurs et namespaces Dublin Core.
- **Import metadata.db Natively** : Utilisation de l'extension native PHP `PDO_SQLite` éliminant la dépendance au binaire `sqlite3` CLI.

## [1.0.20~ynh1] - 2026-04-18
- **App Update** : Mise à jour vers le cœur v1.2.56.
- **Migration** : Support Ghost CMS et flux RSS/Atom activé.
- **Système** : Ajout des dossiers logs et migration automatique.
- **Dépendances** : Installation de php-gd et php-zip incluse.

## [1.0.0~ynh19] - 2025-12-18

### Corrigé
- Correction bug session : 2FA demandé à tort après inscription.

## [1.0.0~ynh18] - 2025-12-18

### Amélioré
- Affichage du titre du site à côté du logo personnalisé.

## [1.0.0~ynh17] - 2025-12-18

### Corrigé
- Correction de l'enregistrement des paramètres SEO dans l'administration.

## [1.0.0~ynh16] - 2025-12-18

### Corrigé
- Correction de l'affichage du QR Code 2FA (remplacement de l'API Google Charts).

## [1.0.0~ynh15] - 2025-12-18

### Ajouté
- Support de l'authentification à deux facteurs (2FA/TOTP).
- Migration automatique de la base de données pour supporter le 2FA.
- Amélioration de l'interface mobile (actions de profil).

## [1.0.0~ynh2] - 2025-12-17

Cette version apporte des correctifs majeurs pour la stabilité, le déploiement et la configuration des emails.

### 🛠 Changements techniques et Corrections
*   **Installation via Git** : Le paquet utilise désormais `git clone` au lieu de télécharger une archive. Cela permet à l'application d'accéder à son historique Git (versioning) et facilite les futures mises à jour via `git pull`.
*   **Correction de la base de données** : Ajout d'une migration automatique pour ajouter la colonne `parent_id` manquante dans la table `menu`, corrigeant l'accès à la page de gestion des menus.
*   **Gestion des Emails améliorée** :
    *   L'adresse d'expédition (`SMTP_FROM`) utilise désormais l'utilisateur SMTP authentifié par défaut (au lieu de l'email admin), résolvant les rejets de mails par les fournisseurs comme Gmail/Outlook (SPF/DKIM).
    *   Ajout d'une option à l'installation pour définir une **Adresse Email de Contact** (destinataire) spécifique, indépendante de l'administrateur.
*   **Correctifs d'application** :
    *   Correction du chemin `require_once` pour `database.php` sur la page `mon-compte.php`.
    *   Mise à jour immédiate des variables de session (Prénom/Nom) après modification du profil.
    *   Installation correcte des dépendances Composer (PHPMailer) lors de l'installation et de la mise à jour.

### 📦 Mise à jour
Pour mettre à jour depuis une version précédente :
```bash
sudo yunohost app upgrade anarchosyndicalismebook -u https://gitlab.com/anarchymedialibertaire-group/anarcosyndicalismebook_ynh
```
*Note : Cette mise à jour migrera automatiquement votre installation d'une version "archive" vers une version "git" en préservant vos données et configurations.*
