# Wireguard si docker (de fapt orice container)

## Palavrageala

Prin natura si design-ul sau simplu si mai ales prin faptul ca wireguard ofera
o interfata de retea virtuala ce poate fi gestionata de unelte deja existente
precum `ip` si `ifconfig`, acesta devinde un protocol de VPN doar flexibil cu foarte
multe posibilitati.

Foarte impresionant este felul in care interfata de wireguard poate fi folosita
in `namespaces`-uri. [Namespace-urile](https://en.wikipedia.org/wiki/Linux_namespaces)
sunt o modalitate de separare a resurselor pe linux. Foarte folosita in containere.

### In container

Un container este practic un proces lansat in namespaces-uri diferite de restul
proceselor, printre care si namespace-ul de retea.

Motiv pentru care este nevoi de a se publica explicit porturi dintr-un container
cand se ruleaza un server (`-p 8000:80`).

Fiecare container in o interfata de retea pe care o foloseste sa trimita pachete.
De cele mai multe ori este un `eth0` la fel ca pe PC. In container aceasta este
o interfata virtuala ce poarta acest nume.

### wireguard?

Ca sa ajungem in sfarsit la wireguard: putem sa punem interfata de wireguard relativ
simplu in orice container, ca aplicatiile din container sa aiba access la VPN.

La ce e util?
Daca ai mai multe servere de VPN poti sa pui fiecare container pe un VPN separat.
Sau simplu, rulezi numai containerul in VPN, daca nu ai increde in VPN.

## Trecem la treaba

[Wireguard ghid](https://www.wireguard.com/netns/) este foarte bun si are foarte multe
detalii referitor la solutii de routing in general.

> Nu le-am inteles nici studiat prea mult pe primele, dar ne concentram pe cea cu
> namespaces-uri

### Scop

Vrem sa punem o interfata de wireguard intr-un container, astfel containerul sa
aiba o conexiune si o adresa IP in VPN.

### Info container

Avem un container pronit

```
docker run -it --name container alpine /bin/sh
```

> `it` este pentru modul interactiv is tty, asfel o sa avem o consola in container

Separa, in alt terminal

```
docker inspect container -f {{.State.Pid}}
```

Avem PID-ul procesului principal din contianer, e important pt namespace-uri

### Botezam namespace-ul

Containerele nu au namespaces-url cu nume, asa cum e in ghidul mentionat mai sus.
Deci le vom da noi un nume

```
ip netns attach ns_wg <pid>
```

> <pid> este valoarea de la comanda de `docker inspect` de mai sus

### totul pregatit

Acum ca avem totul setat putem doar sa urmam pasii din ghid

```
ip link add wg0 type wireguard
ip link set wg0 netns ns_wg
```

Interfata este in namespace, daca rulan `ip a` din container o sa o vedem
Acum o sa setatm confiratia

```
ip netns exec ns_wg wg setconf wg0 /etc/wireguard/wg0.conf
ip netns exec ns_wg ip addr add 10.2.4.5/32 dev wg0
ip netns exec ns_wg ip link set wg0 up
ip netns exec ns_wg ip route add default dev wg0
```

## Finish

Si cam atat, acum avem o interfata de wireguard creata in namespace-ul normal si
mutata in container, setata si pregatita sa comunice in VPN.
Este important ca am creat-o in namespaces-ul normal (mai multe detalii in ghid)
pentru ca acum prin interfata respectiva pachetele vor trece criptate in
namespaces-ul normal si apoi catre celalat peer.

Conexiunea se poate testa cu un ping catre celalat peer si catre alte host-uri
din VPN.

Se poate sa fie probleme cu serverul de DNS, asa ca poate ar trebui sa fie
modificat `/etc/resolv.conf`
