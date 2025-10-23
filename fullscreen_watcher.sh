#!/bin/bash

# Rendre le script plus robuste pour trouver l'ID de la fenêtre fim
CIBLAGE="fim:"

while true; do
    # Tenter de trouver l'ID de la fenêtre fim
    WINDOW_ID=$(wmctrl -l | grep -i "$CIBLAGE" | awk '{print $1}' | head -n 1)

    if [ ! -z "$WINDOW_ID" ]; then
        # 1. Appliquer le plein écran (wmctrl est la méthode la plus fiable)
        wmctrl -i -b add,fullscreen -r "$WINDOW_ID"

        # 2. Synchronisation des données (SOLUTION DU PROBLÈME D'I/O)
        # Ceci force le noyau à vider son cache d'écriture.
        /bin/sync

        # 3. Délai de correction (Augmenté pour plus de stabilité/moins de charge)
        # Utilisons 0.2s pour garantir la synchronisation du cache et moins de charge.
        sleep 0.2
    else
        # 4. Délai de recherche rapide (pour ne pas attendre au lancement)
        sleep 0.05
    fi
done
