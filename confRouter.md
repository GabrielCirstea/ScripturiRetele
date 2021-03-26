# Router

Model: *2911*

Placa suplimentara: *HWIC-2T*

## Pasi

enable

configure terminal

no domain-lookup

hostname <name>

no cdp run

service password-encryption

security passwords min-length 10

* timp blocare, incercari in interval de timp  
login block-for 50 attempts 3 within 15

enable password ciscoenapa55

enable secret ciscosecpa55

banner login # Atentie accessul persoanelor neautorizate este strict interzis#

banner motd $ Sambata Si Duminca serverul va fi oprit$

line console 0

password ciscoconpa55

login

logging synchronous

exec-timeout 20 20

exit

line vty 0 15

password ciscovtypa55

login

logging synchronous

exec-timeout 20 20

end

copy running-config startup-config

clock set hh:mm:ss zi luna an

configure terminal

ip domain-name minfo.ro

username Admin01 privilege 15 secret Admin01pa55

line vty 0 15

transport input ssh

login local

exit

crypto key generate rsa

interface giga 0/0

description Legatura cu ramura MATE 192.168.113.128/28

ip address <ip> <mask>

no shutdown

end

copy running-config startup-config

## Atle interfete

enable

configur terminal

interface giga 1

description Legatura cu o alta retea

ip addres <alta adressa: 192.168.113.64> <masca: 255.255.255.224>

no shutdown

end

### serial

interface serial 0/0/0

description Legatura cu alt router

ip address <ex 10.10.10.9> <masca: no mai stiu 255.255.255.0>

no shutdown

end
