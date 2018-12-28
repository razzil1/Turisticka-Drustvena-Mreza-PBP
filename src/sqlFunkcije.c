#include "sqlFunkcije.h"

void dodajKorisnika(Sql *sql)
{
	ispisiKorisnike(sql);
	while(1){
		printf("\n%s\n%s\n%s\n%s\n%s\n\n",
			"Unesite:",
			"1 za dodavanje turiste",
			"2 za dodavanje agencije",
      "3 za dodavanje vlasnika smestaja",
			"4 za kraj unosa/povratak na glavni meni");
		int broj;
		scanf("%d", &broj);
		switch(broj){
			case 1:
				ispisiTuriste(sql);
				dodajTuristu(sql);
				ispisiTuriste(sql);
				break;
			case 2:
				ispisiAgencije(sql);
				dodajAgenciju(sql);
				ispisiAgencije(sql);
				break;
			case 3:
        ispisiVlasnikeSmestaja(sql);
        dodajVlasnikaSmestaja(sql);
        ispisiVlasnikeSmestaja(sql);
        break;
      case 4:
				return;
			default:
				printf("Pogresan izbor komande\n");
		}
	}
}

void dodajTuristu(Sql *sql)
{
  printf("Unesite: \nid, \nkorisnicko ime, \nemail, \nsifru, \nime, \nprezime, \ntelefon, \nadresu\n\n");
  int id;
  char* korisnickoIme;
  char* email;
  char* sifra;
	char* ime;
  char* prezime;
  char* telefon;
  char* adresa;
	scanf("%d%ms%ms%ms%ms%ms%ms%ms", &id, &korisnickoIme, &email, &sifra, &ime, &prezime, &telefon, &adresa);

	sprintf(sql->query,"insert into KORISNIK (idKORISNIK, korisnickoIme, email, sifra) values (%d, '%s', '%s', '%s');", id, korisnickoIme, email, sifra);
	printf("Upit koji se izvrsava '%s'\n", sql->query);
	if (mysql_query(sql->connection, sql->query)) {
    	printf ("Neuspesno izvrsavanje upita dodajTuristu1\n");
    	exit (EXIT_FAILURE);
  	}

  	sprintf(sql->query,"insert into TURISTA (ime, prezime, telefon, adresa, KORISNIK_idKORISNIK) values ('%s', '%s', '%s', '%s', %d);", ime, prezime, telefon, adresa, id);
	printf("Upit koji se izvrsava %s\n", sql->query);
	if (mysql_query(sql->connection, sql->query)) {
    	printf ("Neuspesno izvrsavanje upita dodajTuristu2\n");
    	exit (EXIT_FAILURE);
  	}

  	free(korisnickoIme);
  	free(email);
    free(sifra);
    free(ime);
    free(prezime);
    free(telefon);
    free(adresa);
}

void dodajAgenciju(Sql *sql)
{
  printf("Unesite: \nid, \nkorisnicko ime, \nemail, \nsifru, \nPIB, \nnaziv, \nadresu, \ntelefon\n\n");
  int id;
  char* korisnickoIme;
  char* email;
  char* sifra;
	char* PIB;
  char* naziv;
  char* telefon;
  char* adresa;
	scanf("%d%ms%ms%ms%ms%ms%ms%ms", &id, &korisnickoIme, &email, &sifra, &PIB, &naziv, &adresa, &telefon);

	sprintf(sql->query,"insert into KORISNIK (idKORISNIK, korisnickoIme, email, sifra) values (%d, '%s', '%s', '%s');", id, korisnickoIme, email, sifra);
	printf("Upit koji se izvrsava '%s'\n", sql->query);
	if (mysql_query(sql->connection, sql->query)) {
    	printf ("Neuspesno izvrsavanje upita dodajAgenciju1\n");
    	exit (EXIT_FAILURE);
  	}

  	sprintf(sql->query,"insert into AGENCIJA (PIB, naziv, adresa, telefon, KORISNIK_idKORISNIK) values ('%s', '%s', '%s', '%s', %d);", PIB, naziv, adresa, telefon, id);
	printf("Upit koji se izvrsava %s\n", sql->query);
	if (mysql_query(sql->connection, sql->query)) {
    	printf ("Neuspesno izvrsavanje upita dodajAgenciju2\n");
    	exit (EXIT_FAILURE);
  	}

  	free(korisnickoIme);
  	free(email);
    free(sifra);
    free(PIB);
    free(naziv);
    free(adresa);
    free(telefon);
}

