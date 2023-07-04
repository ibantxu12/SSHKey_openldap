## Apuntes para la memoria


He útilizado osixia/openldap como como servidor LDAP en docker. Para los clientes he tilizado ubuntu:latest. 

El servidor LDAP expone los puertos 386 y 636 para permitir las conexiones LDAP y LSAPS.

Cada cliente (client1 a client7) se crea utilizando la imagen de Ubuntu y se ejecuta el comando tail -f /dev/null para mantener el contenedor en ejecución.

Se crean dos volúmenes, openldap-data y openldap-config, para almacenar los datos y la configuración del servidor OpenLDAP, respectivamente.


Ejecución: docker-compose up -d

Ejecución de los contenedores: docker exec -it <nombre_contenedor> bash

