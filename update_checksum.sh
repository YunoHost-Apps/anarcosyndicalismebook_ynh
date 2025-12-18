#!/bin/bash
# Script pour mettre à jour automatiquement le checksum SHA256 dans manifest.toml
# Usage: ./update_checksum.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MANIFEST_FILE="$SCRIPT_DIR/manifest.toml"

# Extraire l'URL depuis le manifest
URL=$(grep -oP 'url = "\K[^"]+' "$MANIFEST_FILE" | head -1)

if [ -z "$URL" ]; then
    echo "❌ Erreur: Impossible de trouver l'URL dans manifest.toml"
    exit 1
fi

echo "📥 Téléchargement depuis: $URL"
echo "⏳ Calcul du checksum SHA256..."

# Télécharger et calculer le checksum
NEW_SHA=$(curl -sL "$URL" | sha256sum | cut -d' ' -f1)

if [ -z "$NEW_SHA" ]; then
    echo "❌ Erreur: Impossible de calculer le checksum"
    exit 1
fi

echo "🔑 Nouveau SHA256: $NEW_SHA"

# Obtenir l'ancien checksum
OLD_SHA=$(grep -oP 'sha256 = "\K[^"]+' "$MANIFEST_FILE" | head -1)
echo "📋 Ancien SHA256:  $OLD_SHA"

if [ "$NEW_SHA" = "$OLD_SHA" ]; then
    echo "✅ Le checksum est déjà à jour !"
    exit 0
fi

# Mettre à jour le manifest
sed -i "s/sha256 = \"$OLD_SHA\"/sha256 = \"$NEW_SHA\"/" "$MANIFEST_FILE"

echo "✅ manifest.toml mis à jour avec succès !"
echo ""
echo "N'oubliez pas de commit et push les changements :"
echo "  git add manifest.toml"
echo "  git commit -m 'Update source checksum'"
echo "  git push"