void dodajVlasnikaSmestaja(Sql *sql)
{
  printf("Unesite: \nid, \nkorisnicko ime, \nemail, \nsifru, \nime, \nprezime, \nPIB saradnika, \ntelefon, \nadresu\n\n");
  int id;
  char* korisnickoIme;
  char* email;
  char* sifra;
	char* ime;
  char* prezime;
  char* PIB_saradnika;
  char* telefon;
  char* adresa;
	scanf("%d%ms%ms%ms%ms%ms%ms%ms%ms", &id, &korisnickoIme, &email, &sifra, &ime, &prezime, &PIB_saradnika, &telefon, &adresa);

	sprintf(sql->query,"insert into KORISNIK (idKORISNIK, korisnickoIme, email, sifra) values (%d, '%s', '%s', '%s');", id, korisnickoIme, email, sifra);
	printf("Upit koji se izvrsava '%s'\n", sql->query);
	if (mysql_query(sql->connection, sql->query)) {
    	printf ("Neuspesno izvrsavanje upita dodajVlasnikaSmestaja1\n");
    	exit (EXIT_FAILURE);
  	}

  	sprintf(sql->query,"insert into VLASNIK_SMESTAJA (ime, prezime, PIB_saradnika, telefon, adresa, KORISNIK_idKORISNIK) values ('%s', '%s', '%s', '%s', '%s', %d);", ime, prezime, PIB_saradnika, telefon, adresa, id);
	printf("Upit koji se izvrsava %s\n", sql->query);
	if (mysql_query(sql->connection, sql->query)) {
    	printf ("Neuspesno izvrsavanje upita dodajVlasnikaSmestaja2\n");
    	exit (EXIT_FAILURE);
  	}

  	free(korisnickoIme);
  	free(email);
    free(sifra);
    free(ime);
    free(prezime);
    free(PIB_saradnika);
    free(telefon);
    free(adresa);
}

void dodajAranzman(Sql *sql)
{

  ispisiAgencije(sql);
  ispisiAranzmane(sql);

  printf("Unesite: \nid, \ncena, \nvreme pocetka (format: 'YYYY-MM-DD'), \nvreme zavrsetka (format: 'YYYY-MM-DD'), \nbroj slobodnih mesta, \nbroj svidjanja, \npib agencije, \nid agencije\n\n");
  int id;
  int cena;
  char* vremePocetka;
  char* vremeZavrsetka;
	int brojSlobodnihMesta;
  int brojSvidjanja;
  char* PIB_agencije;
  int idAgencije;
	scanf("%d%d%ms%ms%d%d%ms%d", &id, &cena, &vremePocetka, &vremeZavrsetka, &brojSlobodnihMesta, &brojSvidjanja, &PIB_agencije, &idAgencije);

	sprintf(sql->query,"insert into ARANZMAN (idAranzman, cena, vremePocetka, vremeZavrsetka, brojSlobodnihMesta, brojSvidjanja, AGENCIJA_PIB, AGENCIJA_KORISNIK_idKORISNIK) values (%d, %d, '%s', '%s', %d, %d, '%s', %d);", id, cena, vremePocetka, vremeZavrsetka, brojSlobodnihMesta, brojSvidjanja, PIB_agencije, idAgencije);
	printf("Upit koji se izvrsava '%s'\n", sql->query);
	if (mysql_query(sql->connection, sql->query)) {
    	printf ("Neuspesno izvrsavanje upita dodajAgenciju\n");
    	exit (EXIT_FAILURE);
  	}

    ispisiAranzmane(sql);
    ispisiDestinacije(sql);

    int idDestinacije;
    printf("Unesite id destinacija koje pripadaju aranzmanu ili 0 za izlaz: ");
    scanf("%d", &idDestinacije);

    while(idDestinacije != 0) {

      sprintf(sql->query,"insert into SADRZI (ARANZMAN_idAranzman, DESTINACIJA_idDESTINACIJA) values (%d, %d);", id, idDestinacije);
	    printf("Upit koji se izvrsava '%s'\n", sql->query);
	    if (mysql_query(sql->connection, sql->query)) {
    	  printf ("Neuspesno izvrsavanje upita dodajAgenciju\n");
    	  exit (EXIT_FAILURE);
  	  }
      ispisiSadrzi(sql);

      scanf("%d", &idDestinacije);
    }

  	free(vremePocetka);
    free(vremeZavrsetka);
    free(PIB_agencije);

}

