#!/bin/bash 

# ================= cegohub@cegolab ====================#
# Script de backup NFS  
# Outubro 2014 
# Versão 1.0.1
# ======================================================#

#==================== Variáveis ========================#
DATE=`date +%Y-%m-%d-%H.%M`
export ACT_DATE=$(date '+%d-%m-%y')
LOG="/var/log/backup/$ACT_DATE-nfs.log"
# MAIL
MAIL=infra@empresa.com.br
PASS=P@ssW0rd
# Origem
SERVER=10.0.0.166
BACKUPDIR=/media/backup # Diretório de saída, ou seja o Storage 10.0.0.162
MOUNTDIR=/media/nfs-dir # Montado em /etc/fstab veja com df -h

echo "Iniciado em $DATE" >> $LOG
echo ". . . . . . . . . . . . . . . . . . ." >> $LOG
#==================== backup ==========================#

P1=$(showmount --no-headers -e $SERVER |awk {'print $1'} |cut -b 13-50)

for line in $P1
do
        mount $SERVER:/DataVolume/$line $MOUNTDIR >> $LOG
        rsync -rtvul --delete-delay --progress $MOUNTDIR $BACKUPDIR/$line >> $LOG
        umount $MOUNTDIR >> $LOG
done

# Compactando LOG

#cd /var/log/backup 
#G1=$(tar czvf $ACT_DATE.log.tar.gz $LOG)

#======================================================#
echo ". . . . . . . . . . . . . " >> $LOG
echo "Backup finalizado em $DATE" >> $LOG

#================= enviando email =====================#
/usr/bin/sendEmail -l /var/log/sendEmail.log -s smtp.g10.com.br:587 -f $MAIL -t infra@empresa.com.br -u " Backup G10 Storage $ACT_DATE " -a $LOG -o "message-file=$LOG" -xu srv.infra -xp $PASS

