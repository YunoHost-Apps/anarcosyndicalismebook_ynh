# Notes de version AnarcosyndicalismeBOOK (YunoHost) - v1.2.87~ynh1

Cette version synchronise le paquet YunoHost avec le cœur applicatif **v1.2.87**.

## 🛠️ Nouveautés & Corrections Majeures

### 📜 1. Gestion des journaux d'erreurs (Logs)
- **Détection dynamique `open_basedir`** : Le visionneur de logs d'administration s'adapte automatiquement à l'isolation `open_basedir` de YunoHost.
- **Journal applicatif local (`../logs/error.log`)** : Le fichier est créé et utilisé automatiquement pour l'enregistrement des événements PHP accessibles dans l'interface web.
- **Support des logs système (`/var/log/`)** : Si un log système non lisible par le serveur web est sélectionné, l'interface affiche une note guidée et la commande SSH exacte (`sudo tail -n 100 /var/log/nginx/error.log`).

### 📚 2. Import OPDS / Calibre (*The Anarchist Library*, *Standard Ebooks*, etc.)
- **Suivi des redirections cURL sous `open_basedir`** : Résolution manuelle des redirections HTTP 301/302 en PHP pour éviter les échecs cURL sous YunoHost.
- **Prise en charge des catalogues OPDS génériques** : Connexion directe aux flux d'acquisition OPDS sans dépendre des routes de l'application Calibre de bureau.
- **Parsing XML & Multi-auteurs** : Extraction complète de tous les auteurs par ouvrage et compatibilité avec les namespaces Dublin Core (`dc:elements/1.1/` et `dc:terms/`).
- **Import `metadata.db` natif (PHP PDO SQLite)** : Remplacement de l'exécution de la commande système `sqlite3` CLI par l'extension native PHP `PDO_SQLite`.

---

## 📦 Mise à jour
Pour mettre à jour sur YunoHost :
```bash
yunohost app upgrade anarchosyndicalismebook
```

---
*Date : 31/07/2026*  
*Version Upstream : 1.2.87*  