void dodajDestinaciju(Sql *sql)
{

  ispisiDestinacije(sql);

  printf("Unesite: \nid, \ndrzavu, \ngrad\n\n");
  int id;
  char* drzava;
  char* grad;
	scanf("%d%ms%ms", &id, &drzava, &grad);

	sprintf(sql->query,"insert into DESTINACIJA (idDESTINACIJA, drzava, grad) values (%d, '%s', '%s');", id, drzava, grad);
	printf("Upit koji se izvrsava '%s'\n", sql->query);
	if (mysql_query(sql->connection, sql->query)) {
    printf ("Neuspesno izvrsavanje upita dodajDestinaciju\n");
    exit (EXIT_FAILURE);
  }

  ispisiDestinacije(sql);

  free(drzava);
  free(grad);
}

void dodajSmestaj(Sql *sql)
{
  ispisiVlasnikeSmestaja(sql);
  ispisiSmestaje(sql);

  printf("Unesite: \nid, \ncenu, \nadresu, \nda li je smestaj rezervisan (0/1), \ntip smestaja, \nbroj svidjanja, \nid vlasnika smestaja\n\n");
  int id;
  int cena;
  char* adresa;
  int rezervisanost;
  char* tip;
  int brojSvidjanja;
  int idVlasnika;
	scanf("%d%d%ms%d%ms%d%d", &id, &cena, &adresa, &rezervisanost, &tip, &brojSvidjanja, &idVlasnika);

	sprintf(sql->query,"insert into SMESTAJ (idSMESTAJ, cena, adresa, rezervisan, tipSmestaja, brojSvidjanja, VLASNIK_SMESTAJA_KORISNIK_idKORISNIK) values (%d, %d, '%s', %d, '%s', %d, %d);", id, cena, adresa, rezervisanost, tip, brojSvidjanja, idVlasnika);
	printf("Upit koji se izvrsava '%s'\n", sql->query);
	if (mysql_query(sql->connection, sql->query)) {
    printf ("Neuspesno izvrsavanje upita dodajSmestaj\n");
    exit (EXIT_FAILURE);
  }

  ispisiSmestaje(sql);

  free(adresa);
  free(tip);
}

void dodajObjavu(Sql *sql)
{
  ispisiTuriste(sql);
  ispisiObjave(sql);

  printf("Unesite: \nid, \nsadrzaj, \nvreme kreiranja, \nbroj svidjanja, \nid turiste\n\n");
  int id;
  char* sadrzaj;
  char* vremeKreiranja;
  int brojSvidjanja;
  int idTuriste;
	scanf("%d%ms%ms%d%d", &id, &sadrzaj, &vremeKreiranja, &brojSvidjanja, &idTuriste);

	sprintf(sql->query,"insert into OBJAVA (idOBJAVA, sadrzaj, vremeKreiranja, brojSvidjanja, TURISTA_KORISNIK_idKORISNIK) values (%d, '%s', '%s', %d, %d);", id, sadrzaj, vremeKreiranja, brojSvidjanja, idTuriste);
	printf("Upit koji se izvrsava '%s'\n", sql->query);
	if (mysql_query(sql->connection, sql->query)) {
    printf ("Neuspesno izvrsavanje upita dodajObjavu\n");
    exit (EXIT_FAILURE);
  }

  ispisiObjave(sql);

  free(sadrzaj);
  free(vremeKreiranja);
}

void ispisiKorisnike(Sql *sql)
{
	sprintf (sql->query, "select * from KORISNIK;");
  printf("Upit koji se izvrsava %s\n", sql->query);
  if (mysql_query(sql->connection, sql->query)) {
    printf ("Neuspesno izvrsavanje upita\n");
    exit (EXIT_FAILURE);
  }

  sql->result = mysql_use_result(sql->connection);

  sql->column = mysql_fetch_fields(sql->result);

  int n = mysql_field_count(sql->connection);

  for (int i=0;i<n; i++) {
    printf ("%s\t\t", sql->column[i].name);
  }
  printf ("\n\n");

  while ((sql->row = mysql_fetch_row(sql->result))) {
    for (int i=0; i<n; i++)
      printf ("%s\t\t", sql->row[i]);
    printf ("\n");
  }
  printf ("\n\n");
}

void ispisiTuriste(Sql *sql)
{
	sprintf (sql->query, "select * from TURISTA");

  if (mysql_query(sql->connection, sql->query)) {
    printf ("Neuspesno izvrsavanje upita\n");
    exit (EXIT_FAILURE);
  }

  sql->result = mysql_use_result(sql->connection);

  sql->column = mysql_fetch_fields(sql->result);

  int n = mysql_field_count(sql->connection);

  for (int i=0;i<n;i++) {
    printf ("%s\t\t", sql->column[i].name);
  }
  printf ("\n\n");

  while ((sql->row = mysql_fetch_row(sql->result))) {
    for (int i=0;i<n;i++)
      printf ("%s\t\t", sql->row[i]);
    printf ("\n");
  }
  printf ("\n\n");
}

