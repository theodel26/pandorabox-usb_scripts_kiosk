#!/bin/bash

# Définition de l'utilisateur (à adapter si besoin)
PANDORA_USER="pandora"
SOURCE_DIR="/home/$PANDORA_USER/pandorabox-usb_scripts_kiosk/french_images"
DEST_DIR="/home/$PANDORA_USER/pandora-box/images"

# Liste des images à remplacer
IMAGES=("bad.png" "ok.png" "key1.png" "key2.png" "key3.png" "key4.png" "key5.png" "wait1.png" "wait2.png" "wait3.png" "wait4.png" "wait5.png" "wait6.png" "wait7.png" "wait8.png" "wait9.png")

echo "--- Bascule de la borne en ANGLAIS ---"

# Boucle pour remplacer les images de l'interface
for img in "${IMAGES[@]}"; do
    if [ -f "$SOURCE_DIR/$img" ]; then
        echo "Remplacement de $img..."
        # On utilise cp pour garder la source intacte
        sudo cp "$SOURCE_DIR/$img" "$DEST_DIR/$img"
        # On remet les droits à l'utilisateur de la borne
        sudo chown $PANDORA_USER:$PANDORA_USER "$DEST_DIR/$img"
    else
        echo "Erreur : $img introuvable dans la source."
    fi
done

# Remplacement spécifique pour l'image de maintenance
echo "Remplacement de l'image de maintenance..."
if [ -f "$SOURCE_DIR/maintenance-fr.png" ]; then
    sudo cp "$SOURCE_DIR/maintenance-fr.png" "$DEST_DIR/maintenance.png"
    # On n'oublie pas les droits ici non plus !
    sudo chown $PANDORA_USER:$PANDORA_USER "$DEST_DIR/maintenance.png"
else
    echo "Erreur : maintenance-fr.png introuvable."
fi

echo "Terminé. Veuillez redémarrer la borne pour appliquer les changements."
