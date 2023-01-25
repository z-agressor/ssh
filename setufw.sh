#!/bin/bash
#Настроить UFW
#443 порт для сервисов https
ufw allow proto tcp from any to any port 443
#60943 альтернативный https порт
ufw allow proto tcp from any to any port 60943
#60942 альтернативный https порт
ufw allow proto tcp from any to any port 60944
#60980 альтернативный http порт
ufw allow proto tcp from any to any port 60980
#60988 порт прокси
ufw allow proto tcp from any to any port 60988
#60922 альтернативный SSH порт 
ufw allow proto tcp from any to any port 60922
#60922 альтернативный FTP порт 
ufw allow proto tcp from any to any port 60921
#51820-30 UDP порты WireGuard 
ufw allow 51820:51830/udp
#51820-30 TCP порты для разных нужд
ufw allow 60950:60970/tcp
ufw allow 60950:60970/udp
ufw enable
#включить маршрутизацию в файле /etc/sysctl.conf
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
#разрешить маршрутизацию
echo 1 > /proc/sys/net/ipv4/ip_forward
#разрешить форвардинг в iptables
iptables -P FORWARD ACCEPT
#перезапустить сервис iptables
systemctl restart iptables
#перезапустить сеть
systemctl restart networking
#перезапустить сервис ufw
systemctl restart ufw
#перезапустить сервис sshd
systemctl restart sshd
#перезапустить сервис ssh
systemctl restart ssh
./configubnt.sh
rm -R setufw.sh
exit
