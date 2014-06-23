#!/usr/local/bin/bash

# Variaveis
LOG="/var/log/backup/backup.log"
DATE=`date +%Y-%m-%d-%H.%M`
etc="/etc/"
usrlocal="/usr/local/etc/"
www="/backup/www1"

echo "Iniciado em $DATE"

#################### backup de pacotes ########################################

echo ">> log pacotes instalados..." 
pkg_info | gzip -9 -> /backup/bkp/packages.log.gz 


echo ">> compactando /etc ..."

cd /
tar czvf etc.tar.gz $etc &>/dev/null 
cp -a etc.tar.gz /backup/bkp
 
# fazer um md5 aqui / com awk

echo ">> verificando integridade dos arquivos de /etc..."

cd /

	p1=$(md5 etc.tar.gz | awk {'print $4'}); 
	p2=$(md5 /backup/bkp/etc.tar.gz | awk {'print $4'}); 

echo $p1
echo $p2


	if  [ "$p1" == "$p2" ]; then 
		echo "Dados conferem"
		sleep 3 
		echo "Removendo dados antigos"
			rm -f /etc.tar.gz 
	else
		echo "ERRO! Verifique o backup"
	fi

##################### backup de /var/www1 ####################################
echo ">> Backup de /var/www1..."

cd /var 
tar -czvf www1.tar.gz $www &>/dev/null
cp -a www1.tar.gz /backup/bkp

echo "Verificando integridade dos arquivos de /var/www1"

cd /var

        w1=$(md5 www1.tar.gz | awk {'print $4'}); 
        w2=$(md5 /backup/bkp/www1.tar.gz | awk {'print $4'}); 

echo $p1
echo $p2


        if  [ "$p1" == "$p2" ]; then 
                echo "Dados conferem"
                sleep 3 
                echo "Removendo dados antigos"
                        rm -f www1.tar.gz 
        else
                echo "ERRO! Verifique o backup"
        fi

echo "Processo finalizado"

echo "Finalizado em $DATE" >> $LOG

