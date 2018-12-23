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

-- testirati
drop trigger if exists ai_SVIDJANJE_OBJAVE|
create trigger bi_SVIDJANJE_OBJAVE after insert on SVIDJANJE_OBJAVE
for each row
begin
  update OBJAVA set brojSvidjanja = brojSvidjanja + 1;
end|

drop trigger if exists ai_SVIDJANJE_ARANZMANA|
create trigger bi_SVIDJANJE_ARANZMANA after insert on SVIDJANJE_ARANZMANA
for each row
begin
  update ARANZMAN set brojSvidjanja = brojSvidjanja + 1;
end|

drop trigger if exists ai_SVIDJANJE_SMESTAJA|
create trigger bi_SVIDJANJE_SMESTAJA after insert on SVIDJANJE_SMESTAJA
for each row
begin
  update SMESTAJ set brojSvidjanja = brojSvidjanja + 1;
end|

drop trigger if exists bi_REZERVISE_ARANZMAN|
create trigger bi_REZERVISE_ARANZMAN before insert on REZERVISE_ARANZMAN
for each row
begin
  if((select brojSlobodnihMesta from ARANZMAN where idAranzman = new.ARANZMAN_idAranzman) == 0) then
    SIGNAL SQLSTATE '45000' SET message_text = 'Greska: nema vise slobodnih mesta';
  else
    update ARANZMAN set brojSlobodnihMesta = brojSlobodnihMesta - 1 where idAranzman = new.ARANZMAN_idAranzman;
end|