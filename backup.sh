#!/bin/sh
# ElektronMC-Backupper v2
# By PFilip 2023 ©
# + chatgpt czy coś jakby no 

# Import konfiguracji
. .config

#eo
cd $MIRROR_DIR
pwd

#SFTP
echo lftp
lftp -u $SFTP_USER,$SFTP_PASS -e "mirror --only-newer --use-pget-n=8 -e .; bye" -p $SFTP_PORT $SFTP_HOST

#ARCH
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")
ARCHIVE_NAME="backup_$TIMESTAMP.tar.zst"
tar -cf - -C $MIRROR_DIR . | zstd -9 -T0 -o $ARCHIVE_DIR/$ARCHIVE_NAME

#del
echo del
find $ARCHIVE_DIR -type f -name "*.tar.zst" -mtime +$DAYS_TO_KEEP -exec echo {} \;
find $ARCHIVE_DIR -type f -name "*.tar.zst" -mtime +$DAYS_TO_KEEP -exec rm {} \;

curl -u :$NTFY_TOKEN -H "ta: tada" -H "t:ElektronMC-backupper" -d "Backup zrobiony. $ARCHIVE_NAME :> 😀" $NTFY_URL/$NTFY_TOPIC

echo gut
echo "hev a grejt dej :>"