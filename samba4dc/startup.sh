#!/bin/bash
sed -i "s/dominioupper/$( echo $DOMINIO | tr '[:lower:]' '[:upper:]' )/;\
s/dominiolower/${DOMINIO}/;\
s/servidordc/${SERVIDORDC}/;" /etc/krb5.conf
sed -i "\
s/domminiolocalupper/$( echo $DOMINIO | cut -f 1 -d '.' | tr '[:lower:]' '[:upper:]' )/;\
s/dominioupper/$( echo $DOMINIO | tr '[:lower:]' '[:upper:]' )/;\
s/servidorlinuxupper/$( echo $SERVIDORLINUX | tr '[:lower:]' '[:upper:]' )/;\
s/interfacerede/${INTERFACEREDE}/;\
s/dominiolocal/$( echo $DOMINIO | cut -f 1 -d '.')/;\
s/dnsforwardip/${DNSFORWARDIP}/;\
" /etc/samba/smb.conf
cat /etc/samba/smb.conf
cat /etc/krb5.conf
#/usr/bin/samba-tool domain join $DOMINIO DC --realm=$( echo $DOMINIO | tr '[:lower:]' '[:upper:]' )  -U "$USUARIO"  -W $DOMINIO --password="$PASSWORD"
#/usr/sbin/samba -i
#samba-tool dns add ${SERVIDORDC}.${DOMINIO} $DOMINIO ${SERVIDORLINUX}.${DOMINIO} A $IPSERVIDORLINUX -U${USUARIO} --password $PASSWORD
#cnamelinux=$(ldbsearch -H /var/lib/samba/private/sam.ldb '(invocationId=*)' --cross-ncs objectguid | grep -i -A 1 {{ servidorlinux }} | grep -i objectguid | cut -f 2 -d ":" )
#samba-tool dns add ${SERVIDORDC}.${DOMINIO}  _msdcs.${DOMINIO} $cnamelinux CNAME ${SERVIDORLINUX}.${DOMINIO} -U${USUARIO} --password $PASSWORD
#samba-tool ntacl sysvolreset
while true
do
    sleep 10
done
