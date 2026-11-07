#!/bin/bash
# Script pour mettre à jour automatiquement le checksum SHA256 dans manifest.toml
# Usage: ./update_checksum.sh [commit_ou_url]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MANIFEST_FILE="$SCRIPT_DIR/manifest.toml"

# Si un argument est passé, mettre à jour l'URL si c'est un hash ou une URL
if [ -n "$1" ]; then
    TARGET="$1"
    if [[ "$TARGET" =~ ^https?:// ]]; then
        sed -i "s|^[[:space:]]*url[[:space:]]*=.*|    url = \"$TARGET\"|" "$MANIFEST_FILE"
    elif [[ "$TARGET" =~ ^[0-9a-f]{7,40}$ ]]; then
        NEW_URL="https://codeberg.org/Anarcosyndicalismebook/anarcosyndicalismebook/archive/${TARGET}.tar.gz"
        sed -i "s|^[[:space:]]*url[[:space:]]*=.*|    url = \"$NEW_URL\"|" "$MANIFEST_FILE"
    fi
fi

# Extraire l'URL de la source principale depuis le manifest
URL=$(awk '
    /^[[:space:]]*\[resources\.sources\.main\][[:space:]]*$/ { in_main=1; next }
    /^[[:space:]]*\[/ { in_main=0 }
    in_main && /^[[:space:]]*url[[:space:]]*=/ {
        line=$0
        sub(/^[[:space:]]*url[[:space:]]*=[[:space:]]*"/, "", line)
        sub(/".*$/, "", line)
        print line
        exit
    }
' "$MANIFEST_FILE")

if [ -z "$URL" ]; then
    echo "✕ Erreur: Impossible de trouver l'URL dans manifest.toml"
    exit 1
fi

echo "› Telechargement depuis: $URL"
echo "› Calcul du checksum SHA256..."

# Telecharger et calculer le checksum
NEW_SHA=$(curl -sL "$URL" | sha256sum | cut -d' ' -f1)

if [ -z "$NEW_SHA" ]; then
    echo "✕ Erreur: Impossible de calculer le checksum"
    exit 1
fi

echo "› Nouveau SHA256: $NEW_SHA"

# Obtenir l'ancien checksum
OLD_SHA=$(awk '
    /^[[:space:]]*\[resources\.sources\.main\][[:space:]]*$/ { in_main=1; next }
    /^[[:space:]]*\[/ { in_main=0 }
    in_main && /^[[:space:]]*sha256[[:space:]]*=/ {
        line=$0
        sub(/^[[:space:]]*sha256[[:space:]]*=[[:space:]]*"/, "", line)
        sub(/".*$/, "", line)
        print line
        exit
    }
' "$MANIFEST_FILE")
echo "› Ancien SHA256:  $OLD_SHA"

if [ "$NEW_SHA" = "$OLD_SHA" ]; then
    echo "✓ Le checksum est deja a jour !"
    exit 0
fi

# Mettre a jour le manifest
sed -i "s/sha256 = \"$OLD_SHA\"/sha256 = \"$NEW_SHA\"/" "$MANIFEST_FILE"

echo "✓ manifest.toml mis a jour avec succes !"
echo ""
echo "N'oubliez pas de commit et push les changements :"
echo "  git add manifest.toml"
echo "  git commit -m 'Update source checksum'"
echo "  git push"
