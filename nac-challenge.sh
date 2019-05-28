confs do script
# Onde, DIR_ORIG  o diretorio a ser backupeado e DIR_DEST  o 
# diretorio para onde vai o arquivo compactado e BKP_NAME  o nome ao 
# qual sera compactado o diretorio.

# criando os diretorios
mkdir /var/log/bkp.log
mkdir cd /etc/bkp

DIR_ORIG="cd /etc/bkp"
DIR_DEST="cd /etc/bkp"
BKP_NAME="backupthiago.tgz"
Date=(date '+%d-%m-%y')

# compactacao do diretorio de origem diretamente no diretorio de destino
tar -czpf ${DIR_DEST}${BKP_NAME} ${DIR_ORIG} ${Date} /etc

# mensagem de resultado
echo "Seu backup foi realizado com sucesso."
echo "Diretorio: ${DIR_ORIG}"
echo "Destino: ${DIR_DEST}${BKP_NAME}";
echo "data corrente:$Date"
exit 0

# Confs do script
# Onde, DIR_ORIG o diretorio a ser backupeado, BKP_NAME o nome do backup
# arquivo de backup a ser criado, HTTPD_HOST o endereco do servidor 
# serem usados para logarmos no servidor de HTTPD.

#baixando servidor apache
yum_install && update httpd2 -y

DIR_ORIG="cd /etc/bkp"
BKP_NAME="backupthiago.tgz"
HTTPD_HOST="localhost"

# compactacao do diretorio de origem
tar -czpf ./${BKP_NAME} ${DIR_ORIG}

# envio para o HTTPD, onde neste caso, abrimos a conexao com o servidor, 
# diretorio home do usuario do HTTPD.
httpd2 -in <<EOF
open $HTTPD_HOST
bin
hash
prompt
put $BKP_NAME
bye
EOF

# mensagem de resultado
echo "Seu backup foi realizado com sucesso."
echo "Diretorio: ${DIR_ORIG}"
echo "Destino: ${HTTPD_HOST}/${HTTPD_NAME}";
exit 0

crontab -e 

# gravação dos logs
if [ $? == '0' ]; then
	echo "Backup executado com sucesso >> /var/log/bkp.log
	else
	echo "Falha na execução" >> /var/log/bkp.log
fi

Date=$(date '+%d-%m-%y')
echo "data corrente:$Date"
exit 0

# git-hub
yum_install && update git -y
echo "#nac20-rm81182 >> README.md"
git init
git add README.md
git remote add origin https://github.com/iago2009216826/script-challenge-10.git
git commit -m "Backup comitado"  
git push -u origin master
git add nac-challenge.sh
