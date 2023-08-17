#!/bin/bash

docker-compose up -d
docker exec -it openldap ldapadd -x -D cn=admin,dc=ibantfg,dc=com -w LDAPapTFG -f /root/compartido/user.ldif 
docker exec -it openldap ldapadd -x -D cn=admin,dc=ibantfg,dc=com -w LDAPapTFG -f /root/compartido/group.ldif 