#include "turistickaDrustvenaMreza.h"
#include "sqlFunkcije.h"
int
main (int argc, char const *argv[])
{
  Sql sql;
  sql.connection = mysql_init(NULL);

  if (mysql_real_connect (sql.connection, "localhost", "root", "Renekton43!", "mydb", 0, NULL, 0) == NULL) {
    printf ("Neuspesno konektovanje na bazu\n");
  }

  int brojZahteva;

  while(1)
  {
  	printf ("%s:\n%s\n%s\n%s\n\n",
            "Unesite",
            "1. za dodavanje novih korisnika",
            "2. za brisanje informacija o korisnicima iz baze",
            "19. za kraj rada");

  	scanf("%d",&brojZahteva);

    switch (brojZahteva) {
    	case 1:
    		dodajKorisnika(&sql);
    		break;
      case 2:
        obrisiKorisnika(&sql);
        break;
    	case 19:
    		exit(EXIT_SUCCESS);
    	default:
    	  printf ("Pogresan izbor komande!\n");
    }

  }
  return 0;
}