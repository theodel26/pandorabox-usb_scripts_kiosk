#!/bin/bash

# Configuration
LOG_FILE="/var/log/reboot_history.log"
LOCKOUT_TIME=2400  # Sécurité de 40 minutes pour éviter les reboots en boucle

# 1. Sécurité anti-boucle (Basée sur l'uptime)
UPTIME_SECONDS=$(awk '{print $1}' /proc/uptime | cut -d. -f1)

if [ "$UPTIME_SECONDS" -lt "$LOCKOUT_TIME" ]; then
    # Le système a redémarré il y a moins de 40 minutes, on ignore
    exit 0
fi

# 2. Détection par montage système (Plus fiable que ls -A)
# On vérifie si un périphérique physique est réellement monté dans /media/pandoraa/
if mount | grep -q "/media/pandoraa/"; then
    # Une vraie clé est branchée et active
    echo "$(date '+%Y-%m-%d %H:%M:%S') : REBOOT ANNULÉ - Clé physique détectée." >> "$LOG_FILE"
else
    # Aucun périphérique monté (ton dossier USB_TEST_FAKE est ignoré car ce n'est pas un disque)
    echo "$(date '+%Y-%m-%d %H:%M:%S') : AUCUNE CLÉ - Redémarrage système en cours..." >> "$LOG_FILE"
    /sbin/shutdown -r now
fi
