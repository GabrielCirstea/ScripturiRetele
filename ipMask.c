// calculeaza reteua si adresa de broadcasting pentru un ip
// se compileaza normal, ex: gcc ipMask.c -o main
// apelare: ./main <ip> <masca>
// ex: ./main 193.240.152.137 27
#include <stdio.h>
#include <stdlib.h>

#define ADDR_SIZE 4

char* mystrtok(char* str, char delim)
{
	static char *sir = NULL;
	if(str)
		sir = str;
	if(!*sir)
		return NULL;
	char* token = sir;
	while(*sir && *sir != delim)
		++sir;
	if(*sir == delim)
	{
		*sir='\0';
		sir++;
	}
	return token;
}

void testStrtok()
{
	char t[] = "Ana are mere cc";
	char *token = mystrtok(t,' ');
	while(token)
	{
		printf("%s\n",token);
		token = mystrtok(NULL,' ');
	}
}

int getIp(unsigned char ip[4], char* str)
{
	char *token = mystrtok(str,'.');
	if(!token)
	{
		printf("eroare parsare ip");
		exit(1);
	}
	ip[0] = atoi(token);
	int i;
	for(i=1;i<4;++i)
	{
		token = mystrtok(NULL,'.');
		if(!token)
		{
			printf("eroare parsare ip");
			exit(1);
		}
		ip[i] = atoi(token);
	}

	return 0;
}

void printIp(unsigned char ip[4])
{
	int i;
	for(i=0;i<4;++i)
		printf("%d.",ip[i]);
	printf("\n");
}

void printMask(char mask)
{
	char i;
	for(i=0; i<mask;++i)
	{
		printf("1");
	}
	for(;i<32;++i)
		printf("0");
	printf("\n");
}

int makeMask(char mask)
{
	int binMask = 0;
	int i=0;
	for(i=0;i< 8 * sizeof binMask;++i)
	{
		binMask<<=1;
		if(i<mask)
			binMask = binMask | 1;
	}
	return binMask;
}

void printNiceOctet(unsigned char oct)
{// afiseaza octetul din ip, cu punct dupa primii 4 biti
	int j;
	for(j=8 * sizeof oct - 1;j>=0;--j)
	{
		if((oct>>j) & 1)
			printf("1");
		else
			printf("0");
		if(j && !(j%4))
			printf(".");
	}
}

void printBinIp(unsigned char ip[4])
{
	int i;
	for(i=0;i<4;++i)
	{
		printf("%d: ",ip[i]);
		printNiceOctet(ip[i]);
		printf("\n");
	}
}

void calcNA(char NA[4], char ip[4], int binMask)
{
	// se pare ca in cazul meu bitii sunt asezati invers
	// copii nu faceti asta acasa
	char *p = &((char*)&binMask)[3];
	int i;
	for(i=0;i<4;i++)
	{
		NA[i] = ip[i] & (*p);
		p--;
	}
}
void printNiceAnd(unsigned char ip[4], int binMask, unsigned char NA[4])
{
	int i;
	for(i=0;i<4;++i)
	{
		printNiceOctet(ip[i]);
		printf("/");
	}
	printf("\n");
	char *p = &((char*)&binMask)[3];
	for(i=0;i<4;++i)
	{
		printNiceOctet(*p);
		printf("/");
		--p;
	}
	printf("\n=======================================\n");
	for(i=0;i<4;++i)
	{
		printNiceOctet(NA[i]);
		printf("/");
	}
	printf("\n");

}

void printBinMask(char mask)
{
	int i;
	for(i=0;i<4;++i)
	{
		unsigned char val = 0;
		int j;
		for(j=0;j<8;++j)
		{
			val <<= 1;
			if(mask)
			{
				--mask;
				val = val | 1;
			}
		}
		printf("%d.",val);
	}
}

int min(int a, int b)
{
	return a<b? a:b;
}

void calcNB(char NB[4], char NA[4], char mask)
{
	int lastOctet = mask / 8;
	int lastBite = lastOctet * 8 + mask % 8;
	int limitBite = min((lastOctet + 1) * 8, 32);
	unsigned char nr = 0;
	int i,diff = limitBite - lastBite;
	for(i=0;i<diff;++i)
	{
		nr<<=1;
		nr = nr | 1;
	}
	NB[0] = NA[0];
	NB[1] = NA[1];
	NB[2] = NA[2];
	NB[3] = NA[3];

	NB[lastOctet] += nr;
	for(i = lastOctet+1;i<4;++i)
	{
		NB[i] = 255;
	}
}

/* Get the next address on IPv4
 * @mask - not used yet
 * @return - 0 on succes, we only have succes so far */
int get_next_addr(unsigned char old[ADDR_SIZE], unsigned char new[ADDR_SIZE], int mask)
{
	for(int i=0; i<ADDR_SIZE; ++i)
		new[i] = old[i];
	char reminder = 0;
	for(int i=ADDR_SIZE-1; i>=0; --i) {
		unsigned char c = new[i];
		new[i] += reminder + 1;
		reminder = 0;
		// overflow
		if(new[i] < c) {
			reminder = 1;
			new[i] = 0;
		}
		if(!reminder)
			break;
	}

	return 0;
}

int print_nice_ips(unsigned char ip[ADDR_SIZE], char mask, int binMask
		, unsigned char NA[ADDR_SIZE], unsigned char NB[ADDR_SIZE])
{
	printBinIp(ip);
	printf("Masca: ");
	printBinMask(mask);


	printf("\n");
	printf("\n");
	printNiceAnd(ip,binMask,NA);
	printf("\n");

	printf("N.A. = ");
	printIp(NA);

	printf("B.A. = ");
	printIp(NB);
}

int main(int argc, char **argv)
{
	if(argc < 3)
	{
		printf("Usage: %s <ip> <range> [nth address]\n", argv[0]);
		return 1;
	}

	unsigned char ip[4];
	char mask = atoi(argv[2]);
	int nth = 0;
	if(argc == 4) {
		nth = atoi(argv[3]);
		if(!nth){
			fprintf(stderr, "Error on parsing <nth> argv %s\n", argv[3]);
			exit(1);
		}
	}
	getIp(ip,argv[1]);
	int binMask = makeMask(mask);
	unsigned char NA[4];
	calcNA(NA, ip, binMask);
	unsigned char NB[4];
	calcNB(NB, NA, mask);
	print_nice_ips(ip, mask, binMask, NA, NB);

	for(int i=1; i<nth; ++i){
		get_next_addr(NB, NA, 0);
		printf("------------\n");
		printf("nth: %d\n", i+1);
		printf("NA: ");
		printIp(NA);
		calcNB(NB, NA, mask);
		printf("NB: ");
		printIp(NB);
	}

	return 0;
}
