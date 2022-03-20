#/bin/sh

# un exeplu de config custom ce face "source" la scriptul pt router config
HOSTNAME="R3"
BANER="Poate se face tema la Cybersecurity"
DATE=$(date +"%H:%M:%S %d %b %Y")
DOMAIN="SLA.ro"
MESAJ="Legatura cu R1"
IP="10.0.0.94"
MASK="255.255.255.252"
HELPER="10.45.0.254"

# pentru interfata de serial
SERIAL="0/1/0"
MESAJSERIAL="Accesul persoanelor neautorizate este strict interzis"
IPSERIAL="10.0.0.1"
MASKSERIAL="255.255.255.0"

cd ../../std_confs || exit 1
. ./cfgRouter.sh
