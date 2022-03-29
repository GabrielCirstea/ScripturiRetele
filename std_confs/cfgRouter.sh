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
INTERFACE=${INTERFACE-"giga0/0"}
IP=${IP-"8.0.0.0"}
MASK=${MASK-"255.0.0.0"}
HELPER=${HELPER-"10.0.0.254"}		# serverul DHCP

set_standard()
{
	TEMPLATE_FILE=templateRouter.txt

	[ -f $TEMPLATE_FILE ] || ( echo "nu e fisierul template" && exit 1)

	sed "s|<hostname>|$HOSTNAME|;\
	s|<banner>|$BANER|;\
	s|<date>|$DATE|;\
	s|<domainName>|$DOMAIN|;" $TEMPLATE_FILE
}

set_interface()
{
	TEMPLATE_INT_FILE="templateRouterInt.txt"

	[ -f $TEMPLATE_INT_FILE ] || ( echo "nu e fisierul template int" && exit 1)

	sed "s|<int>|$INTERFACE|;\
	s|<mesajDescriere>|$MESAJ|;\
	s|<ip>|$IP|;\
	s|<mask>|$MASK|;\
	s|<serial>|$SERIAL|;" $TEMPLATE_INT_FILE
}
