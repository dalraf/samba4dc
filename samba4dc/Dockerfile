FROM ubuntu
RUN apt-get update 
RUN apt-get install -y samba
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y krb5-user
RUN apt-get install -y ldb-tools
RUN apt-get install -y winbind
RUN apt-get install -y libnss-winbind
RUN apt-get install -y libpam-winbind
RUN apt-get install -y iputils-ping
RUN apt-get install -y acl
ADD nsswitch.conf /etc/nsswitch.conf
ADD krb5.conf /etc/krb5.conf
ADD smb.conf /etc/samba/smb.conf
ADD startup.sh /
CMD /startup.sh