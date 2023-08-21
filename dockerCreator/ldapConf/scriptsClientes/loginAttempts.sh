#!/bin/bash

LOG_FILE="/var/log/login_attempts.log"
LOG_SERVER="ssh_log"
LOG_PORT=514


if [[ "$PAM_TYPE" == "open_session" && "$PAM_USER" != "root" && "$PAM_SERVICE" == "sshd" && "$PAM_RHOST" != "" ]]; then
    # Incrementar contador de intentos de inicio de sesión fallidos para el usuario
    echo "$(date '+%Y-%m-%d %H:%M:%S') - User: $PAM_USER, Host: $PAM_RHOST" >> "$LOG_FILE"

    current_time=$(date '+%Y-%m-%d %H:%M')
    current_ip="$PAM_RHOST"
    count=0
    while read -r line; do
        timestamp=$(echo "$line" | awk '{print $1, $2}')
        timestamp=$(echo "$timestamp" | cut -d' ' -f1-2 | rev | cut -c 4- | rev)
        ip=$(echo "$line" | awk '{print $NF}')

        if [[ "$timestamp" == "$current_time" && "$ip" == "$current_ip" ]]; then
            ((count++))
        fi
    done < "$LOG_FILE"

    if [[ "$count" -ge 3 ]]; then
        echo "dentro"
        echo "$(date '+%Y-%m-%d %H:%M:%S') - ATENCION!!!! El host $PAM_RHOST a intentado conectarse 3 veces en el mismo minuto con el usuario $PAM_USER" | nc -w1 -q1 "$LOG_SERVER" "$LOG_PORT"
    fi
fi
