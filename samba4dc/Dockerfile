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
RUN /usr/bin/wget -O /opt/clonezilla.iso http://c3sl.dl.osdn.jp/clonezilla/67139/clonezilla-live-2.5.0-25-amd64.iso
ADD startup.sh /
CMD /startup.sh