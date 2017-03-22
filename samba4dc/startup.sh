#!/bin/bash
/usr/bin/samba-tool domain join $DOMINIO DC --realm=$( echo $DOMINIO | tr '[:lower:]' '[:upper:]' )  -U "$USUARIO"  -W $DOMINIO --password="$PASSWORD"
/usr/sbin/samba -i
samba-tool dns add ${SERVIDORDC}.${DOMINIO} $DOMINIO ${SERVIDORLINUX}.${DOMINIO} A $IPSERVIDORLINUX -U${USUARIO} --password $PASSWORD
cnamelinux=$(ldbsearch -H /var/lib/samba/private/sam.ldb '(invocationId=*)' --cross-ncs objectguid | grep -i -A 1 {{ servidorlinux }} | grep -i objectguid | cut -f 2 -d ":" )
samba-tool dns add ${SERVIDORDC}.${DOMINIO}  _msdcs.${DOMINIO} $cnamelinux CNAME ${SERVIDORLINUX}.${DOMINIO} -U${USUARIO} --password $PASSWORD
samba-tool ntacl sysvolreset