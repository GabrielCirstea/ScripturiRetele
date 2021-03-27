#!/usr/bin/sh

# pentru configurarea unui ROUTER
# Scriptul inlocuieste campurile din fisierul template cu cele necesare
# a se modifica HOSTNAME, IP, MASK

# variabile necesare
HOSTNAME="R-ITALIA"
BANER="Azi e soare afara"
DATE=$(date +"%H:%M:%S %d %b %Y")
DOMAIN="minfo.ro"
MESAJ="Acesul persoanelor neautorizate este strict interzis"
IP="156.176.0.2"
MASK="255.255.240.0"

# pentru interfata de serial
SERIAL="0/0/0"
MESAJSERIAL="Acesul persoanelor neautorizate este strict interzis"
IPSERIAL="156.176.0.2"
MASKSERIAL="255.255.240.0"

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
