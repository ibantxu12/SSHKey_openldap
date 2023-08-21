#!/bin/bash

LOG_SERVER="ssh_log"
LOG_PORT=514


CURRENT_TIME=$(date +"%Y-%m-%d %H:%M:%S")
USERNAME="$PAM_USER"
SERVER_NAME=$(hostname)

if [ "$PAM_TYPE" == "open_session" ]; then
    ACTION="conectado a"
else
    ACTION="desconectado de"
fi

echo "$CURRENT_TIME - $USERNAME se ha $ACTION $SERVER_NAME" | nc -w1 -q1 "$LOG_SERVER" "$LOG_PORT"