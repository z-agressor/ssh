#!/bin/bash
#Colours
red="\033[00;31m"
RED="\033[01;31m"
green="\033[00;32m"
GREEN="\033[01;32m"
yellow="\033[00;33m"
YELLOW="\033[01;33m"
blue="\033[00;34m"
BLUE="\033[01;34m"
magenta="\033[00;35m"
MAGENTA="\033[01;35m"
cyan="\033[00;36m"
CYAN="\033[01;36m"
white="\033[00;37m"
WHITE="\033[01;37m"
#Конец цветов
#Установить значения переменных
keys=$(curl -s https://raw.githubusercontent.com/z-agressor/ssh/main/authorized_keys | grep -oP 'href="\K[^"]+')
config=$(curl -s https://raw.githubusercontent.com/z-agressor/ssh/main/sshd_config | grep -oP 'href="\K[^"]+')
banner=$(curl -s https://raw.githubusercontent.com/z-agressor/ssh/main/baners.sh | grep -oP 'href="\K[^"]+')
#Проверка
#Назначить переменной значение из файла /root/.ssh/authorized_keys
testkeys=$(cat /root/.ssh/authorized_keys)
#Сравнить ключи с значениями переменной keys
if [ "$testkeys" = "$keys" ]; then
echo -e "${GREEN} Ключи SSH установлены"
else
echo -e "${RED}Ключи SSH не установлены"
fi
#Назначить переменной значение из файла /etc/ssh/sshd_config
testconfig=$(cat /etc/ssh/sshd_config)
#Сравнить ключи с значениями переменной keys
if [ "$testconfig" = "$config" ]; then
echo -e "${GREEN}Конфигурация SSH установлена"
else
echo -e "${RED}Конфигурация SSH не установлена"
fi
#Назначить переменной значение из файла /etc/profile.d/baners.sh
testbanner=$(cat /etc/profile.d/baners.sh)
#Сравнить ключи с значениями переменной keys
if [ "$testbanner" = "$banner" ]; then
echo -e "${GREEN}Банеры установлены"
else
echo -e "${RED}Банеры не установлены"
fi
#Выыести список правил ufw
ufw status
#Выыести список правил iptables
iptables -L -n -v
#Получить строку из файла /etc/sysctl.conf с параметром net.ipv4.ip_forward
testipf=$(cat /etc/sysctl.conf | grep net.ipv4.ip_forward)
echo -e "{$MAGENTA} $testipf"
#Выыести на экран значение из файла /proc/sys/net/ipv4/ip_forward
echo -e "{$MAGENTA} cat /proc/sys/net/ipv4/ip_forward"
./configubnt.sh
#Выход
exit
