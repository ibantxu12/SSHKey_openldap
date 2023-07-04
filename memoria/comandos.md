ldapadd -x -D cn=admin,dc=ibantfg,dc=com -W -f user.ldif
ldapadd -x -D cn=admin,dc=ibantfg,dc=com -W -f grp.ldif


dn: uid=javier,dc=ibantfg,dc=com
objectClass: top
objectClass: posixAccount
objectClass: inetOrgPerson
objectClass: person
cn: jlopez
uid: jlopez
ou: grupo
uidNumber: 2000
gidNumber: 10000
homeDirectory: /home/jlopez
loginShell: /bin/bash
userPassword: Almendras
sn: Lopez
mail: juan.lopez@somebooks.com
givenName: javier

dn: cn=grupo,dc=ibantfg,dc=com
objectClass: top
objectClass: posixGroup
gidNumber: 10000
cn: grupo