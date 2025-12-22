#!/bin/bash

# Définition de l'utilisateur (à adapter si besoin)
PANDORA_USER="pandora"
SOURCE_DIR="/home/$PANDORA_USER/pandorabox-usb_scripts_kiosk/images"
DEST_DIR="/home/$PANDORA_USER/pandora-box/images"

# Liste des images à remplacer
IMAGES=("bad.png" "ok.png" "key1.png" "key2.png" "key3.png" "key4.png" "key5.png" "wait1.png" "wait2.png" "wait3.png" "wait4.png" "wait5.png" "wait6.png" "wait7.png" "wait8.png" "wait9.png")

echo "--- Bascule de la borne en ANGLAIS ---"

for img in "${IMAGES[@]}"; do
    if [ -f "$SOURCE_DIR/$img" ]; then
        echo "Remplacement de $img..."
        # Le 'mv' écrase automatiquement l'ancien fichier dans la destination
        sudo mv "$SOURCE_DIR/$img" "$DEST_DIR/$img"
        # On remet les droits à l'utilisateur de la borne
        sudo chown $PANDORA_USER:$PANDORA_USER "$DEST_DIR/$img"
    else
        echo "Erreur : $img introuvable dans la source."
    fi
done

echo "Terminé. Veuillez redémarrer la borne pour appliquer les changements."
