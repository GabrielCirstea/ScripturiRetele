#!/usr/bin/sh

# pentru configurarea unui ROUTER
# Scriptul inlocuieste campurile din fisierul template cu cele necesare
# a se modifica HOSTNAME, IP, MASK

# variabile necesare
# Variabilele vor fi setate ca env varaibles folosind `export` sau facand source
# la script
HOSTNAME=${HOSTNAME-"hostname"}
BANER=${BANER-"Legatura cu ceva alt router sau switch"}
DATE=$(date +"%H:%M:%S %d %b %Y")
DOMAIN=${DOMAIN-"SLA.ro"}
MESAJ=${MESAJ-"Astazi nu se face mentenanta la echipament"}
IP=${IP-"8.0.0.0"}
MASK=${MASK-"255.0.0.0"}
HELPER=${HELPER-"10.0.0.254"}		# serverul DHCP

# pentru interfata de serial
SERIAL=${SERIAL-"0/0/0"}
MESAJSERIAL=${MESAJSERIAL-"Acesul persoanelor neautorizate este strict interzis"}
IPSERIAL=${IPSERIAL-"10.0.0.1"}
MASKSERIAL=${MASKSERIAL-"255.255.255.0"}

TEMPLATE_FILE=templateRouter.txt

[ -f $TEMPLATE_FILE ] || ( echo "nu e fisierul template" && exit 1)

sed "s|<hostname>|$HOSTNAME|;\
s|<banner>|$BANER|;\
s|<date>|$DATE|;\
s|<domainName>|$DOMAIN|;\
s|<mesajDescriere>|$MESAJ|;\
s|<ip>|$IP|;\
s|<mask>|$MASK|;\
s|<serial>|$SERIAL|;\
s|<mesajDescriereSerial>|$MESAJSERIAL|;\
s|<ipSerial>|$IPSERIAL|;\
s|<maskSerial>|$MASKSERIAL|;\
s|<helper>|$HELPER|" $TEMPLATE_FILE
