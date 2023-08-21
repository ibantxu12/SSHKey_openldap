echo "Script started" >> /tmp/send_ssh_log_debug.log
LOG_SERVER="ssh_log"
LOG_PORT=514

# Obtener la hora actual
CURRENT_TIME=$(date +"%Y-%m-%d %H:%M:%S")

# Obtener el nombre de usuario y el nombre del servidor
USERNAME="$PAM_USER"
SERVER_NAME=$(hostname)

# Enviar la información al servidor log
echo "$CURRENT_TIME $SERVER_NAME $USERNAME" | nc -w1 -q1 "$LOG_SERVER" "$LOG_PORT"
