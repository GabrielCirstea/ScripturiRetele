#/bin/sh

# un exeplu de config custom ce face "source" la scriptul pt router config
HOSTNAME="R11"
BANER="Am plecat de la PC1"
DATE=$(date +"%H:%M:%S %d %b %Y")
DOMAIN="SLA.ro"
MESAJ="Legatura cu R1"
IP="192.168.0.14"
MASK="255.255.255.252"

cd ../../std_confs || exit 1
. ./cfgRouter.sh

set_standard

MESAJ="Legatura cu R1"
INTERFACE="giga0/0"
IP="192.168.0.14"
MASK="255.255.255.252"
set_interface

MESAJ="Legatura cu PC"
INTERFACE="giga0/1"
IP="172.16.0.9"
MASK="255.255.255.252"
set_interface
