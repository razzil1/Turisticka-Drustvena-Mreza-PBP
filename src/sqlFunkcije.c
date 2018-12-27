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