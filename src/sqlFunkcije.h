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
void ispisiSvidjanjaObjava(Sql *sql);
void ispisiKomentareObjava(Sql *sql);
void ispisiSvidjanjaSmestaja(Sql *sql);
void ispisiKomentareSmestaja(Sql *sql);
void ispisiSvidjanjaAranzmana(Sql *sql);
void ispisiKomentareAranzmana(Sql *sql);
void ispisiOceneVlasnika(Sql *sql);
void ispisiOceneAgencija(Sql *sql);
void ispisiRezervisanjeSmestaja(Sql *sql);
void ispisiRezervisanjeAranzmana(Sql *sql);
void ispisiKomuniciranje(Sql *sql);

void obrisiKorisnika(Sql *sql);
void obrisiAranzman(Sql *sql);
void obrisiSmestaj(Sql *sql);

void svidjanjeObjave(Sql *sql);
void svidjanjeSmestaja(Sql *sql);
void svidjanjeAranzmana(Sql *sql);

void komentarisanjeObjave(Sql *sql);
void komentarisanjeSmestaja(Sql *sql);
void komentarisanjeAranzmana(Sql *sql);

void ocenjivanjeVlasnika(Sql *sql);
void ocenjivanjeAgencije(Sql *sql);

void rezervisanjeSmestaja(Sql *sql);
void rezervisanjeAranzmana(Sql *sql);

void komuniciranje(Sql *sql);