# Calves públicas SSH en LDAP y registro de accesos Linux

## Puesta en marcha
Para crear la red con el servidor y los 5 clientes sigue los siguientes pasos:<br><br>
    1. Instala la última versión de Docker.<br>
    2. Acede a la carpeta "dockerCreator" y ejecuta el archivo "./start-app.sh".<br>
    3. Este proyecto cuenta con unos usuarios de ejemplo que se crean automaticamente. Se pueden modificar desde la carpeta "ldapConf/compartido/" modificando los archivos "user.ldif" y "group.ldif" Para comprobar que los usuarios se han creado correctamente se puede acceder al servidor ldap con el comando "docker exec -it openldap bash" y dentro usar el comando "slapcat".
    

## Ejecución clasica
Para conectarte a un cliente por SSH debes ejecutar este comando "ssh **usuario**@localhost -p **puerto**". 
**usuario** es el usuario del servidor ldap al que te quieres conectar, con los datos de ejemplo puede ser javier, mark, lorea, maite, olatz, mikel o mario.<br>
**puerto** es el cliente al que te quieres conectar. Son numeros del 221 al 225. Siendo el 221 el client1, 222 el client2... 
Luego solicitara la contraseña de usuario, esta con los datos de ejemplo es "**usuario**Pass".