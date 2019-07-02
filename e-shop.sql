-- MySQL Script generated by MySQL Workbench
-- 07/02/19 13:48:28
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema e_shop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema e_shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `e_shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `e_shop` ;

-- -----------------------------------------------------
-- Table `e_shop`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e_shop`.`User` ;

CREATE TABLE IF NOT EXISTS `e_shop`.`User` (
  `idUser` INT NOT NULL,
  `Benutzername` VARCHAR(45) NULL,
  `Passwort` VARCHAR(45) NULL,
  `Vorname` VARCHAR(45) NULL,
  `Nachname` VARCHAR(45) NULL,
  `Adresse` VARCHAR(45) NULL,
  `Telephon` INT NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_shop`.`Artikel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e_shop`.`Artikel` ;

CREATE TABLE IF NOT EXISTS `e_shop`.`Artikel` (
  `idArtikel` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Preis` INT NULL,
  `Bild` VARCHAR(45) NULL,
  `Geschlecht` VARCHAR(45) NULL,
  `Alter` INT NULL,
  `Rasse` VARCHAR(45) NULL,
  `Herkunft` VARCHAR(999) NULL,
  PRIMARY KEY (`idArtikel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_shop`.`Warenkorb`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e_shop`.`Warenkorb` ;

CREATE TABLE IF NOT EXISTS `e_shop`.`Warenkorb` (
  `idWarenkorb` INT NOT NULL,
  `Gesammtbetrag` INT NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`idWarenkorb`, `User_idUser`),
  INDEX `fk_Warenkorb_User1_idx` (`User_idUser` ASC),
  CONSTRAINT `fk_Warenkorb_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `e_shop`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_shop`.`Bestellung`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e_shop`.`Bestellung` ;

CREATE TABLE IF NOT EXISTS `e_shop`.`Bestellung` (
  `idBestellung` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Preis` INT NULL,
  `Bild` VARCHAR(45) NULL,
  `Artikel_idArtikel` INT NOT NULL,
  `Warenkorb_idWarenkorb` INT NOT NULL,
  PRIMARY KEY (`idBestellung`, `Artikel_idArtikel`, `Warenkorb_idWarenkorb`),
  INDEX `fk_Bestellung_Artikel1_idx` (`Artikel_idArtikel` ASC),
  INDEX `fk_Bestellung_Warenkorb1_idx` (`Warenkorb_idWarenkorb` ASC),
  CONSTRAINT `fk_Bestellung_Artikel1`
    FOREIGN KEY (`Artikel_idArtikel`)
    REFERENCES `e_shop`.`Artikel` (`idArtikel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bestellung_Warenkorb1`
    FOREIGN KEY (`Warenkorb_idWarenkorb`)
    REFERENCES `e_shop`.`Warenkorb` (`idWarenkorb`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into `User`(idUser, Benutzername, Passwort, Vorname, Nachname, Adresse, Telephon, Email) values (0, 'Chuebuur33', '123456', 'Hanf', 'Hans', 'Ballmoos 2', 0311871213, 'bauernhof@bluewin.ch');   
insert into Artikel(idArtikel, `Name`, Preis, Bild, Geschlecht, `Alter`, Rasse, Herkunft) values (0, 'Fiddo', 500, '/res/img/fiddo.jpg', 'Weiblich', 5, 'Deutscher Drahthaar', 'Lebte bei alter Frau. Lebt jetzt im Hundeheim Solothurn. Scheu aber sehr liebenswürdig.');


