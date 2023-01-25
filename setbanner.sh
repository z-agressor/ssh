#!/bin/bash
#Настроить баннер SSH сервера
#Очистка содержимого файла перед записью в него
cp /dev/null > /etc/profile.d/baners.sh
banner=$(curl -s https://raw.githubusercontent.com/z-agressor/ssh/main/baners.sh)
echo "$banner" > /etc/profile.d/baners.sh
chmod +x /etc/profile.d/baners.sh
systemctl restart sshd
./configubnt.sh
rm -R setbanner.sh
exit
