-- MySQL Script generated by MySQL Workbench
-- Sat Dec 15 17:13:41 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`KORISNIK`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`KORISNIK` ;

CREATE TABLE IF NOT EXISTS `mydb`.`KORISNIK` (
  `idKORISNIK` INT NOT NULL,
  `korisničkoIme` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `šifra` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idKORISNIK`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `korisničkoIme_UNIQUE` ON `mydb`.`KORISNIK` (`korisničkoIme` ASC) VISIBLE;

CREATE UNIQUE INDEX `email_UNIQUE` ON `mydb`.`KORISNIK` (`email` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`AGENCIJA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`AGENCIJA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`AGENCIJA` (
  `PIB` VARCHAR(45) NOT NULL,
  `naziv` VARCHAR(45) NOT NULL,
  `adresa` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NOT NULL,
  `KORISNIK_idKORISNIK` INT NOT NULL,
  PRIMARY KEY (`PIB`, `KORISNIK_idKORISNIK`),
  CONSTRAINT `fk_AGENCIJA_KORISNIK1`
    FOREIGN KEY (`KORISNIK_idKORISNIK`)
    REFERENCES `mydb`.`KORISNIK` (`idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_AGENCIJA_KORISNIK1_idx` ON `mydb`.`AGENCIJA` (`KORISNIK_idKORISNIK` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`TURISTA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TURISTA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TURISTA` (
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NOT NULL,
  `adresa` VARCHAR(45) NOT NULL,
  `KORISNIK_idKORISNIK` INT NOT NULL,
  PRIMARY KEY (`KORISNIK_idKORISNIK`),
  CONSTRAINT `fk_TURISTA_KORISNIK`
    FOREIGN KEY (`KORISNIK_idKORISNIK`)
    REFERENCES `mydb`.`KORISNIK` (`idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VLASNIK SMESTAJA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`VLASNIK SMESTAJA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`VLASNIK SMESTAJA` (
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `PIB_saradnika` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NOT NULL,
  `adresa` VARCHAR(45) NOT NULL,
  `KORISNIK_idKORISNIK` INT NOT NULL,
  PRIMARY KEY (`KORISNIK_idKORISNIK`),
  CONSTRAINT `fk_VLASNIK SMESTAJA_KORISNIK1`
    FOREIGN KEY (`KORISNIK_idKORISNIK`)
    REFERENCES `mydb`.`KORISNIK` (`idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Objavi`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Objavi` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Objavi` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ARANZMAN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ARANZMAN` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ARANZMAN` (
  `idAranzman` INT NOT NULL,
  `cena` VARCHAR(45) NOT NULL,
  `vremePočetka` DATE NOT NULL,
  `vremeZavršetka` DATE NOT NULL,
  `brojSlobodnihMesta` INT NOT NULL,
  `AGENCIJA_PIB` VARCHAR(45) NOT NULL,
  `AGENCIJA_KORISNIK_idKORISNIK` INT NOT NULL,
  PRIMARY KEY (`idAranzman`),
  CONSTRAINT `fk_ARANZMAN_AGENCIJA1`
    FOREIGN KEY (`AGENCIJA_PIB` , `AGENCIJA_KORISNIK_idKORISNIK`)
    REFERENCES `mydb`.`AGENCIJA` (`PIB` , `KORISNIK_idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ARANZMAN_AGENCIJA1_idx` ON `mydb`.`ARANZMAN` (`AGENCIJA_PIB` ASC, `AGENCIJA_KORISNIK_idKORISNIK` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`DESTINACIJA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DESTINACIJA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DESTINACIJA` (
  `idDESTINACIJA` INT NOT NULL,
  `država` VARCHAR(45) NULL,
  `grad` VARCHAR(45) NULL,
  PRIMARY KEY (`idDESTINACIJA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SADRZI`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`SADRZI` ;

CREATE TABLE IF NOT EXISTS `mydb`.`SADRZI` (
  `ARANZMAN_idAranzman` INT NOT NULL,
  `DESTINACIJA_idDESTINACIJA` INT NOT NULL,
  PRIMARY KEY (`ARANZMAN_idAranzman`, `DESTINACIJA_idDESTINACIJA`),
  CONSTRAINT `fk_SADRZI_ARANZMAN1`
    FOREIGN KEY (`ARANZMAN_idAranzman`)
    REFERENCES `mydb`.`ARANZMAN` (`idAranzman`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SADRZI_DESTINACIJA1`
    FOREIGN KEY (`DESTINACIJA_idDESTINACIJA`)
    REFERENCES `mydb`.`DESTINACIJA` (`idDESTINACIJA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SADRZI_DESTINACIJA1_idx` ON `mydb`.`SADRZI` (`DESTINACIJA_idDESTINACIJA` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`SMESTAJ`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`SMESTAJ` ;

CREATE TABLE IF NOT EXISTS `mydb`.`SMESTAJ` (
  `idSMESTAJ` INT NOT NULL,
  `cena` INT NOT NULL,
  `adresa` VARCHAR(45) NULL,
  `rezervisan` TINYINT NOT NULL,
  `tipSmeštaja` VARCHAR(45) NOT NULL,
  `VLASNIK SMESTAJA_KORISNIK_idKORISNIK` INT NOT NULL,
  PRIMARY KEY (`idSMESTAJ`),
  CONSTRAINT `fk_SMESTAJ_VLASNIK SMESTAJA1`
    FOREIGN KEY (`VLASNIK SMESTAJA_KORISNIK_idKORISNIK`)
    REFERENCES `mydb`.`VLASNIK SMESTAJA` (`KORISNIK_idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SMESTAJ_VLASNIK SMESTAJA1_idx` ON `mydb`.`SMESTAJ` (`VLASNIK SMESTAJA_KORISNIK_idKORISNIK` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`OBJAVA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`OBJAVA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`OBJAVA` (
  `idOBJAVA` INT NOT NULL,
  `sadržaj` VARCHAR(45) NOT NULL,
  `vremeKreiranja` DATE NOT NULL,
  `brojSviđanja` INT NOT NULL,
  `TURISTA_KORISNIK_idKORISNIK` INT NOT NULL,
  PRIMARY KEY (`idOBJAVA`),
  CONSTRAINT `fk_OBJAVA_TURISTA1`
    FOREIGN KEY (`TURISTA_KORISNIK_idKORISNIK`)
    REFERENCES `mydb`.`TURISTA` (`KORISNIK_idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_OBJAVA_TURISTA1_idx` ON `mydb`.`OBJAVA` (`TURISTA_KORISNIK_idKORISNIK` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`OCENJUJE_AGENCIJU`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`OCENJUJE_AGENCIJU` ;

CREATE TABLE IF NOT EXISTS `mydb`.`OCENJUJE_AGENCIJU` (
  `TURISTA_KORISNIK_idKORISNIK` INT NOT NULL,
  `AGENCIJA_PIB` VARCHAR(45) NOT NULL,
  `AGENCIJA_KORISNIK_idKORISNIK` INT NOT NULL,
  `ocena` INT NOT NULL,
  PRIMARY KEY (`TURISTA_KORISNIK_idKORISNIK`, `AGENCIJA_PIB`, `AGENCIJA_KORISNIK_idKORISNIK`),
  CONSTRAINT `fk_OCENJUJE_AGENCIJU_TURISTA1`
    FOREIGN KEY (`TURISTA_KORISNIK_idKORISNIK`)
    REFERENCES `mydb`.`TURISTA` (`KORISNIK_idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OCENJUJE_AGENCIJU_AGENCIJA1`
    FOREIGN KEY (`AGENCIJA_PIB` , `AGENCIJA_KORISNIK_idKORISNIK`)
    REFERENCES `mydb`.`AGENCIJA` (`PIB` , `KORISNIK_idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_OCENJUJE_AGENCIJU_AGENCIJA1_idx` ON `mydb`.`OCENJUJE_AGENCIJU` (`AGENCIJA_PIB` ASC, `AGENCIJA_KORISNIK_idKORISNIK` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`OCENJUJE_VLASNIKA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`OCENJUJE_VLASNIKA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`OCENJUJE_VLASNIKA` (
  `TURISTA_KORISNIK_idKORISNIK` INT NOT NULL,
  `VLASNIK SMESTAJA_KORISNIK_idKORISNIK` INT NOT NULL,
  `ocena` INT NOT NULL,
  PRIMARY KEY (`TURISTA_KORISNIK_idKORISNIK`, `VLASNIK SMESTAJA_KORISNIK_idKORISNIK`),
  CONSTRAINT `fk_OCENJUJE_VLASNIKA_TURISTA1`
    FOREIGN KEY (`TURISTA_KORISNIK_idKORISNIK`)
    REFERENCES `mydb`.`TURISTA` (`KORISNIK_idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OCENJUJE_VLASNIKA_VLASNIK SMESTAJA1`
    FOREIGN KEY (`VLASNIK SMESTAJA_KORISNIK_idKORISNIK`)
    REFERENCES `mydb`.`VLASNIK SMESTAJA` (`KORISNIK_idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_OCENJUJE_VLASNIKA_VLASNIK SMESTAJA1_idx` ON `mydb`.`OCENJUJE_VLASNIKA` (`VLASNIK SMESTAJA_KORISNIK_idKORISNIK` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`KOMENTARISE_OBJAVU`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`KOMENTARISE_OBJAVU` ;

CREATE TABLE IF NOT EXISTS `mydb`.`KOMENTARISE_OBJAVU` (
  `TURISTA_KORISNIK_idKORISNIK` INT NOT NULL,
  `OBJAVA_idOBJAVA` INT NOT NULL,
  `sadržaj` VARCHAR(45) NOT NULL,
  `vremeKreiranja` DATE NOT NULL,
  PRIMARY KEY (`TURISTA_KORISNIK_idKORISNIK`, `OBJAVA_idOBJAVA`),
  CONSTRAINT `fk_KOMENTARISE_OBJAVU_TURISTA1`
    FOREIGN KEY (`TURISTA_KORISNIK_idKORISNIK`)
    REFERENCES `mydb`.`TURISTA` (`KORISNIK_idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_KOMENTARISE_OBJAVU_OBJAVA1`
    FOREIGN KEY (`OBJAVA_idOBJAVA`)
    REFERENCES `mydb`.`OBJAVA` (`idOBJAVA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_KOMENTARISE_OBJAVU_OBJAVA1_idx` ON `mydb`.`KOMENTARISE_OBJAVU` (`OBJAVA_idOBJAVA` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`SVIDJANJE_OBJAVE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`SVIDJANJE_OBJAVE` ;

CREATE TABLE IF NOT EXISTS `mydb`.`SVIDJANJE_OBJAVE` (
  `OBJAVA_idOBJAVA` INT NOT NULL,
  `TURISTA_KORISNIK_idKORISNIK` INT NOT NULL,
  PRIMARY KEY (`OBJAVA_idOBJAVA`, `TURISTA_KORISNIK_idKORISNIK`),
  CONSTRAINT `fk_SVIDJANJE_OBJAVE_OBJAVA1`
    FOREIGN KEY (`OBJAVA_idOBJAVA`)
    REFERENCES `mydb`.`OBJAVA` (`idOBJAVA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SVIDJANJE_OBJAVE_TURISTA1`
    FOREIGN KEY (`TURISTA_KORISNIK_idKORISNIK`)
    REFERENCES `mydb`.`TURISTA` (`KORISNIK_idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SVIDJANJE_OBJAVE_TURISTA1_idx` ON `mydb`.`SVIDJANJE_OBJAVE` (`TURISTA_KORISNIK_idKORISNIK` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`KOMENTARISE_ARANZMAN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`KOMENTARISE_ARANZMAN` ;

CREATE TABLE IF NOT EXISTS `mydb`.`KOMENTARISE_ARANZMAN` (
  `TURISTA_KORISNIK_idKORISNIK` INT NOT NULL,
  `ARANZMAN_idAranzman` INT NOT NULL,
  `sadržaj` VARCHAR(45) NOT NULL,
  `vremeKreiranja` DATE NOT NULL,
  PRIMARY KEY (`TURISTA_KORISNIK_idKORISNIK`, `ARANZMAN_idAranzman`),
  CONSTRAINT `fk_KOMENTARISE_ARANZMAN_TURISTA1`
    FOREIGN KEY (`TURISTA_KORISNIK_idKORISNIK`)
    REFERENCES `mydb`.`TURISTA` (`KORISNIK_idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_KOMENTARISE_ARANZMAN_ARANZMAN1`
    FOREIGN KEY (`ARANZMAN_idAranzman`)
    REFERENCES `mydb`.`ARANZMAN` (`idAranzman`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_KOMENTARISE_ARANZMAN_ARANZMAN1_idx` ON `mydb`.`KOMENTARISE_ARANZMAN` (`ARANZMAN_idAranzman` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`SVIDJANE_ARANZMANA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`SVIDJANE_ARANZMANA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`SVIDJANE_ARANZMANA` (
  `ARANZMAN_idAranzman` INT NOT NULL,
  `TURISTA_KORISNIK_idKORISNIK` INT NOT NULL,
  PRIMARY KEY (`ARANZMAN_idAranzman`, `TURISTA_KORISNIK_idKORISNIK`),
  CONSTRAINT `fk_SVIDJANE_ARANZMANA_ARANZMAN1`
    FOREIGN KEY (`ARANZMAN_idAranzman`)
    REFERENCES `mydb`.`ARANZMAN` (`idAranzman`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SVIDJANE_ARANZMANA_TURISTA1`
    FOREIGN KEY (`TURISTA_KORISNIK_idKORISNIK`)
    REFERENCES `mydb`.`TURISTA` (`KORISNIK_idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SVIDJANE_ARANZMANA_ARANZMAN1_idx` ON `mydb`.`SVIDJANE_ARANZMANA` (`ARANZMAN_idAranzman` ASC) VISIBLE;

CREATE INDEX `fk_SVIDJANE_ARANZMANA_TURISTA1_idx` ON `mydb`.`SVIDJANE_ARANZMANA` (`TURISTA_KORISNIK_idKORISNIK` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`SVIDJANJE_SMESTAJA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`SVIDJANJE_SMESTAJA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`SVIDJANJE_SMESTAJA` (
  `TURISTA_KORISNIK_idKORISNIK` INT NOT NULL,
  `SMESTAJ_idSMESTAJ` INT NOT NULL,
  PRIMARY KEY (`TURISTA_KORISNIK_idKORISNIK`, `SMESTAJ_idSMESTAJ`),
  CONSTRAINT `fk_SVIDJANJE_SMESTAJA_TURISTA1`
    FOREIGN KEY (`TURISTA_KORISNIK_idKORISNIK`)
    REFERENCES `mydb`.`TURISTA` (`KORISNIK_idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SVIDJANJE_SMESTAJA_SMESTAJ1`
    FOREIGN KEY (`SMESTAJ_idSMESTAJ`)
    REFERENCES `mydb`.`SMESTAJ` (`idSMESTAJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SVIDJANJE_SMESTAJA_SMESTAJ1_idx` ON `mydb`.`SVIDJANJE_SMESTAJA` (`SMESTAJ_idSMESTAJ` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`KOMENTARISANJE_SMESTAJA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`KOMENTARISANJE_SMESTAJA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`KOMENTARISANJE_SMESTAJA` (
  `TURISTA_KORISNIK_idKORISNIK` INT NOT NULL,
  `SMESTAJ_idSMESTAJ` INT NOT NULL,
  `sadržaj` VARCHAR(45) NOT NULL,
  `vremeKreiranja` DATE NOT NULL,
  PRIMARY KEY (`TURISTA_KORISNIK_idKORISNIK`, `SMESTAJ_idSMESTAJ`),
  CONSTRAINT `fk_KOMENTARISANJE_SMESTAJA_TURISTA1`
    FOREIGN KEY (`TURISTA_KORISNIK_idKORISNIK`)
    REFERENCES `mydb`.`TURISTA` (`KORISNIK_idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_KOMENTARISANJE_SMESTAJA_SMESTAJ1`
    FOREIGN KEY (`SMESTAJ_idSMESTAJ`)
    REFERENCES `mydb`.`SMESTAJ` (`idSMESTAJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_KOMENTARISANJE_SMESTAJA_SMESTAJ1_idx` ON `mydb`.`KOMENTARISANJE_SMESTAJA` (`SMESTAJ_idSMESTAJ` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`REZERVISE_ARANZMAN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`REZERVISE_ARANZMAN` ;

CREATE TABLE IF NOT EXISTS `mydb`.`REZERVISE_ARANZMAN` (
  `TURISTA_KORISNIK_idKORISNIK` INT NOT NULL,
  `ARANZMAN_idAranzman` INT NOT NULL,
  PRIMARY KEY (`TURISTA_KORISNIK_idKORISNIK`, `ARANZMAN_idAranzman`),
  CONSTRAINT `fk_REZERVISE_ARANZMAN_TURISTA1`
    FOREIGN KEY (`TURISTA_KORISNIK_idKORISNIK`)
    REFERENCES `mydb`.`TURISTA` (`KORISNIK_idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_REZERVISE_ARANZMAN_ARANZMAN1`
    FOREIGN KEY (`ARANZMAN_idAranzman`)
    REFERENCES `mydb`.`ARANZMAN` (`idAranzman`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_REZERVISE_ARANZMAN_ARANZMAN1_idx` ON `mydb`.`REZERVISE_ARANZMAN` (`ARANZMAN_idAranzman` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`table1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`table1` ;

CREATE TABLE IF NOT EXISTS `mydb`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`REZERVISE_SMESTAJ`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`REZERVISE_SMESTAJ` ;

CREATE TABLE IF NOT EXISTS `mydb`.`REZERVISE_SMESTAJ` (
  `TURISTA_KORISNIK_idKORISNIK` INT NOT NULL,
  `SMESTAJ_idSMESTAJ` INT NOT NULL,
  PRIMARY KEY (`TURISTA_KORISNIK_idKORISNIK`, `SMESTAJ_idSMESTAJ`),
  CONSTRAINT `fk_REZERVISE_SMESTAJ_TURISTA1`
    FOREIGN KEY (`TURISTA_KORISNIK_idKORISNIK`)
    REFERENCES `mydb`.`TURISTA` (`KORISNIK_idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_REZERVISE_SMESTAJ_SMESTAJ1`
    FOREIGN KEY (`SMESTAJ_idSMESTAJ`)
    REFERENCES `mydb`.`SMESTAJ` (`idSMESTAJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_REZERVISE_SMESTAJ_SMESTAJ1_idx` ON `mydb`.`REZERVISE_SMESTAJ` (`SMESTAJ_idSMESTAJ` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`KOMUNICIRA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`KOMUNICIRA` ;

CREATE TABLE IF NOT EXISTS `mydb`.`KOMUNICIRA` (
  `TURISTA_KORISNIK_idKORISNIK` INT NOT NULL,
  `TURISTA_KORISNIK_idKORISNIK1` INT NOT NULL,
  `poruke` VARCHAR(45) NULL,
  PRIMARY KEY (`TURISTA_KORISNIK_idKORISNIK`, `TURISTA_KORISNIK_idKORISNIK1`),
  CONSTRAINT `fk_KOMUNICIRA_TURISTA1`
    FOREIGN KEY (`TURISTA_KORISNIK_idKORISNIK`)
    REFERENCES `mydb`.`TURISTA` (`KORISNIK_idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_KOMUNICIRA_TURISTA2`
    FOREIGN KEY (`TURISTA_KORISNIK_idKORISNIK1`)
    REFERENCES `mydb`.`TURISTA` (`KORISNIK_idKORISNIK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_KOMUNICIRA_TURISTA2_idx` ON `mydb`.`KOMUNICIRA` (`TURISTA_KORISNIK_idKORISNIK1` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
