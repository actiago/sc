#/bin/bash
# Variaveis para configuração do zabbix

# Senha zabbix user no banco
SENHA="zabbix3"
# Senha do usuário rootmySQL
SENHAROOT="zabbix3_root"
# base do banco
NOMEBANCO="zbx_db"
# Usuário banco 
USUARIODB="zbx_db"
# Localização do cód-fonte do Zabbix
SOURCE_DIR="~/zabbix/zabbix-3.2.7"


# Criar banco
#echo "create database $NOMEBANCO character set utf8;" | mysql -uroot -p$SENHAROOT

# Grant privileges
echo "GRANT ALL PRIVILEGES ON $NOMEBANCO.* TO $USUARIODB@localhost IDENTIFIED BY '$SENHA' WITH GRANT OPTION;" | mysql -uroot -p$SENHAROOT

# Create tables
cat $SOURCE_DIR/database/mysql/schema.sql | mysql -u $USUARIODB -p$SENHA $NOMEBANCO
# Import images
cat $SOURCE_DIR/database/mysql/images.sql | mysql -u $USUARIODB -p$SENHA $NOMEBANCO
# Import DATA
cat $SOURCE_DIR/database/mysql/data.sql | mysql -u $USUARIODB -p$SENHA $NOMEBANCO
mysql -uzbx_db -pzabbix3 zbx_db < images.sql && mysql -uzbx_db -pzabbix3 zbx_db < data.sql
