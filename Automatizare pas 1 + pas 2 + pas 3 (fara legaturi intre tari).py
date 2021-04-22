#primary_ip = input("Read primary IP: ")
primary_ip = "124.145.200.199/15"

print("Primary IP adress:",primary_ip)

v, w = primary_ip.split("/")
v = v.split(".")

print()
aux=""
for i in v:
    binn=""
    c=7
    tmp=2**c
    x = int(i)
    print(x,"= ",end="")
    while x!=0:
        if tmp<=x:
            x-=tmp
            if x!=0:
                print("2^",c," +",end=" ",sep="")
                binn+="1"
                tmp//=2
                c-=1
            else:
                print("2^",c,end=" ",sep="")
                binn+="1"
                tmp//=2
                c-=1
        else:
            print("     ",end=" ",sep="")
            tmp//=2
            c-=1
            binn+="0"
    
    print()
    binn=binn+"0"*(8-len(binn))
    print("   ",*list(binn),sep="     ")
    print()
    print(binn)
    aux+=binn

print()

v = aux
print("vv=",v)
#v = "".join([bin(int(i))[2:] for i in v])

tmp = "1"*int(w)+"0"*(32-int(w))
v1 = "0"*(32-len(bin(int(v,2)&int(tmp,2))[2:]))+bin(int(v,2)&int(tmp,2))[2:]
inv = "".join(["1" if i=="0" else "0" for i in tmp])
inv1 = "0"*(32-len(bin(int(v1,2)|int(inv,2))[2:]))+bin(int(v1,2)|int(inv,2))[2:]
NA = ".".join([str(int(v1[i:i+8],2)) for i in range(0,32,8)])+"/"+w
BA = ".".join([str(int(inv1[i:i+8],2)) for i in range(0,32,8)])+"/"+w

print("/".join([v[i:i+8][:4]+"."+v[i:i+8][4:] for i in range(0,32,8)])," primary IP")
print("/".join([tmp[i:i+8][:4]+"."+tmp[i:i+8][4:] for i in range(0,32,8)])," mask adress")
print("---------------------------------------  logical AND")
print("/".join([v1[i:i+8][:4]+"."+v1[i:i+8][4:] for i in range(0,32,8)])," NA")

print()

print("NA =",NA)

print()

print("/".join([v[i:i+8][:4]+"."+v[i:i+8][4:] for i in range(0,32,8)])," NA")
print("/".join([inv[i:i+8][:4]+"."+inv[i:i+8][4:] for i in range(0,32,8)])," inverted mask adress")
print("---------------------------------------  logical OR")
print("/".join([inv1[i:i+8][:4]+"."+inv1[i:i+8][4:] for i in range(0,32,8)])," BA")

print()

print("BA = ",BA)

print()

t,s = NA.split("/")
t = t.split(".")

t[-1]=str(int(t[-1])+1)

if t[-1]=="256":
    t[-1] = "0"
    t[-2] = str(int(t[-2])+1)
    if t[-2]=="256":
        t[-2] = "0"
        t[-3] = str(int(t[-3])+1)
        if t[-3]=="256":
            t[-3] = "0"
            t[-4] = str(int(t[-4])+1)

RA1 = ".".join(t)

t,s = BA.split("/")
t = t.split(".")

t[-1]=str(int(t[-1])-1)

if t[-1]=="-1":
    t[-1] = "255"
    t[-2] = str(int(t[-2])-1)
    if t[-2]=="-1":
        t[-2] = "255"
        t[-3] = str(int(t[-3])-1)
        if t[-3]=="-1":
            t[-3] = "255"
            t[-4] = str(int(t[-4])-1)

RA2 = ".".join(t)+"/"+s

print("RA = ",RA1,"-",RA2)

print("\n\n\n")

countries = []

"""while(" "):
    aux = input("Introduce a country: ")
    if aux=="0":
        break
    countries.append((aux,int(input("Introduce number: "))))"""

countries = [['GORJ', 8191], ['GORJ', 7], ['GENEVA', 4095]]

#countries = sorted(countries, key=lambda x: -x[1])

for i in range(len(countries)):
    j = 0
    while countries[i][1]>2**j-2:
        j+=1
    countries[i].extend([j, 32-j])

