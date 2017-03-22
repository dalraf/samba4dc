FROM ubuntu
RUN apt-get update 
RUN apt-get install -y samba
RUN apt-get install -y krb5-user
RUN apt-get install -y ldb-tools
RUN apt-get install -y winbind
RUN apt-get install -y libnss-winbind
RUN apt-get install -y libpam-winbind
RUN apt-get install -y iputils-ping
RUN apt-get install -y acl
RUN rm /etc/samba/smb.conf
ADD nsswitch.conf /etc/nsswitch.conf
ADD krb5.conf /etc/krb5.conf
RUN sed -i "s/dominioupper/$( echo $DOMINIO | tr '[:lower:]' '[:upper:]' )/;\
s/dominiolower/${DOMINIO}/;\
s/servidordc/${SERVIDORDC}/;" /etc/krb5.conf
ADD smb.conf /etc/samba/smb.conf
RUN sed -i "\
s/dominiolocalupper/$( echo $DOMINIO | cut -f 1 -d "." | tr '[:lower:]' '[:upper:]' )/;\
s/dominioupper/$( echo $DOMINIO | tr '[:lower:]' '[:upper:]' )/;\
s/servidorlinuxupper/$( echo $SERVIDORLINUX | tr '[:lower:]' '[:upper:]' )/\
;s/interfacerede/${INTERFACEREDE}/;\
;s/dominiolocal/$( echo $DOMINIO | cut -f 1 -d ".")/;\
;s/dnsforwadip/${DNSFORWARDIP}/;\
;s/sysvolpath/${SYSVOLPATH}/;\
;s/netlogonpath/${NETLOGONPATH}/;\
" /etc/samba/smb.conf
ADD startup.sh /
CMD /startup.sh