#!/bin/bash

USERNAME="$PAM_USER"
REMOTE_IP="$PAM_RHOST"


LOG_FILE="/var/log/ldap_auth.log"

echo "$(date) - Usuario $USERNAME autenticado desde $REMOTE_IP" >> "$LOG_FILE"
#echo "Usuario $USERNAME se autenticó desde $REMOTE_IP." | mail -s "Alerta de autenticación LDAP" ibantxu12@hotmail.com