void ispisiAgencije(Sql *sql)
{
	sprintf (sql->query, "select * from AGENCIJA");

  if (mysql_query(sql->connection, sql->query)) {
    printf ("Neuspesno izvrsavanje upita\n");
    exit (EXIT_FAILURE);
  }

  sql->result = mysql_use_result(sql->connection);

  sql->column = mysql_fetch_fields(sql->result);

  int n = mysql_field_count(sql->connection);

  for (int i=0;i<n;i++) {
    printf ("%s\t\t", sql->column[i].name);
  }
  printf ("\n\n");

  while ((sql->row = mysql_fetch_row(sql->result))) {
    for (int i=0;i<n;i++)
      printf ("%s\t\t", sql->row[i]);
    printf ("\n");
  }
  printf ("\n\n");
}

void ispisiVlasnikeSmestaja(Sql *sql)
{
	sprintf(sql->query, "select * from VLASNIK_SMESTAJA");

  if(mysql_query(sql->connection, sql->query)) {
    printf("Neuspesno izvrsavanje upita\n");
    exit(EXIT_FAILURE);
  }

  sql->result = mysql_use_result(sql->connection);

  sql->column = mysql_fetch_fields(sql->result);

  int n = mysql_field_count(sql->connection);

  for (int i=0;i<n;i++) {
    printf ("%s\t\t", sql->column[i].name);
  }
  printf ("\n\n");

  while ((sql->row = mysql_fetch_row(sql->result))) {
    for (int i=0;i<n;i++)
      printf ("%s\t\t", sql->row[i]);
    printf ("\n");
  }
  printf ("\n\n");
}

void ispisiAranzmane(Sql *sql)
{
	sprintf(sql->query, "select * from ARANZMAN");

  if(mysql_query(sql->connection, sql->query)) {
    printf("Neuspesno izvrsavanje upita\n");
    exit(EXIT_FAILURE);
  }

  sql->result = mysql_use_result(sql->connection);

  sql->column = mysql_fetch_fields(sql->result);

  int n = mysql_field_count(sql->connection);

  for (int i=0;i<n;i++) {
    printf ("%s\t\t", sql->column[i].name);
  }
  printf ("\n\n");

  while ((sql->row = mysql_fetch_row(sql->result))) {
    for (int i=0;i<n;i++)
      printf ("%s\t\t", sql->row[i]);
    printf ("\n");
  }
  printf ("\n\n");
}

void ispisiDestinacije(Sql *sql)
{
	sprintf(sql->query, "select * from DESTINACIJA");

  if(mysql_query(sql->connection, sql->query)) {
    printf("Neuspesno izvrsavanje upita\n");
    exit(EXIT_FAILURE);
  }

  sql->result = mysql_use_result(sql->connection);

  sql->column = mysql_fetch_fields(sql->result);

  int n = mysql_field_count(sql->connection);

  for (int i=0;i<n;i++) {
    printf ("%s\t\t", sql->column[i].name);
  }
  printf ("\n\n");

  while ((sql->row = mysql_fetch_row(sql->result))) {
    for (int i=0;i<n;i++)
      printf ("%s\t\t", sql->row[i]);
    printf ("\n");
  }
  printf ("\n\n");
}

void ispisiSadrzi(Sql *sql)
{
	sprintf(sql->query, "select * from SADRZI");

  if(mysql_query(sql->connection, sql->query)) {
    printf("Neuspesno izvrsavanje upita\n");
    exit(EXIT_FAILURE);
  }

  sql->result = mysql_use_result(sql->connection);

  sql->column = mysql_fetch_fields(sql->result);

  int n = mysql_field_count(sql->connection);

  for (int i=0;i<n;i++) {
    printf ("%s\t\t", sql->column[i].name);
  }
  printf ("\n\n");

  while ((sql->row = mysql_fetch_row(sql->result))) {
    for (int i=0;i<n;i++)
      printf ("%s\t\t", sql->row[i]);
    printf ("\n");
  }
  printf ("\n\n");
}

void ispisiSmestaje(Sql *sql)
{
	sprintf(sql->query, "select * from SMESTAJ");

  if(mysql_query(sql->connection, sql->query)) {
    printf("Neuspesno izvrsavanje upita\n");
    exit(EXIT_FAILURE);
  }

  sql->result = mysql_use_result(sql->connection);

  sql->column = mysql_fetch_fields(sql->result);

  int n = mysql_field_count(sql->connection);

  for (int i=0;i<n;i++) {
    printf ("%s\t\t", sql->column[i].name);
  }
  printf ("\n\n");

  while ((sql->row = mysql_fetch_row(sql->result))) {
    for (int i=0;i<n;i++)
      printf ("%s\t\t", sql->row[i]);
    printf ("\n");
  }
  printf ("\n\n");
}

