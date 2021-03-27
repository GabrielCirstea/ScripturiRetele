from datetime import datetime
"""SwMATE
si tactu politist
69:69:69 4 April 2021
mata.curva
parazitii
1.1.1.2
2.2.2.2

"""

def main():
    print("Router\nModel: 2911\nPlaca suplimentara: HWIC-2T")
    print("\nPasi:")

    hostname = input("hostname = ")
    login = input("banner login = ")
    motd = input("banner motd = ")
    data_ora = datetime.now().strftime("%H:%M:S %d %B %y")
    domain_name = input("domain name (gen minfo.ro) = ")

    string="enable\nconfigure terminal\nno domain-lookup\nhostname "+hostname
    string+="\nno cdp run\nservice password-ecryption\nsecurity passwords min-length 10\n"
    string+="login block-for 50 attempts 3 within 15\nenable password ciscoenapa55\nenable secret ciscosecpa55\n"
    string+="banner login #"+login+"#\nbanner motd #"+motd+" #\n"
    string+="line console 0\npassword ciscoconpa55\nlogin\nlogging synchronous\n"
    string+="exec-timeout 20 20\nexit\nline vty 0 15\npassword ciscovtypa55\nlogin\n"
    string+="logging synchronous\nexec-timeout 20 20\nend\ncopy running-config startup-config\n"
    string+="clock set "+data_ora+"\nconfigure terminal\nip domain-name "+domain_name+"\n"
    string+="username Admin01 privilege 15 secret Admin01pa55\nline vty 0 15\ntransport input ssh\n"
    string+="login local\nexit\ncrypto key generate rsa\n"

    print("Interfata giga 0/0:\n")

    mesaj_descriere = input("mesaj descriere = ")
    ip = input("ip (fara masca) = ")
    mask = input("mask (like... in ip form) = ")

    string+="interface vlan 1\ndescription "+mesaj_descriere+"\n"
    string+="ip address "+ip+" "+mask+"\nno shutdown\ncopy running-config startup-config"

    print(30 * "=");
    print("\n\n",string)

    string=""
    print(30 * "=");
    print("Interfata giga 1 (lleaga switch la router):\n")

    descriere = input("mesaj descriere = ")
    ip = input("ip fara masca = ")
    mask = input("masca (in forma de ip) = ")

    string+="enable\nconfigure terminal\ninterface giga 1\ndescription "+descriere+"\n"
    string+="ip address "+ip+" "+mask+"\nno shutdown\nend"

    print(30 * "=");
    print("\n\n",string)

    print(30 * "=");
    print("Interfata serial 0/0/0 sau 0/0/1 (router la router): \n")

    descriere = input("mesaj descriere = ")
    ip = input("ip fara masca = ")
    mask = input("masca (in forma de ip) = ")

    string+="interface serial 0/0/0\ndescription "+descriere+"\n"
    string+="ip address "+ip+" "+mask+"\nno shutdown\nend"

    print(30 * "=");
    print("\n\n",string)

if( __name__ == "__main__"):
        main();
