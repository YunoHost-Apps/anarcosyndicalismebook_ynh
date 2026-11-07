# Changelog

## [1.3.1~ynh19] - 2026-11-07
- Alignement de l'ID du paquet sur `anarcosyndicalismebook` en conformité avec le nom du dépôt Codeberg `anarcosyndicalismebook_ynh`.
- Actualisation du mainteneur du paquet (`maintainers = ["AnARCHIS12"]`).
- Montée de version de la pile PHP vers PHP 8.4 contemporain stable (paquets `php8.4-*` déclarés explicitement dans `manifest.toml` avec support `intl` et `opcache`).
- Ajustement de la politique de mot de passe administrateur (minimum 8 caractères, support `ynh_in_ci_tests` pour les tests automatisés du catalogue YunoHost).
- Ajout des logos officiels du CMS au format PNG (512x512) et SVG dans le dossier `doc/`.

## [1.3.1~ynh18] - 2026-11-07
- Mise à jour de la source YunoHost vers la dernière révision de la branche LTS (`release/v1.3.1-lts`, commit `966cee12`).
- Intégration du durcissement de sécurité de l'attribut `data-call` (liste blanche stricte des 40 fonctions autorisées, éliminant les risques de contournement CSP sur les pages CAPTCHA, PR #34).
- Mise à jour du cache Service Worker (`sw.js`).
- Alignement du workflow et des permissions de synchronisation des traductions.
- Checksum de l’archive source recalculé et vérifié.

## [1.3.1~ynh17] - 2026-11-01
- Mise à jour de la source YunoHost vers la branche LTS (`release/v1.3.1-lts`, commit `4c154354`).
- Amélioration du découpage auteur/titre et des métadonnées RSS/OAI-PMH.
- Checksum de l’archive source recalculé et vérifié.

## [1.3.1~ynh16] - 2026-11-01
- Mise à jour de la source YunoHost vers la dernière révision de la branche LTS (`release/v1.3.1-lts`).
- Intégration du support étendu des libellés de langue française pour l'export OAI-PMH (PR #32).
- Normalisation du tag de version pour la vérification et signature des mises à jour.
- Checksum de l’archive source recalculé et vérifié.

## [1.3.1~ynh15] - 2026-10-25
- Mise à jour de la source YunoHost vers la dernière branche LTS (`release/v1.3.1-lts`).
- Intégration du correctif de détection des mises à jour signées de même version.
- Checksum de l’archive source recalculé et vérifié.

## [1.3.1~ynh14] - 2026-10-22
- Alignement de la source YunoHost sur la branche LTS courante (`release/v1.3.1-lts`).
- Intégration des derniers correctifs de sécurité et de compatibilité publiés dans l’application.
- Le paquet YunoHost reste natif : il ne dépend pas d’une image Docker CAP.

## [1.3.1~ynh13] - 2026-10-21
- **Correctif de sécurité critique (PHP 8.4.27)** : Mise à jour de la source vers le commit de sécurité `release/v1.3.1-lts` intégrant le correctif PHP 8.4.27.
- Élimination des vulnérabilités RCE non authentifiées CVE-2026-109618 et CVE-2026-109619.
- Les instances YunoHost utilisant PHP 8.4 sont automatiquement protégées lors de la prochaine mise à jour des paquets système (`apt upgrade`). La mise à jour du paquet YunoHost aligne la source de l'application sur la version sécurisée.

## [1.3.1~ynh4] - 2026-10-19
- Alignement de la source sur la branche LTS publiée de l'application.
- Création initiale du compte administrateur avec mot de passe obligatoire d'au moins 12 caractères.
- Échappement des valeurs avant leur insertion SQL lors de l'installation.
- Documentation des répertoires persistants YunoHost et distinction avec le montage Docker.

## [1.3.1~ynh3] - 2026-10-11
- Alignement de la source sur `main` après la promotion de la bêta 4.
- Intégration du menu actualisé, des migrations et des correctifs d’importation.
- Vérification du checksum de l’archive source figée sur le commit publié.
- Normalisation automatique des anciennes colonnes `menu.nomenu`/`menu.actif` pendant l’upgrade YunoHost.

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

### Mise à jour
Pour mettre à jour depuis une version précédente :
```bash
sudo yunohost app upgrade anarcosyndicalismebook -u https://codeberg.org/Anarcosyndicalismebook/anarcosyndicalismebook_ynh
```
*Note : Cette mise à jour préserve intégralement vos données, configurations et base de données.*
