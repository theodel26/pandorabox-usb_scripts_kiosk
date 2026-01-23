#!/bin/bash

# Déplacez-vous dans le répertoire de l'application
cd $HOME/pandora-box

#Décommenter les lignes ci-dessous en cas de soucis avec un écran tactile
#export DISPLAY=:0
#xinput disable 11
#xinput disable 12

#export GTK_IM_MODULE=none
#export QT_IM_MODULE=none
#export CLUTTER_IM_MODULE=none
#export XMODIFIERS="@im=none"

GNOME_SHELL_PID=$(pgrep gnome-shell -u pandoraa | head -n 1)

if [ ! -z "$GNOME_SHELL_PID" ]; then
    export DISPLAY=$(sudo grep -z -E "^DISPLAY=" /proc/$GNOME_SHELL_PID/environ | tr -d '\0' | cut -d= -f2-)
    export XAUTHORITY=$(sudo find /run/user/1001 -name 'gdm' -exec find {} -name 'Xauthority' 2>/dev/null \;)
fi

# 1. Lancer PandoraBox en arrière-plan
$HOME/.local/bin/python3 $HOME/pandora-box/pandora-box.py &
PANDORA_PID=$!

# 2. Lancer le script de surveillance en arrière-plan
# Il surveillera et corrigera le plein écran en continu
$HOME/pandora-box/fullscreen_watcher.sh &
WATCHER_PID=$!

# 3. Attendre que PandoraBox se termine.
# Si PandoraBox se ferme, le script va se terminer et les processus en arrière-plan vont s'arrêter.
wait $PANDORA_PID

# Capture le code de sortie de Pandora
EXIT_STATUS=$?

# 4. Tuer le script de surveillance quand PandoraBox se ferme
kill $WATCHER_PID

# Si le code de sortie nest PAS un succès (0), cela signifie qu'il y a eu un plantage
if [ $EXIT_STATUS -ne 0 ]; then
    /usr/bin/feh --fullscreen --auto-zoom $HOME/pandora-box/images/maintenance.png &
    sleep infinity
fi

exit $EXIT_STATUS
