# Calves públicas SSH en LDAP y registro de accesos Linux

## Puesta en marcha
Para crear la red con el servidor y los 5 clientes sigue los siguientes pasos:<br><br>
    1. Instala la última versión de Docker.<br>
    2. Acede a la carpeta "dockerCreator" y ejecuta el archivo "./start-app.sh".<br>
    3. Este proyecto cuenta con unos usuarios de ejemplo que se crean automaticamente. Se pueden modificar desde la carpeta "ldapConf/compartido/" modificando los archivos "user.ldif" y "group.ldif" Para comprobar que los usuarios se han creado correctamente se puede acceder al servidor ldap con el comando "docker exec -it openldap bash" y dentro usar el comando "slapcat".

## Parada
Para parar el servicio y resetearlo basta con acceder a la carpeta "dockerCreator" y ejecuta el archivo "./stop-app.sh".
    

## Ejecución clasica
Para conectarte a un cliente por SSH debes ejecutar este comando "ssh **usuario**@localhost -p **puerto**". 
**usuario** es el usuario del servidor ldap al que te quieres conectar, con los datos de ejemplo puede ser javier, mark, lorea, maite, olatz, mikel o mario.<br>
**puerto** es el cliente al que te quieres conectar. Son numeros del 221 al 225. Siendo el 221 el client1, 222 el client2... 
Luego solicitara la contraseña de usuario, esta con los datos de ejemplo es "**usuario**Pass".

## Ejecución con clave
Para conectarte a un cliente mediante la clave privada basta con ejecutar el mismo comando que en la ejecución clasica pero con el apartado -i "ssh -i keys/**usuario** **usuario**@localhost -p **puerto**".
Las claves estan guardas en una carpeta compartida con el servidor LDAP pero hay un enlace en "dockerCreator/keys".
Si se acaban de iniciar las maquinas o se ha cambiado algo, hara que esperar 1 minuto a que los datos se actualicen.