void ispisiObjave(Sql *sql)
{
	sprintf(sql->query, "select * from OBJAVA");

  if(mysql_query(sql->connection, sql->query)) {
    printf("Neuspesno izvrsavanje upita\n");
    exit(EXIT_FAILURE);
  }

  sql->result = mysql_use_result(sql->connection);

  sql->column = mysql_fetch_fields(sql->result);

  int n = mysql_field_count(sql->connection);

  for (int i=0;i<n;i++) {
    printf ("%s\t\t", sql->column[i].name);
  }
  printf ("\n\n");

  while ((sql->row = mysql_fetch_row(sql->result))) {
    for (int i=0;i<n;i++)
      printf ("%s\t\t", sql->row[i]);
    printf ("\n");
  }
  printf ("\n\n");
}

void ispisiKomentareObjava(Sql *sql)
{
	sprintf(sql->query, "select * from KOMENTARISE_OBJAVU");

  if(mysql_query(sql->connection, sql->query)) {
    printf("Neuspesno izvrsavanje upita\n");
    exit(EXIT_FAILURE);
  }

  sql->result = mysql_use_result(sql->connection);

  sql->column = mysql_fetch_fields(sql->result);

  int n = mysql_field_count(sql->connection);

  for (int i=0;i<n;i++) {
    printf ("%s\t\t", sql->column[i].name);
  }
  printf ("\n\n");

  while ((sql->row = mysql_fetch_row(sql->result))) {
    for (int i=0;i<n;i++)
      printf ("%s\t\t", sql->row[i]);
    printf ("\n");
  }
  printf ("\n\n");
}

void obrisiKorisnika(Sql *sql)
{
  printf("Tabela Korisnik pre brisanja:\n\n");
  ispisiKorisnike(sql);

  printf("Unesite id korisnika koga zelite da izbrisete iz baze:\n");

  int id;
  scanf("%i", &id);

  sprintf (sql->query, "delete from KORISNIK where idKORISNIK=%i;", id);

  if (mysql_query(sql->connection, sql->query)) {
    printf ("Neuspesno izvrsavanje upita\n");
    exit (EXIT_FAILURE);
  }

  printf ("Tabela Korisnik nakon brisanja:\n\n");
  ispisiKorisnike(sql);
  printf("\n\n");
}

void svidjanjeObjave(Sql *sql)
{
  ispisiTuriste(sql);
  ispisiObjave(sql);

  printf("Unesite: \nid objave, \nid turiste\n\n");
  int idObjave;
  int idTuriste;
	scanf("%d%d", &idObjave, &idTuriste);

	sprintf(sql->query,"insert into SVIDJANJE_OBJAVE (OBJAVA_idOBJAVA, TURISTA_KORISNIK_idKORISNIK) values (%d, %d);", idObjave, idTuriste);
	printf("Upit koji se izvrsava '%s'\n", sql->query);
	if (mysql_query(sql->connection, sql->query)) {
    printf ("Neuspesno izvrsavanje upita svidjanjeObjave\n");
    exit (EXIT_FAILURE);
  }

  ispisiObjave(sql);
}

void komentarisanjeObjave(Sql *sql)
{
  ispisiTuriste(sql);
  ispisiObjave(sql);
  ispisiKomentareObjava(sql);

  printf("Unesite: \nid turiste, \nid objave, \nsadrzaj, \nvreme kreiranja\n\n");
  int idTuriste;
  int idObjave;
  char* sadrzaj;
  char* vremeKreiranja;
	scanf("%d%d%ms%ms", &idTuriste, &idObjave, &sadrzaj, &vremeKreiranja);

	sprintf(sql->query,"insert into KOMENTARISE_OBJAVU (TURISTA_KORISNIK_idKORISNIK, OBJAVA_idOBJAVA, sadrzaj, vremeKreiranja) values (%d, %d, '%s', '%s');", idTuriste, idObjave, sadrzaj, vremeKreiranja);
	printf("Upit koji se izvrsava '%s'\n", sql->query);
	if (mysql_query(sql->connection, sql->query)) {
    printf ("Neuspesno izvrsavanje upita komentarisanjeObjave\n");
    exit (EXIT_FAILURE);
  }

  ispisiKomentareObjava(sql);
}