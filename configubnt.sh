#!/bin/bash
#Colours
red="\033[00;31m"
RED="\033[01;31m"
green="\033[00;32m"
GREEN="\033[01;32m"
brown="\033[00;33m"
YELLOW="\033[01;33m"
blue="\033[00;34m"
BLUE="\033[01;34m"
purple="\033[00;35m"
PURPLE="\033[01;35m"
cyan="\033[00;36m"
CYAN="\033[01;36m"
white="\033[00;37m"
WHITE="\033[01;37m"
magenta="\033[00;35m"
MAGENTA="\033[01;35m"
black="\033[00;30m"
BLACK="\033[01;30m"
NC="\033[00m"
#Меню выбора комманд
echo -e "${RED}     _       ____   ____    _____   ____    ____     ___    ____   "
echo -e "${RED}    / \     / ___| |  _ \  | ____| / ___|  / ___|   / _ \  |  _ \  "
echo -e "${RED}   / _ \   | |  _  | |_) | |  _|   \___ \  \___ \  | | | | | |_) |  "
echo -e "${RED}  / ___ \  | |_| | |  _ <  | |___   ___) |  ___) | | |_| | |  _ <  "
echo -e "${RED} /_/   \_\  \____| |_| \_\ |_____| |____/  |____/   \___/  |_| \_\  "
echo -e "${WHITE} ##################${BLACK} ##################"
echo -e "${BLUE} ##################${YELLOW} ##################"
echo -e "${RED} ##################${WHITE} ##################"
echo -e "${NC} "
echo " "
echo " " 
echo -e "${GREEN} Выберите команду:"
echo -e "${BLUE}1. Установить SSH ключи"
echo -e "${BLUE}2. Установить SSH конфиг"
echo -e "${BLUE}3. Установить баннер SSH сервера"
echo -e "${PURPLE}4. Настраиваем UFW"
echo -e "${GREEN}5. Установить Hostname и пароль root"
echo -e "${CYAN}8. Установить все"
echo -e "${MAGENTA}9. Запустить проверку"
echo -e "${RED}10. Выход"
echo -e "${NC} "
read -p "Введите команду: " command
#Установить SSH ключи
if [ "$command" = "1" ]; then
wget --cache=off https://raw.githubusercontent.com/z-agressor/ssh/main/setkey.sh&&chmod +x setkey.sh&&./setkey.sh
fi
#Установить SSH конфиг
if [ "$command" = "2" ]; then
wget --cache=off https://raw.githubusercontent.com/z-agressor/ssh/main/setsshconfig.sh&&chmod +x setsshconfig.sh&&./setshhconfig.sh
fi
#Настроить баннер SSH сервера
if [ "$command" = "3" ]; then
wget --cache=off https://raw.githubusercontent.com/z-agressor/ssh/main/setbanner.sh&&chmod +x setbanner.sh&&./setbanner.sh
fi
#Настроить UFW
if [ "$command" = "4" ]; then
wget --cache=off https://raw.githubusercontent.com/z-agressor/ssh/main/setufw.sh&&chmod +x setufw.sh&&./setufw.sh
fi
#Установить Hostname и пароль root
if [ "$command" = "5" ]; then
#Установить Hostname
read -p "Введите Hostname: " hostname
hostnamectl set-hostname $hostname
#Установить пароль root
read -p "Введите пароль root: " password
echo "root:$password" | chpasswd
fi
#Установить все
if [ "$command" = "8" ]; then
wget --cache=off https://raw.githubusercontent.com/z-agressor/ssh/main/setkey.sh&&chmod +x setkey.sh&&./setkey.sh
wget --cache=off https://raw.githubusercontent.com/z-agressor/ssh/main/setsshconfig.sh&&chmod +x setsshconfig.sh&&./setshhconfig.sh
wget --cache=off https://raw.githubusercontent.com/z-agressor/ssh/main/setbanner.sh&&chmod +x setbanner.sh&&./setbanner.sh
wget --cache=off https://raw.githubusercontent.com/z-agressor/ssh/main/setufw.sh&&chmod +x setufw.sh&&./setufw.sh
 fi
#Выполнить проверку установленных значений
if [ "$command" = "9" ]; then
wget --cache=off https://raw.githubusercontent.com/z-agressor/ssh/main/checksetings.sh&&chmod +x checksetings.sh&&./checksetings.sh
    
    fi    
#Выход
if [ "$command" = "10" ]; then
exit
fi
exit
