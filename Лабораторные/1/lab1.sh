#!/bin/bash
mkdir ~/test
ls -aRF ~ > ~/test/list
mkdir ~/test/links
ln ~/test/list ~/test/links/list_link
rm ~/test/list
cat ~/test/links/list_link
ln ~/test/links/list_link ~/list1
sudo find /etc -name *.conf > ~/list_conf
sudo find /etc -name *.d -type d > ~/list_d
cat ~/list_conf ~/list_d > ~/list_conf_d
ln -s ~/list_conf_d ~/test/links/list_conf_d_link
ln -L ~/list1 ~/test/links/links_list1
less ~/test/links/list_conf_d_link
mkdir ~/test/.sub
cp ~/list_conf_d ~/test/.sub/
cp -b ~/list_conf_d ~/test/.sub/
mv ~/test/.sub/list_conf_d ~/test/.sub/list_etc
rm ~/list_conf_d
cat ~/test/links/list_conf_d_link
cal -y > ~/test/calendar.txt
head -10 ~/test/calendar.txt
ls -aR ~/test
sudo find / -samefile ~/test/links/list_link 2> /dev/null | wc -l
man man > ~/man.txt
split -b 1024 ~/man.txt
mkdir ~/man.dir
mv ~/x* ~/man.dir
cat ~/man.dir/x* > ~/man.dir/man.txt
cmp ~/man.txt ~/man.dir/man.txt && echo "OK"
echo -e "yep\nyep yep\nyep yep yep\n$(cat ~/man.txt)\nyep yep yep\nyep yep\nyep" > ~/man.txt
diff ~/man.dir/man.txt ~/man.txt > ~/diff.txt
mv ~/diff.txt ~/man.dir/diff.txt
patch ~/man.dir/man.txt ~/man.dir/diff.txt
cmp ~/man.txt ~/man.dir/man.txt && echo "OK"
read
rm -r list1  list_conf  list_d  man.dir  man.txt  test
