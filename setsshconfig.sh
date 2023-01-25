#!/bin/bash
#перезаписать файл /etc/ssh/sshd_config
config=$(curl -s https://raw.githubusercontent.com/z-agressor/ssh/main/sshd_config)
echo $config > /etc/ssh/sshd_config
systemctl restart sshd
./configubnt.sh
exit
