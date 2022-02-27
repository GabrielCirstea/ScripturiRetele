#/bin/sh

# un exeplu de config custom ce face "source" la scriptul pt router config
HOSTNAME="Custom-Router"
BANER="Legatura cu ramura din partea asta"
DATE=$(date +"%H:%M:%S %d %b %Y")
DOMAIN="script.custom"
MESAJ="Astazi nu se face mentenanta la echipament"
IP="8.0.0.8"
MASK="255.0.2.0"
HELPER="10.45.0.254"

# pentru interfata de serial
SERIAL="0/1/0"
MESAJSERIAL="Accesul persoanelor neautorizate este strict interzis"
IPSERIAL="10.0.0.1"
MASKSERIAL="255.512.255.0"

. ./cfgRouter.sh
