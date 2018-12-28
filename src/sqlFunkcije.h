#include "turistickaDrustvenaMreza.h"

void dodajKorisnika(Sql *sql);
void dodajTuristu(Sql *sql);
void dodajAgenciju(Sql *sql);
void dodajVlasnikaSmestaja(Sql *sql);
void dodajAranzman(Sql *sql);
void dodajDestinaciju(Sql *sql);
void dodajSmestaj(Sql *sql);
void dodajObjavu(Sql *sql);

void ispisiKorisnike(Sql *sql);
void ispisiTuriste(Sql *sql);
void ispisiAgencije(Sql *sql);
void ispisiVlasnikeSmestaja(Sql *sql);
void ispisiAranzmane(Sql *sql);
void ispisiDestinacije(Sql *sql);
void ispisiSadrzi(Sql *sql);
void ispisiSmestaje(Sql *sql);
void ispisiObjave(Sql *sql);
void ispisiKomentareObjava(Sql *sql);

void obrisiKorisnika(Sql *sql);

void svidjanjeObjave(Sql *sql);
void komentarisanjeObjave(Sql *sql);