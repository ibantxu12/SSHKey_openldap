## Apuntes para la memoria


El servidor LDAP expone los puertos 386 y 636 para permitir las conexiones LDAP y LSAPS.

Cada cliente (client1 a client7) se crea utilizando la imagen de Ubuntu y se ejecuta el comando tail -f /dev/null para mantener el contenedor en ejecución. Los he metido en en la misma red, he instalado ssh y el cliente ldap. Despues los he añadido a la maquina openldap y he creado una imagen a partir de ese contenedor.


Ejecución de los contenedores: docker exec -it <nombre_contenedor> bash

- ./ldapConf/slapd/config:/etc/ldap/slapd.d
- ./ldapConf/certificates:/container/service/slapd/assets/certs
- ./ldapConf/ssh:/etc/ssh/

    volumes:
      - ./ldapConf/log:/var/log
      
auth sufficient pam_exec.so /bin/echo "Executed" >> /tmp/pam_executed.log
#auth sufficient pam_exec.so /usr/local/bin/scripts/sendLog.sh
#auth sufficient pam_exec.so /usr/local/bin/scripts/getSSHKey.sh