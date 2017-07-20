#/bin/bash
# Senha zabbix user no banco
SENHA="zabbix3"
# Senha do usuário rootmySQL
SENHAROOT="zabbix3_root"
# base do banco
NOMEBANCO="zbx_db"
# Usuário banco
USUARIODB="zbx_db"

# ConfigDB
sudo echo "DBUser=$USUARIODB" > /usr/local/etc/zabbix_server.conf
sudo echo "DBPASSWORD=$SENHA" >> /usr/local/etc/zabbix_server.conf
sudo echo "DBName=$NOMEBANCO" >> /usr/local/etc/zabbix_server.conf
sudo echo "CacheSize=32m" >> /usr/local/etc/zabbix_server.conf

# Parametros de log
sudo echo "DebugLevel=3" >> /usr/local/etc/zabbix_server.conf
sudo echo "PidFile=/tmp/zabbix_server.pid" >> /usr/local/etc/zabbix_server.conf
sudo echo "LogFile=/tmp/zabbix_server.log" >> /usr/local/etc/zabbix_server.conf
sudo echo "TimeOut=3" >> /usr/local/etc/zabbix_server.conf

# Configuracao do ICMP test tool
PATH_FPING=$(which fping)
echo "FpingLocation=$PATH_FPING" >> /usr/local/etc/zabbix_server.conf
