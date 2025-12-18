# Changelog

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
