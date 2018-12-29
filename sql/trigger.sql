delimiter |
use mydb|

drop trigger if exists bi_OCENJUJE_AGENCIJU|
create trigger bi_OCENJUJE_AGENCIJU before insert on OCENJUJE_AGENCIJU
for each row
begin
  if(new.ocena > 5 or new.ocena < 1) then
    SIGNAL SQLSTATE '45000' SET message_text = 'Greska: ocena mora biti u opsegu od 1 do 5';
	end if;
end|

drop trigger if exists bi_OCENJUJE_VLASNIKA|
create trigger bi_OCENJUJE_VLASNIKA before insert on OCENJUJE_VLASNIKA
for each row
begin
  if(new.ocena > 5 or new.ocena < 1) then
    SIGNAL SQLSTATE '45000' SET message_text = 'Greska: ocena mora biti u opsegu od 1 do 5';
	end if;
end|

drop trigger if exists ai_SVIDJANJE_OBJAVE|
create trigger bi_SVIDJANJE_OBJAVE after insert on SVIDJANJE_OBJAVE
for each row
begin
  update OBJAVA set brojSvidjanja = brojSvidjanja + 1 where idOBJAVA = new.OBJAVA_idOBJAVA;
end|

drop trigger if exists ai_SVIDJANJE_ARANZMANA|
create trigger bi_SVIDJANJE_ARANZMANA after insert on SVIDJANJE_ARANZMANA
for each row
begin
  update ARANZMAN set brojSvidjanja = brojSvidjanja + 1 where idAranzman = new.ARANZMAN_idAranzman;
end|

drop trigger if exists ai_SVIDJANJE_SMESTAJA|
create trigger bi_SVIDJANJE_SMESTAJA after insert on SVIDJANJE_SMESTAJA
for each row
begin
  update SMESTAJ set brojSvidjanja = brojSvidjanja + 1 where idSMESTAJ = new.SMESTAJ_idSMESTAJ;
end|

drop trigger if exists bi_REZERVISE_ARANZMAN|
create trigger bi_REZERVISE_ARANZMAN before insert on REZERVISE_ARANZMAN
for each row
begin
  if((select brojSlobodnihMesta from ARANZMAN where idAranzman = new.ARANZMAN_idAranzman) = 0) then
    SIGNAL SQLSTATE '45000' SET message_text = 'Greska: nema vise slobodnih mesta';
  else
    update ARANZMAN set brojSlobodnihMesta = brojSlobodnihMesta - 1 where idAranzman = new.ARANZMAN_idAranzman;
  end if;
end|

drop trigger if exists bi_REZERVISE_SMESTAJ|
create trigger bi_REZERVISE_SMESTAJ before insert on REZERVISE_SMESTAJ
for each row
begin
  if((select rezervisan from SMESTAJ where idSMESTAJ = new.SMESTAJ_idSMESTAJ) = 0) then
    update SMESTAJ set rezervisan = 1 where idSMESTAJ = new.SMESTAJ_idSMESTAJ;
  else
    SIGNAL SQLSTATE '45000' SET message_text = 'Greska: smestaj je vec rezervisan';
  end if;
end|

drop trigger if exists bi_ARANZMAN|
create trigger bi_ARANZMAN before insert on ARANZMAN
for each row
begin
  if(new.vremePocetka > new.vremeZavrsetka) then
    SIGNAL SQLSTATE '45000' SET message_text = 'Greska: datum zavrsetka mora biti veci od datuma pocetka';
	end if;
end|