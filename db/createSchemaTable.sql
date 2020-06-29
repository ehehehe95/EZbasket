-- MySQL Script generated by MySQL Workbench
-- Tue Jun 23 10:42:04 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema ezbasket
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ezbasket
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ezbasket` DEFAULT CHARACTER SET utf8 ;
USE `ezbasket` ;
-- -----------------------------------------------------
-- Table `ezbasket`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ezbasket`.`customer` ;
CREATE TABLE IF NOT EXISTS `ezbasket`.`customer` (
  `id` VARCHAR(15) NOT NULL,
  `password` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL COMMENT 'customer table',
  `img` VARCHAR(100),
  `name` VARCHAR(15) NOT NULL,
  `address` VARCHAR(100) NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `ezbasket`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ezbasket`.`product` ;
CREATE TABLE IF NOT EXISTS `ezbasket`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200),
  `price` INT NULL,
  `shop` VARCHAR(100) NULL,
  `url` VARCHAR(300) NULL,
  `category` VARCHAR(100) NULL,
  `img` VARCHAR(300) NULL,
  `option` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `ezbasket`.`cart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ezbasket`.`cart` ;
CREATE TABLE IF NOT EXISTS `ezbasket`.`cart` (
  `customer_id` VARCHAR(15) NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NULL,
  `date` DATE NULL,
  PRIMARY KEY (`customer_id`, `product_id`),
  INDEX `fk_customer_has_product_product1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_customer_has_product_customer_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_has_product_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `ezbasket`.`customer` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `ezbasket`.`product` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;