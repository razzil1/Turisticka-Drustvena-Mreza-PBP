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
  	printf ("%s:\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n\n",
            "Unesite",
            "1. za dodavanje novih korisnika",
            "2. za brisanje informacija o korisnicima iz baze",
            "3. za dodavanje novih aranzmana",
            "4. za dodavanje novih destinacija",
            "5. za dodavanje novog smestaja",
            "6. za dodavanje nove objave",
            "7. za svidjanje objave",
            "8. za komentarisanje objave",
            "19. za kraj rada");

  	scanf("%d",&brojZahteva);

    switch (brojZahteva) {
    	case 1:
    		dodajKorisnika(&sql);
    		break;
      case 2:
        obrisiKorisnika(&sql);
        break;
      case 3:
        dodajAranzman(&sql);
        break;
      case 4:
        dodajDestinaciju(&sql);
        break;
      case 5:
        dodajSmestaj(&sql);
        break;
      case 6:
        dodajObjavu(&sql);
        break;
      case 7:
        svidjanjeObjave(&sql);
        break;
      case 8:
        komentarisanjeObjave(&sql);
        break;
    	case 19:
    		exit(EXIT_SUCCESS);
    	default:
    	  printf ("Pogresan izbor komande!\n");
    }

  }
  return 0;
}