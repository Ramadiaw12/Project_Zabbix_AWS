#!/bin/bash
# Script d'installation de l'agent Zabbix sur Linux

wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-4+ubuntu22.04_all.deb
sudo dpkg -i zabbix-release_6.0-4+ubuntu22.04_all.deb
sudo apt update
sudo apt install -y zabbix-agent2 zabbix-agent2-plugin-*
sudo systemctl enable zabbix-agent2