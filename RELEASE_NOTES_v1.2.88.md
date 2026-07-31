# Notes de version AnarcosyndicalismeBOOK (YunoHost) - v1.2.88~ynh1

Cette version synchronise le paquet YunoHost avec le cœur applicatif **v1.2.88**.

## 🛠️ Nouveautés & Corrections Majeures

### 📚 Import OPDS / Calibre (*The Anarchist Library*, *Standard Ebooks*, etc.)
- **Correction des requêtes HTTP 404** : Intégration de la fonction `resolveOpdsUrl` pour reconstruire proprement les URL relatives (`next_url`, `epub_url`, `pdf_url`, `cover_url`) sans altérer le chemin du flux `/opds/`.
- **Exploration automatique des catalogues d'index** : Si le serveur distant propose un flux d'accueil composé de sous-rubriques (Titres, Auteurs, etc.), le système explore automatiquement les sous-catalogues pour extraire les livres.

---

## 📦 Mise à jour
Pour mettre à jour sur YunoHost :
```bash
sudo yunohost app upgrade anarchosyndicalismebook -u https://gitlab.com/anarchymedialibertaire-group/anarcosyndicalismebook_ynh --no-safety-backup
```

---
*Date : 31/07/2026*  
*Version Upstream : 1.2.88*  
