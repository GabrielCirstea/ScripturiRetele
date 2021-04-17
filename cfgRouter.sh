#!/usr/bin/sh

# pentru configurarea unui ROUTER
# Scriptul inlocuieste campurile din fisierul template cu cele necesare
# a se modifica HOSTNAME, IP, MASK

# variabile necesare
HOSTNAME="R3"
BANER="Router-ul 3"
DATE=$(date +"%H:%M:%S %d %b %Y")
DOMAIN="minfo.ro"
MESAJ="Acesul persoanelor neautorizate este strict interzis"
IP="8.0.0.0"
MASK="255.0.0.0"
HELPER="10.0.0.254"		# serverul DHCP

# pentru interfata de serial
SERIAL="0/0/0"
MESAJSERIAL="Acesul persoanelor neautorizate este strict interzis"
IPSERIAL="10.0.0.1"
MASKSERIAL="255.255.255.0"

TEMPLATE_FILE=templateRouter.txt
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
sed -i "s|<serial>|$SERIAL|" $OUT_FILE
sed -i "s|<mesajDescriereSerial>|$MASK|" $OUT_FILE
sed -i "s|<ipSerial>|$IPSERIAL|" $OUT_FILE
sed -i "s|<maskSerial>|$MASKSERIAL|" $OUT_FILE
sed -i "s|<helper>|$HELPE|" $OUT_FILE
