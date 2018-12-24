use mydb;

insert into KORISNIK (idKORISNIK, korisnickoIme, email, sifra)
values  (1000, 'razzil1', 'razzil1@yahoo.com', 'test'),
        (1001, 'mare995', 'marko@spartans.tect', 'test'),
        (1002, 'jungleTribe', 'jungletravel@gmail.com', 'test'),
        (1003, 'prodavacSmestaja', 'prodaja@smestaj.com', 'test');

insert into AGENCIJA (PIB, naziv, adresa, telefon, KORISNIK_idKORISNIK)
values  ('100', 'Junge Tribe', 'Gospodar Jevremova', '+381641111111', 1002);

insert into TURISTA (ime, prezime, telefon, adresa, KORISNIK_idKORISNIK)
values  ('Dusan', 'Pilipovic', '+381649953314', 'Uzdinska 11f', 1000),
        ('Marko', 'Petricic', '+381642222222', 'Sarajevska', 1001);

insert into VLASNIK_SMESTAJA (ime, prezime, PIB_saradnika, telefon, adresa, KORISNIK_idKORISNIK)
values  ('Srdjan', 'Lazarevic', '101', '+361643333333', 'Arandjelovac', 1003);

insert into ARANZMAN (idAranzman, cena, vremePocetka, vremeZavrsetka, brojSlobodnihMesta, brojSvidjanja, AGENCIJA_PIB, AGENCIJA_KORISNIK_idKORISNIK)
values  (10000, '1000', '2018-12-30', '2019-01-03', 30, 0, '100', 1002);

insert into DESTINACIJA (idDESTINACIJA, drzava, grad)
values  (100000, 'Francuska', 'Pariz');

insert into SADRZI (ARANZMAN_idAranzman, DESTINACIJA_idDESTINACIJA)
values  (10000, 100000);

insert into SMESTAJ (idSMESTAJ, cena, adresa, rezervisan, tipSmestaja, brojSvidjanja, VLASNIK_SMESTAJA_KORISNIK_idKORISNIK)
values  (1000000, 30, 'Francuska 11f', 0, 'Apartman', 0, 1003);

insert into OBJAVA (idOBJAVA, sadrzaj, vremeKreiranja, brojSvidjanja, TURISTA_KORISNIK_idKORISNIK)
values  (1010, 'Putovanje u Kinu je bilo odlicno :)', '2018-01-01', 0, 1001);

insert into OCENJUJE_AGENCIJU (TURISTA_KORISNIK_idKORISNIK, AGENCIJA_PIB, AGENCIJA_KORISNIK_idKORISNIK, ocena)
values  (1000, '100', 1002, 5),
        (1001, '100', 1002, 4);

insert into OCENJUJE_VLASNIKA (TURISTA_KORISNIK_idKORISNIK, VLASNIK_SMESTAJA_KORISNIK_idKORISNIK, ocena)
values  (1000, 1003, 5),
        (1001, 1003, 5);

insert into KOMENTARISE_OBJAVU (TURISTA_KORISNIK_idKORISNIK, OBJAVA_idOBJAVA, sadrzaj, vremeKreiranja)
values  (1000, 1010, 'Slike izgledaju odlicno!', '2018-01-02');

insert into SVIDJANJE_OBJAVE (OBJAVA_idOBJAVA, TURISTA_KORISNIK_idKORISNIK)
values  (1010, 1000);

insert into KOMENTARISE_ARANZMAN (TURISTA_KORISNIK_idKORISNIK, ARANZMAN_idAranzman, sadrzaj, vremeKreiranja)
values  (1000, 10000, 'Super destinacija!', '2018-12-01');

insert into SVIDJANJE_ARANZMANA (ARANZMAN_idAranzman, TURISTA_KORISNIK_idKORISNIK)
values  (10000, 1000);

insert into SVIDJANJE_SMESTAJA (TURISTA_KORISNIK_idKORISNIK, SMESTAJ_idSMESTAJ)
values  (1000, 1000000);

insert into KOMENTARISANJE_SMESTAJA (TURISTA_KORISNIK_idKORISNIK, SMESTAJ_idSMESTAJ, sadrzaj, vremeKreiranja)
values  (1000, 1000000, 'Super je sve.', '2018-03-03');

insert into REZERVISE_ARANZMAN (TURISTA_KORISNIK_idKORISNIK, ARANZMAN_idAranzman)
values  (1000, 10000);

insert into REZERVISE_SMESTAJ (TURISTA_KORISNIK_idKORISNIK, SMESTAJ_idSMESTAJ)
values  (1000, 1000000);

insert into KOMUNICIRA (TURISTA_KORISNIK_idKORISNIK, TURISTA_KORISNIK_idKORISNIK1, poruke)
values  (1000, 1001, 'message1: Koja je sledeca destinacija / message2: Idemo u Rim! ');