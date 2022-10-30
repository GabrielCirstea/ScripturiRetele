# Router

Model: *2911*

Placa suplimentara: *HWIC-2T*

## Pasi

```
enable

configure terminal

no ip domain-lookup

hostname <name>

no cdp run

service password-encryption

security passwords min-length 10
```

* timp blocare, incercari in interval de timp  

```
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
```

## Logg-uri

```
configure terminal
logging host <ip>
service timestamps log datetime msec
service timestamps debug datetime msec
```

## Atle interfete

```
enable

configur terminal

interface giga 0/1

description Legatura cu o alta retea

ip addres <alta adressa: 192.168.113.64> <masca: 255.255.255.224>

no shutdown

end
```

### serial

```
interface serial 0/0/0

description Legatura cu alt router

ip address <ex 10.10.10.9> <masca: no mai stiu 255.255.255.0>

no shutdown

end
```

# Routing

## Static

```
ip route <ip> <mask> <interfata>
```

ex: ip route 124.144.96.0 255.255.240 serial 0/0/0

## DHCP

* permiterea asignarii dinamice de ip-uri
* se face prin specificarea adresei serverullui de DHCP
* se apeleaza din interfata catre reteaua in care se asigneaza automat ip-urile

```
ip helper-address <ip>
```

## OSPF

Seteaza interfata de loopback

```
interface l0
ip address 1.1.1.1 255.255.255.255
```
Activeaza OSPF si adauga retelele ce vor fi anuntate catre alte routere.

```
router ospf <proc_ID>
network <ip> <wilcard_mask> area <nr>
```

wilecard este inversul unei masti de retea: o retea /24: 255.255.255.0 devine
0.0.0.255

ex:

```
router ospf 1
network 192.168.0.0 0.0.0.255 area 0
```

Truc pentru setarea tuturor interfetelor:

```
router ospf 1
network 0.0.0.0 255.255.255.255 area 0
```

Dezactivare ospf pe loopback
OSPF face anunturi si pe looback, dar anunturile astea nu ajung nicaieri. Este
mai bine sa le oprim.

```
router ospf 1
passive-interface l0
```

In OSPF ruta aleasa depinde de costuri, costurile sunt calculate in functie de o
metrica prestabilita ca si reper, pentru modificarea acesteia:

```
router ospf <nr>
auto-cost reference-bandwith <nr_Mbits>
```

Ex:

```
router ospf 1
network 192.168.10.0 0.0.0.31 area 0
network 10.10.10.8 0.0.0.3 area 0
area 0 authentication message-digest
```
