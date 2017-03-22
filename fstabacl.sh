#!/bin/bash
sed -i 's/errors=remount-ro/errors=remount-ro,acl,user_xattr,usrquota,grpquota/' /etc/fstab  && /bin/mount -o remount /

