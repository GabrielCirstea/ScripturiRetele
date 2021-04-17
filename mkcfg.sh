#!/usr/bin/sh

# Scriptul inlocuieste campurile din fisierul template cu cele necesare
# a se modifica HOSTNAME, IP, MASK

# variabile necesare
HOSTNAME="Sw-ISLANDA"
BANER="Switch-ul de pe ramura ISLANDA"
DATE=$(date +"%H:%M:%S %d %b %Y")
DOMAIN="minfo.ro"
MESAJ="Acesul persoanelor neautorizate este strict interzis"
IP="156.176.24.2"
MASK="255.255.248.0"
GATEWAY="156.255.248.1"

TEMPLATE_FILE=templateSwitch.txt
OUT_FILE=out.txt
[ -f $TEMPLATE_FILE ] || ( echo "nu e fisierul template" && exit 1)

cp $TEMPLATE_FILE $OUT_FILE

sed -i "s|<hostname>|$HOSTNAME|" $OUT_FILE
sed -i "s|<banner>|$BANER|" $OUT_FILE
sed -i "s|<date>|$DATE|" $OUT_FILE
sed -i "s|<domainName>|$DOMAIN|" $OUT_FILE
sed -i "s|<mesajDescriere>|$MESAJ|" $OUT_FILE
sed -i "s|<ip>|$IP|" $OUT_FILE
sed -i "s|<mask>|$MASK|" $OUT_FILE
