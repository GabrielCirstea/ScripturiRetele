#/bin/sh

# un exeplu de config custom ce face "source" la scriptul pt router config
HOSTNAME="R2"
BANER="Azi se face tema la Cybersecurity in R2"
DATE=$(date +"%H:%M:%S %d %b %Y")
DOMAIN="SLA.ro"

cd ../../std_confs || exit 1
. ./cfgRouter.sh

set_standard

MESAJ="Legatura cu R3"
INTERFACE="giga0/0"
IP="10.0.0.61"
MASK="255.255.255.252"
set_interface

MESAJ="Legatura cu R1"
INTERFACE="giga0/1"
IP="10.0.0.30"
MASK="255.255.255.252"
set_interface

MESAJ="Legatura cu R21"
INTERFACE="giga0/2"
IP="192.168.0.29"
MASK="255.255.255.252"
set_interface