for k in countries:

    print(str(k[0])+": "+str(k[1])+"H","32 -",k[2],"=",k[3])

    v, w = NA.split("/")
    v = v.split(".")
    
    w=str(k[-1])

    print()

    for i in v:
        binn=""
        c=7
        tmp=2**c
        x = int(i)
        print(x,"= ",end="")
        while x!=0:
            if tmp<=x:
                x-=tmp
                if x!=0:
                    print("2^",c," +",end=" ",sep="")
                    binn+="1"
                    tmp//=2
                    c-=1
                else:
                    print("2^",c,end=" ",sep="")
                    binn+="1"
                    tmp//=2
                    c-=1
            else:
                print("     ",end=" ",sep="")
                tmp//=2
                c-=1
                binn+="0"
        print()
        binn=binn+"0"*(8-len(binn))
        print("   ",*list(binn),sep="     ")
        print()

    print()
    
    v = "".join(["0"*(8-len(bin(int(i))[2:]))+bin(int(i))[2:] for i in v])
    tmp = "1"*int(w)+"0"*(32-int(w))
    v1 = "0"*(32-len(bin(int(v,2)&int(tmp,2))[2:]))+bin(int(v,2)&int(tmp,2))[2:]
    inv = "".join(["1" if i=="0" else "0" for i in tmp])
    inv1 = "0"*(32-len(bin(int(v1,2)|int(inv,2))[2:]))+bin(int(v1,2)|int(inv,2))[2:]
    NA = ".".join([str(int(v1[i:i+8],2)) for i in range(0,32,8)])+"/"+w
    BA = ".".join([str(int(inv1[i:i+8],2)) for i in range(0,32,8)])+"/"+w

    print("/".join([v[i:i+8][:4]+"."+v[i:i+8][4:] for i in range(0,32,8)])," primary IP")
    print("/".join([tmp[i:i+8][:4]+"."+tmp[i:i+8][4:] for i in range(0,32,8)])," mask adress")
    print("---------------------------------------  logical AND")
    print("/".join([v1[i:i+8][:4]+"."+v1[i:i+8][4:] for i in range(0,32,8)])," NA")

    print()

    print("NA =",NA)

    print()

    print("/".join([v[i:i+8][:4]+"."+v[i:i+8][4:] for i in range(0,32,8)])," NA")
    print("/".join([inv[i:i+8][:4]+"."+inv[i:i+8][4:] for i in range(0,32,8)])," inverted mask adress")
    print("---------------------------------------  logical OR")
    print("/".join([inv1[i:i+8][:4]+"."+inv1[i:i+8][4:] for i in range(0,32,8)])," BA")

    print()

    print("BA = ",BA)

    print()

    t,s = NA.split("/")
    t = t.split(".")

    t[-1]=str(int(t[-1])+1)

    if t[-1]=="256":
        t[-1] = "0"
        t[-2] = str(int(t[-2])+1)
        if t[-2]=="256":
            t[-2] = "0"
            t[-3] = str(int(t[-3])+1)
            if t[-3]=="256":
                t[-3] = "0"
                t[-4] = str(int(t[-4])+1)

    RA1 = ".".join(t)

    t,s = BA.split("/")
    t = t.split(".")

    t[-1]=str(int(t[-1])-1)

    if t[-1]=="-1":
        t[-1] = "255"
        t[-2] = str(int(t[-2])-1)
        if t[-2]=="-1":
            t[-2] = "255"
            t[-3] = str(int(t[-3])-1)
            if t[-3]=="-1":
                t[-3] = "255"
                t[-4] = str(int(t[-4])-1)

    RA2 = ".".join(t)+"/"+s

    print("RA = ",RA1,"-",RA2)

    print("\n\n\n")

    t,s = BA.split("/")
    t = t.split(".")

    t[-1]=str(int(t[-1])+1)

    if t[-1]=="256":
        t[-1] = "0"
        t[-2] = str(int(t[-2])+1)
        if t[-2]=="256":
            t[-2] = "0"
            t[-3] = str(int(t[-3])+1)
            if t[-3]=="256":
                t[-3] = "0"
                t[-4] = str(int(t[-4])+1)

    NA = ".".join(t)+"/"+s