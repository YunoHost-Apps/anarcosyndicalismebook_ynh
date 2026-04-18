# Notes de version AnarcosyndicalismeBOOK (YunoHost) - v1.2.56~ynh1

Cette version marque une étape majeure dans l'évolution du projet en synchronisant le paquet YunoHost avec le cœur applicatif **v1.2.56**.

##  Nouveautés Majeures

###  Migration Universelle (Ghost & RSS)
Le module d'importation a été totalement revu. Il permet désormais de migrer du contenu depuis :
- **Ghost CMS** (détection automatique).
- Tout site disposant d'un flux **RSS** ou **Atom** (WordPress, Ghost, blogs statiques).
- Amélioration de la robustesse : le script de migration ne s'arrête plus en cas d'erreur sur un seul article.

###  Design "Anarchiste" Harmonisé
L'ensemble de l'administration a été harmonisée avec la charte graphique du projet :
- Boutons de newsletter et de configuration en **Rouge Anar** (#b22222).
- Onglets et sélecteurs de textes stylisés.
- Meilleure visibilité et contraste des éléments sélectionnés.

###  Améliorations Systèmes
- **Logs persistants** : Un nouveau dossier `logs/` est créé et persisté via le système de données de YunoHost.
- **Support des Médias** : Ajout des extensions `php-gd` et `php-zip` pour une meilleure gestion des images de newsletter et des EPUB.
- **PWA** : Mise à jour du Service Worker pour une meilleure expérience hors-ligne.

##  Mise à jour
Pour mettre à jour, utilisez l'interface d'administration YunoHost ou la ligne de commande :
```bash
yunohost app upgrade anarchosyndicalismebook
```

---
*Date : 18/04/2026*
*Version Upstream : 1.2.56*
