#!/bin/bash
awk -F: '{ print "user " $1 " has id " $3}' /etc/passwd > work5.log
chage -l root | grep Last >> work5.log
awk -F: '{ print $1 }' /etc/group | tr '\n' ',' >> work5.log
echo "Be careful!" >> /etc/skel/readme.txt
useradd u1 -p $(openssl passwd -crypt 12345678)
groupadd g1
usermod -G g1 u1
echo -n "user u1 has id $(id -u u1) \n user u1 is a part of groups $(groups u1)" >> work5.log
usermod -G g1 trofiv
grep ^g1 /etc/group | awk -F: '{ print $4 }' | tr '\n' ',' >> work5.log
usermod -s /usr/bin/mc u1
useradd u2 -p $(openssl passwd -crypt 12345678)
mkdir /home/test13 && cp work5.log /home/test13/work5-1.log && cp work5.log /home/test13/work5-2.log
chown u1 /home/test13 && groupadd test && usermod -G test u1 && usermod -G test u2 && chgrp test /home/test13 && chmod -R a-rwx /home/test13 && chmod -R g+r /home/test13 && chmod -R u+rw /home/test13 && chmod -R o-rwx /home/test13
mkdir /home/test15 && chown u1 /home/test15 && chmod -rwxrwxrwt /home/test15
cp /usr/bin/nano /home/test15/nano && chmod a+s /home/test15/nano
