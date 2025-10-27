#!/bin/bash

# VÉRIFIEZ ET DÉFINISSEZ LE NOM DE L'UTILISATEUR ICI
PANDORA_USER="user"

# Déplacez-vous dans le répertoire de l'application
cd /home/$PANDORA_USER/pandora-box

# 1. Lancer PandoraBox en arrière-plan
/home/$PANDORA_USER/.local/bin/python3 /home/$PANDORA_USER/pandora-box/pandora-box.py &
PANDORA_PID=$!

# 2. Lancer le script de surveillance en arrière-plan
# Il surveillera et corrigera le plein écran en continu
/home/$PANDORA_USER/pandora-box/fullscreen_watcher.sh &
WATCHER_PID=$!

# 3. Attendre que PandoraBox se termine.
# Si PandoraBox se ferme, le script va se terminer et les processus en arrière-plan vont s'arrêter.
wait $PANDORA_PID

# 4. Tuer le script de surveillance quand PandoraBox se ferme
kill $WATCHER_PID
