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
  	printf ("%s:\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n\n",
            "Unesite",
            "1. za dodavanje novih korisnika",
            "2. za brisanje informacija o korisnicima iz baze",
            "3. za dodavanje novih aranzmana",
            "4. za dodavanje novih destinacija",
            "5. za dodavanje novog smestaja",
            "6. za dodavanje nove objave",
            "7. za komuniciranje",
            "8. za svidjanje objave",
            "9. za komentarisanje objave",
            "10. za svidjanje smestaja",
            "11. za komentarisanje smestaja",
            "12. za svidjanje aranzmana",
            "13. za komentarisanje aranzmana",
            "14. za ocenjivanje vlasnika",
            "15. za ocenjivanje agencije",
            "16. za rezervisanje smestaja",
            "17. za rezervisanje aranzmana",
            "18. za brisanje aranzmana",
            "19. za brisanje smestaja",
            "20. za kraj rada");

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
        komuniciranje(&sql);
        break;
      case 8:
        svidjanjeObjave(&sql);
        break;
      case 9:
        komentarisanjeObjave(&sql);
        break;
      case 10:
        svidjanjeSmestaja(&sql);
        break;
      case 11:
        komentarisanjeSmestaja(&sql);
        break;
      case 12:
        svidjanjeAranzmana(&sql);
        break;
      case 13:
        komentarisanjeAranzmana(&sql);
        break;
      case 14:
        ocenjivanjeVlasnika(&sql);
        break;
      case 15:
        ocenjivanjeAgencije(&sql);
        break;
      case 16:
        rezervisanjeSmestaja(&sql);
        break;
      case 17:
        rezervisanjeAranzmana(&sql);
        break;
      case 18:
        obrisiAranzman(&sql);
        break;
      case 19:
        obrisiSmestaj(&sql);
        break;
    	case 20:
    		exit(EXIT_SUCCESS);
    	default:
    	  printf ("Pogresan izbor komande!\n");
    }

  }
  return 0;
}