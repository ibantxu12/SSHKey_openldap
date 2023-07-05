# Calves públicas SSH en LDAP y registro de accesos Linux

## Puesta en marcha
Para crear la red con el servidor y los 5 clientes sigue los siguientes pasos:
    1. Instala la última versión de Docker.
    2. Acede a la carpeta "dockerCreator" y ejecuta el archivo "./start-app.sh".
    3. Este proyecto esta creado con usuarios de ejemplo, para eliminarlos elimina la carpeta "ldapConf". Para crear nuevos accede a openldap con el comando "docker exec -it openldap bash" y crea un archivo .ldif con los nuevos usuarios/grupos, hay ejemplos en la carpeta "ejemplos". Ejecuta el archivo con el comando "ldapadd -x -D cn=admin,dc=ibantfg,dc=com -W -f <archivo>". Para comprobar que los usuarios se han creado correctamente se puede usar el comando "slapcat".

## Ejecución clasica
Para conectarte a un cliente por SSH debes ejecutar este comando "ssh '<'usuario'>'@localhost -p <puerto>". 
<usuario> es el usuario del servidor ldap al que te quieres conectar, con los datos de ejemplo puede ser javier, mark, lorea, maite, olatz, mikel o mario.
<puerto> es el cliente al que te quieres conectar. Son numeros del 221 al 225. Siendo el 221 el client1, 222 el client2... 
Luego solicitara la contraseña de usuario, esta con los datos de ejemplo es "<usuario>Pass".
