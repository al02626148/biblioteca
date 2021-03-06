-- MySQL Script generated by MySQL Workbench
-- 02/24/16 20:59:18
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Persona` (
  `matricula` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `a_paterno` VARCHAR(45) NOT NULL,
  `a_materno` VARCHAR(45) NULL,
  `idTipo_Usuario` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `email_alt` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(12) NOT NULL,
  `telefono` INT NULL,
  `habilitado` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`matricula`, `idTipo_Usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Libro` (
  `idLibro` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(75) NOT NULL,
  `autor` VARCHAR(145) NOT NULL,
  `idGenero` INT NOT NULL,
  `editorial` VARCHAR(45) NOT NULL,
  `año` INT NOT NULL,
  `isbn` VARCHAR(75) NOT NULL,
  `edicion` VARCHAR(45) NULL,
  `idEstado` INT NOT NULL,
  `idCopia` INT NOT NULL,
  `habiitado` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idLibro`, `idGenero`, `idEstado`, `idCopia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Prestamo` (
  `idPrestamo` INT NOT NULL,
  `idMatricula` VARCHAR(10) NOT NULL,
  `idLibro` VARCHAR(45) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL,
  `detalle` VARCHAR(200) NOT NULL,
  `habilitado` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idPrestamo`, `idMatricula`, `idLibro`),
  INDEX `matricula_idx` (`idMatricula` ASC),
  INDEX `idLibro_idx` (`idLibro` ASC),
  CONSTRAINT `matricula`
    FOREIGN KEY (`idMatricula`)
    REFERENCES `mydb`.`Persona` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idLibro`
    FOREIGN KEY (`idLibro`)
    REFERENCES `mydb`.`Libro` (`idLibro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Genero` (
  `idGenero` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `habilitado` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idGenero`),
  CONSTRAINT `idGenero`
    FOREIGN KEY (`idGenero`)
    REFERENCES `mydb`.`Libro` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estado` (
  `idEstado` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `habilitado` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idEstado`),
  CONSTRAINT `idEstado`
    FOREIGN KEY (`idEstado`)
    REFERENCES `mydb`.`Libro` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Copia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Copia` (
  `idCopia` INT NOT NULL,
  `habilitado` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idCopia`),
  CONSTRAINT `idCopia`
    FOREIGN KEY (`idCopia`)
    REFERENCES `mydb`.`Libro` (`idCopia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo_usuario` (
  `idTipo_Usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `habilitado` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idTipo_Usuario`),
  CONSTRAINT `idTipo_Usuario`
    FOREIGN KEY (`idTipo_Usuario`)
    REFERENCES `mydb`.`Persona` (`idTipo_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
