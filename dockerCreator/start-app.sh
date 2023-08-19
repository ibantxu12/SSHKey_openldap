#!/bin/bash

docker-compose up -d
sleep 1
docker exec -it openldap ldapadd -x -D cn=admin,dc=ibantfg,dc=com -w LDAPapTFG -f /root/compartido/user.ldif 