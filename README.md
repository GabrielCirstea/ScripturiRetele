# Scripturi retele

Aici am pus ceva scrituri pentru laboratoarele de retelistica si ceva notite
pe care le consider importatnte.

## Notite:

* confSwitch.md: sintaxa/comenziile de configurare standard pentru un switch,
din packet tracer
* confRouter.md: comenziile de configurare pentru router

## Scritpuri:

* ipMask.c: calculeaza adresa de retea si de broadcast folosind ip-ul si masca
* Automatizare pas 1 + pas 2 + pas 3 (fara legaturi intre tari).py: Face pasul 1, 2 si 3 
(NA,BA,RA pentru primul IP si pentru fiecare tara)

### std_Configs

Configurari standard pentru router si switch:

* configSwitch.py: genereaza secventa de comenzi pentru configurarea switch-ului
asemanator cu *cfgSwitch.sh*
	* scriptul primeste valorile pentru hostname, baner etc de la stdin
	* aici data este generata automat
* configRouter.py: echivalent cu *configSwitch.py*, adauga cateva comenzi
suplimentare pentru configurarea routerului, plus interfete suplimentare
* cfgSwitch.sh: foloseste *templateSwitch.txt* si variabile interne pentru a
genera comenzile de configurare standard pentru un switch
	* parolele sunt mereu aceleas (probleme de securitate, stiu stiu)
	* in interirorul scriptului sunt variabilele ce vor fi inlocuite in template
pentru a genera configurarea dorita

~~Este foarte posibil sa mai vina si alte **ajutoare**.~~

Ajutoarele au venit! Uh... ajutorul, ca nu-s asa gras. (La naiba cu pandemia asta)
~Marius
