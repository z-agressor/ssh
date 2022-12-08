#!/bin/bash
#Проверка
#Назначить переменной значение из файла /root/.ssh/authorized_keys
testkeys=$(cat /root/.ssh/authorized_keys)
#Сравнить ключи с значениями переменной keys
if [ "$testkeys" = "$keys" ]; then
echo "Ключи SSH установлены"
else
echo "Ключи SSH не установлены"
fi
#Назначить переменной значение из файла /etc/ssh/sshd_config
testconfig=$(cat /etc/ssh/sshd_config)
#Сравнить ключи с значениями переменной keys
if [ "$testconfig" = "$config" ]; then
echo "Конфигурация SSH установлена"
else
echo "Конфигурация SSH не установлена"
fi
#Назначить переменной значение из файла /etc/profile.d/baners.sh
testbanner=$(cat /etc/profile.d/baners.sh)
#Сравнить ключи с значениями переменной keys
if [ "$testbanner" = "$banner" ]; then
echo "Банеры установлены"
else
echo "Банеры не установлены"
fi
#Выыести список правил ufw
ufw status
#Выыести список правил iptables
iptables -L -n -v
#Вывести значение forward в файле /proc/sys/net/ipv4/ip_forward
cat /proc/sys/net/ipv4/ip_forward
#Вывести значение forward в файле /etc/sysctl.conf
cat /etc/sysctl.conf
#Выход
exit
