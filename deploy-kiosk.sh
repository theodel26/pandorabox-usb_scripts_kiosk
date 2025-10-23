#!/bin/bash

# VÉRIFIEZ ET DÉFINISSEZ LE NOM DE L'UTILISATEUR ICI
PANDORA_USER="user"

# Vérifier si l'utilisateur est root (nécessaire pour les droits)
if [ "$EUID" -ne 0 ]; then 
  echo "Veuillez exécuter ce script avec sudo."
  exit 1
fi

echo "--- Démarrage du déploiement de la configuration Kiosk ---"

# --- 1. Installation du Script de Démarrage et du Watcher ---
echo "1. Déplacement des scripts d'exécution..."

# Script d'exécution (doit être exécutable)
cp start-pandora.sh /home/$PANDORA_USER/start-pandora.sh
chmod +x /home/$PANDORA_USER/start-pandora.sh
chown $PANDORA_USER:$PANDORA_USER /home/$PANDORA_USER/start-pandora.sh

# Script de surveillance (doit être exécutable)
cp fullscreen_watcher.sh /home/$PANDORA_USER/pandora-box/fullscreen_watcher.sh
chmod +x /home/$PANDORA_USER/pandora-box/fullscreen_watcher.sh
chown $PANDORA_USER:$PANDORA_USER /home/$PANDORA_USER/pandora-box/fullscreen_watcher.sh


# --- 2. Installation du Fichier Autostart GNOME ---
echo "2. Installation du fichier Autostart (.desktop)..."

# Crée le répertoire autostart s'il n'existe pas
mkdir -p /home/$PANDORA_USER/.config/autostart
chown $PANDORA_USER:$PANDORA_USER /home/$PANDORA_USER/.config/autostart

# Copie le fichier .desktop
cp pandora-box.desktop /home/$PANDORA_USER/.config/autostart/pandora-box.desktop
chown $PANDORA_USER:$PANDORA_USER /home/$PANDORA_USER/.config/autostart/pandora-box.desktop

echo "--- Déploiement Terminé. Redémarrage requis pour appliquer les changements. ---"

#modif pour permission
