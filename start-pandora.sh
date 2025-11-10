#!/bin/bash

# Déplacez-vous dans le répertoire de l'application
cd $HOME/pandora-box

# 1. Lancer PandoraBox en arrière-plan
$HOME/.local/bin/python3 $HOME/pandora-box/pandora-box.py &
PANDORA_PID=$!

# 2. Lancer le script de surveillance en arrière-plan
$HOME/pandora-box/fullscreen_watcher.sh &
WATCHER_PID=$!

# 3. Attendre que PandoraBox se termine.
# Si PandoraBox se ferme, le script va se terminer et les processus en arrière-plan vont s'arrêter.
wait $PANDORA_PID

# 4. Tuer le script de surveillance quand PandoraBox se ferme
kill $WATCHER_PID
