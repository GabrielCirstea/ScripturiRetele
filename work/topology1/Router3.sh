#/bin/sh

# un exeplu de config custom ce face "source" la scriptul pt router config
HOSTNAME="R3"
BANER="Poate se face tema la Cybersecurity"
DATE=$(date +"%H:%M:%S %d %b %Y")
DOMAIN="SLA.ro"

cd ../../std_confs || exit 1
. ./cfgRouter.sh

set_standard

MESAJ="Legatura cu R1"
INTERFACE="giga0/0"
IP="10.0.0.94"
MASK="255.255.255.252"
set_interface

MESAJ="Legatura cu R2"
INTERFACE="giga0/1"
IP="10.0.0.62"
MASK="255.255.255.252"
set_interface

MESAJ="Legatura cu R31"
INTERFACE="giga0/2"
IP="192.168.0.45"
MASK="255.255.255.252"
set_interface
