#/bin/bash 


## Preparação de ambiente para intalação do Zabbix
sudo yum -y install wget

# Instale o repositório Epel 
sudo yum -y install epel-release.noarch

# Atualize as referências do repositório 
sudo yum update

# Instale as ferramentas de desenvolvimento
sudo yum -y groupinstall 'Development Tools'
sudo yum -y install zlib-devel glibc-devel curl-devel automake libidin-devel openssl-devel rpm-devel

# Pré-requisitos SNMP
sudo yum -y install net-snmp net-snmp-devel net-snmp-utils 

# Pré-requisitos SO
sudo yum -y install OpenIPMI OpenIPMI-devel libssh2-devel make fping yum-utils 

# Integração com o Jabber 
sudo yum -y install iksemel iksemel-devel libxml2-devel libxml2

# Requisitos da interface web
sudo yum -y install php php-bcmath php-gd php-mbstring php-xml php-ldap httpd php-curl

# Banco de dados 
sudo yum -y install mysql-devel mysql mysql-server php-mysql
