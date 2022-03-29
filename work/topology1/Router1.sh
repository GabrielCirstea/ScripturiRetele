#/bin/sh

# un exeplu de config custom ce face "source" la scriptul pt router config
HOSTNAME="R1"
BANER="Azi se face tema la Cybersecurity"
DATE=$(date +"%H:%M:%S %d %b %Y")
DOMAIN="SLA.ro"
MESAJ="Legatura cu R2"

cd ../../std_confs || exit 1
. ./cfgRouter.sh

set_standard

MESAJ="Legatura cu R2"
INTERFACE="giga0/0"
IP="10.0.0.29"
MASK="255.255.255.252"
set_interface

MESAJ="Legatura cu R3"
INTERFACE="giga0/1"
IP="10.0.0.93"
MASK="255.255.255.252"
set_interface

MESAJ="Legatura cu R11"
INTERFACE="giga0/2"
IP="192.168.0.13"
MASK="255.255.255.252"
set_interface
