#!/bin/bash
#Настроить баннер SSH сервера
banner=$(curl -s https://raw.githubusercontent.com/z-agressor/ssh/main/baners.sh)
echo $banner > /etc/profile.d/baners.sh
chmod +x /etc/profile.d/baners.sh
systemctl restart sshd
./configubnt.sh
exit
