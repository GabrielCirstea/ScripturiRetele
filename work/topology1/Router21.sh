#/bin/sh

# un exeplu de config custom ce face "source" la scriptul pt router config
HOSTNAME="R21"
BANER="Ne duce spre 'Core network' de la PC2"
DATE=$(date +"%H:%M:%S %d %b %Y")
DOMAIN="SLA.ro"

cd ../../std_confs || exit 1
. ./cfgRouter.sh

set_standard

MESAJ="Legatura cu R2"
INTERFACE="giga0/0"
IP="192.168.0.30"
MASK="255.255.255.252"
set_interface

MESAJ="Legatura cu PC"
INTERFACE="giga0/1"
IP="172.16.0.17"
MASK="255.255.255.252"
set_interface
