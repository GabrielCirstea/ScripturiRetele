# Configurare Switch

*enable* - mod configurare  
*configure terminal* - configurare globala

enable  
configure terminal  
* opreste cautarea automata de domenii  
no ip domain-lookup  
* seteaza un nume  
hostname <nume>  
* opreste cdp-ul...cand o sa aflu ce inseamna o sa scriu  
no cdp run  
* criptarea parolelor  
service password-encryption

* seteaza o parola  
enable password ciscoenapa55  
* seteaza un secret  
enable secret ciscosecpa55

	
* banner: motd = mesajul zilei...  
banner motd S Vineri la ora 14:00 serverul va intra in mentenanta S

## configurarea liniilor de comanda

line console 0  
* seteaza parola  
password cicoenapa55
* cere logarea  
login
* fara intreruperi nasoale  
logging synchronous
* daca dormi prea multm te deloghezi  
exec-timeout 20 20
* iesim din modul de line  
exit
	
* configurari pentru liniile virtuale  
line vty 0 15  
password ciscovtypa55  
login  
logging synchronous  
exec-timeout 25 25  
exit  
* ne ducem pana in modul de configurare normal  
exit  
* salvam configurarile  
copy running-config startup-config  

* afisam ora  
show clock  
* setam ora  
clock set <ora> <zi> <luna> <an>

configure terminal  
* setam domain-name-ul  
ip domain-name minfo.ro  
* cont de admin si parola  

## setare ssh

username Admin01 privilege 15 secret Admin01pa55  
* configrare pentru ssh pe liniile virtuale  
line vty 0 15  
transport input ssh  
login local  
exit  
* generam chiea pentru ssh  
crypto key generate rsa

## setarea interfetei - ip, mask
interface vlan 1  
description Legatura cu LAN 193.168.213.0/24  
ip address <ip> <mask>
no shutdown

## interface range

* accesam toate interfetele fastEthernet in acelas timp

interface range fast 0/1-24

* oprim toate interfetele fastEthernet 

shutdown

## default getway

* setam getway-ul, se face din **#(config)**

ip defaul-getway <ip>

## salvare
copy running-config startup-config
