#!/bin/bash
#Проверить наличие директории /root/.ssh/ и если нет, то создать
if [ ! -d "/root/.ssh/" ]; then
mkdir -p /root/.ssh/
fi
#Проверить наличие файла /root/.ssh/authorized_keys и если нет, то создать
if [ ! -f "/root/.ssh/authorized_keys" ]; then
touch /root/.ssh/authorized_keys
fi
#установить права на файл /root/.ssh/authorized_keys
chmod 644 /root/.ssh/authorized_keys
#установить права на директорию /root/.ssh/
chmod 700 /root/.ssh/
#Очистка содержимого файла перед записью в него
cp /dev/null > /root/.ssh/authorized_keys
keys=$(curl -s https://raw.githubusercontent.com/z-agressor/ssh/main/authorized_keys)
#Для того что бы echo учитывала переносы строк итд должен быть в ковычках
echo "$keys" >> /root/.ssh/authorized_keys
systemctl restart sshd
./configubnt.sh
exit
