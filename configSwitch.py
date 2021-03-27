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

    print("Switch")
    print("\nPasi:")

    hostname = input("hostname = ")
    motd = input("banner motd = ")
    data_ora = datetime.now().strftime("%H:%M:S %d %B %y")
    # data_ora = input("data si ora (hh:mm:ss d MonthFullname YYYY) = ")
    domain_name = input("domain name (gen minfo.ro) = ")

    string="enable\nconfigure terminal\nno domain-lookup\nhostname "+hostname
    string+="\nno cdp run\nservice password-ecryption\n"
    string+="enable password ciscoenapa55\nenable secret ciscosecpa55\n"
    string+="banner motd #"+motd+" #\n"
    string+="line console 0\npassword ciscoconpa55\nlogin\nlogging synchronous\n"
    string+="exec-timeout 20 20\nexit\nline vty 0 15\npassword ciscovtypa55\nlogin\n"
    string+="logging synchronous\nexec-timeout 25 25\nexit\nexit\ncopy running-config startup-config\n"
    string+="show clock\nclock set "+data_ora+"\nconfigure terminal\nip domain-name "+domain_name+"\n"
    string+="username Admin01 privilege 15 secret Admin01pa55\nline vty 0 15\ntransport input ssh\n"
    string+="login local\nexit\ncrypto key generate rsa\n"

    print("Interfata virtuala:\n")

    mesaj_descriere = input("mesaj descriere = ")
    ip = input("ip (fara masca) = ")
    mask = input("mask (like... in ip form) = ")

    string+="interface vlan 1\ndescription "+mesaj_descriere+"\n"
    string+="ip address "+ip+" "+mask+"\nno shutdown\ncopy running-config startup-config"

    print("\n\n\n",string)

if( __name__ == "__main__"):
        main();
