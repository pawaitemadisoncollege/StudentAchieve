-- MySQL Script generated by MySQL Workbench
-- Thu Feb  1 17:11:34 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema student_manager
-- -----------------------------------------------------
# DROP SCHEMA IF EXISTS `student_manager` ;

-- -----------------------------------------------------
-- Schema student_manager
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `student_manager` DEFAULT CHARACTER SET utf8 ;
USE `student_manager` ;

-- -----------------------------------------------------
-- Table `student_manager`.`contact_infomation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student_manager`.`contact_infomation` ;

CREATE TABLE IF NOT EXISTS `student_manager`.`contact_infomation` (
  `address` INT NOT NULL,
  `primary_phone` INT NOT NULL,
  `secondary_phone` INT NULL,
  `primary_email` VARCHAR(45) NOT NULL,
  `user_name_fk` VARCHAR(15) NOT NULL,
  `secondary_email` VARCHAR(45) NULL,
  PRIMARY KEY (`address`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_manager`.`user_images`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student_manager`.`user_images` ;

CREATE TABLE IF NOT EXISTS `student_manager`.`user_images` (
  `user_images_pk` INT NOT NULL,
  `user_id_fk` VARCHAR(45) NOT NULL,
  `link_to_image` VARCHAR(45) NULL,
  PRIMARY KEY (`user_images_pk`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_manager`.`user_roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student_manager`.`user_roles` ;

CREATE TABLE IF NOT EXISTS `student_manager`.`user_roles` (
  `user_name` VARCHAR(15) NULL,
  `role_name` ENUM('STUDENT', 'TEACHER', 'ADMIN', 'PARENT', 'INACTIVE') NULL,
  `user_name_role_name_pk` INT NOT NULL,
  PRIMARY KEY (`user_name_role_name_pk`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_manager`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student_manager`.`user` ;

CREATE TABLE IF NOT EXISTS `student_manager`.`user` (
  `first_name` INT NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `user_name` VARCHAR(45) NOT NULL,
  `birth_date` DATETIME NULL,
  `gender` VARCHAR(45) NULL,
  `email_address` VARCHAR(45) NULL,
  `registration_date` DATETIME NULL,
  `user_pk` VARCHAR(45) NOT NULL,
  `contact_infomation_address` INT NOT NULL,
  `user_images_user_images_pk` INT NOT NULL,
  `user_roles_user_name_role_name_pk` INT NOT NULL,
  PRIMARY KEY (`user_pk`),
  CONSTRAINT `fk_user_contact_infomation`
    FOREIGN KEY (`contact_infomation_address`)
    REFERENCES `student_manager`.`contact_infomation` (`address`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_user_images1`
    FOREIGN KEY (`user_images_user_images_pk`)
    REFERENCES `student_manager`.`user_images` (`user_images_pk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_user_roles1`
    FOREIGN KEY (`user_roles_user_name_role_name_pk`)
    REFERENCES `student_manager`.`user_roles` (`user_name_role_name_pk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_user_contact_infomation_idx` ON `student_manager`.`user` (`contact_infomation_address` ASC);

CREATE INDEX `fk_user_user_images1_idx` ON `student_manager`.`user` (`user_images_user_images_pk` ASC);

CREATE INDEX `fk_user_user_roles1_idx` ON `student_manager`.`user` (`user_roles_user_name_role_name_pk` ASC);


-- -----------------------------------------------------
-- Table `student_manager`.`assessments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student_manager`.`assessments` ;

CREATE TABLE IF NOT EXISTS `student_manager`.`assessments` (
  `assessments__pk` INT NOT NULL,
  `assessment_name` VARCHAR(45) NULL,
  `assessment_content` BLOB NULL,
  PRIMARY KEY (`assessments__pk`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_manager`.`scores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student_manager`.`scores` ;

CREATE TABLE IF NOT EXISTS `student_manager`.`scores` (
  `Date` DATETIME NULL,
  `user_name` VARCHAR(15) NULL,
  `assessment_id` INT NULL,
  `score` VARCHAR(45) NULL,
  `assessment_raw_results` BLOB NULL,
  `scores_pk` INT NOT NULL,
  `user_user_pk` VARCHAR(45) NOT NULL,
  `assessments_assessments__pk` INT NOT NULL,
  PRIMARY KEY (`scores_pk`),
  CONSTRAINT `fk_scores_user1`
    FOREIGN KEY (`user_user_pk`)
    REFERENCES `student_manager`.`user` (`user_pk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_scores_assessments1`
    FOREIGN KEY (`assessments_assessments__pk`)
    REFERENCES `student_manager`.`assessments` (`assessments__pk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `scores_pk_UNIQUE` ON `student_manager`.`scores` (`scores_pk` ASC);

CREATE INDEX `fk_scores_user1_idx` ON `student_manager`.`scores` (`user_user_pk` ASC);

CREATE INDEX `fk_scores_assessments1_idx` ON `student_manager`.`scores` (`assessments_assessments__pk` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
