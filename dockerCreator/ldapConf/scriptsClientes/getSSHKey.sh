#!/bin/bash

LDAP_SERVER="ldap://openldap"
BASE_DN="dc=ibantfg,dc=com"
LDAP_USER="admin"
LDAP_PASSWORD="LDAPapTFG"

LDAP_QUERY="(&(objectClass=posixAccount))"

ldapsearch -x -H "$LDAP_SERVER" -b "$BASE_DN" -D "cn=$LDAP_USER,$BASE_DN" -w "$LDAP_PASSWORD" "$LDAP_QUERY" | while IFS= read -r line; do
    if [[ $line =~ ^dn:\ (.*) ]]; then
        user_dn="${BASH_REMATCH[1]}"
        username=$(echo "$user_dn" | cut -d ',' -f 1 | cut -d '=' -f 2) 
        groups=$(ldapsearch -x -H "$LDAP_SERVER" -b "$BASE_DN" -D "cn=$LDAP_USER,$BASE_DN" -w "$LDAP_PASSWORD" "(memberUid=$username)" "cn" | grep 'cn:' | sed 's/cn:\ //' | head -1)
        user_home="/home/$username"
        
        if [ ! -d "$user_home" ]; then
            mkdir -p "$user_home"
            chown "$username:$groups" "$user_home"
            chmod 700 "$user_home"
        fi

        pubkey=$(ldapsearch -x -H "$LDAP_SERVER" -b "$user_dn" -D "cn=$LDAP_USER,$BASE_DN" -w "$LDAP_PASSWORD" | awk '/^description:/ {flag=1; print; next} flag && NF {print; if ($NF ~ /=$/) flag=0}')
        pubkey="ssh-rsa "$(echo "$pubkey" | sed 's/description: ssh-rsa //'| tr -d '[:space:]')
        
        if [ -n "$pubkey" ]; then
            mkdir -p "$user_home/.ssh"
            chown "$username:$groups" "$user_home/.ssh"
            echo "$pubkey" > "$user_home/.ssh/authorized_keys"
            chown "$username:$groups" "$user_home/.ssh/authorized_keys"
            chmod 600 "$user_home/.ssh/authorized_keys"
            chmod 700 "$user_home/.ssh"
        fi
    fi
done
