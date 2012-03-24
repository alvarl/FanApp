SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `d17556sd47469` ;
USE `d17556sd47469` ;

-- -----------------------------------------------------
-- Table `d17556sd47469`.`web_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `d17556sd47469`.`web_event` ;

CREATE  TABLE IF NOT EXISTS `d17556sd47469`.`web_event` (
  `page_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `parent_id` INT(11) NOT NULL DEFAULT '0' ,
  `tstamp_add` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `tstamp_mod` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `ord` INT(11) NOT NULL DEFAULT '0' ,
  `d_title_est` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_title_eng` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_title_rus` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_pagetitle` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_intro_est` LONGTEXT NULL DEFAULT NULL ,
  `d_intro_eng` LONGTEXT NULL DEFAULT NULL ,
  `d_intro_rus` LONGTEXT NULL DEFAULT NULL ,
  `d_content_est` LONGTEXT NULL DEFAULT NULL ,
  `d_content_eng` LONGTEXT NULL DEFAULT NULL ,
  `d_content_rus` LONGTEXT NULL DEFAULT NULL ,
  `photo` VARCHAR(200) NOT NULL DEFAULT '' ,
  `info_et` VARCHAR(255) NOT NULL DEFAULT '' ,
  `info_en` VARCHAR(255) NOT NULL DEFAULT '' ,
  `info_ru` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_type` TINYINT(1) NOT NULL DEFAULT '0' ,
  `photosby` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_status` TINYINT(1) NOT NULL DEFAULT '0' ,
  `d_redirect` VARCHAR(255) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`page_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 71
DEFAULT CHARACTER SET = latin1
PACK_KEYS = 0;


-- -----------------------------------------------------
-- Table `d17556sd47469`.`web_front`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `d17556sd47469`.`web_front` ;

CREATE  TABLE IF NOT EXISTS `d17556sd47469`.`web_front` (
  `page_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `parent_id` INT(11) NOT NULL DEFAULT '0' ,
  `ord` INT(11) NOT NULL DEFAULT '0' ,
  `tstamp_mod` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `tstamp_add` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `d_tag` VARCHAR(32) NOT NULL DEFAULT '' ,
  `d_step` TINYINT(1) NOT NULL DEFAULT '0' ,
  `d_pagetitle` TEXT NOT NULL ,
  `d_title_est` TEXT NOT NULL ,
  `d_title_eng` TEXT NOT NULL ,
  `d_content_est` TEXT NOT NULL ,
  `d_content_eng` TEXT NOT NULL ,
  `d_intro_est` TEXT NOT NULL ,
  `d_intro_eng` TEXT NOT NULL ,
  `d_pagetype` INT(11) NOT NULL DEFAULT '0' ,
  `d_status` TINYINT(1) NOT NULL DEFAULT '0' ,
  `d_image1` INT(11) NOT NULL DEFAULT '0' ,
  `d_alturl` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_redirect` VARCHAR(255) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`page_id`) ,
  INDEX `parent_id` (`parent_id` ASC) ,
  INDEX `d_tag` (`d_tag` ASC) )
ENGINE = MyISAM
AUTO_INCREMENT = 45
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `d17556sd47469`.`web_image_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `d17556sd47469`.`web_image_event` ;

CREATE  TABLE IF NOT EXISTS `d17556sd47469`.`web_image_event` (
  `image_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `tstamp_mod` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `tstamp_add` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `parent_id` INT(11) NOT NULL DEFAULT '0' ,
  `ord` INT(11) NOT NULL DEFAULT '0' ,
  `d_tag` VARCHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_estonian_ci' NOT NULL DEFAULT '' ,
  `d_url` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_estonian_ci' NOT NULL ,
  `d_image` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_estonian_ci' NOT NULL ,
  `d_image_ctype` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_estonian_ci' NOT NULL ,
  `d_image_fname` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_estonian_ci' NOT NULL ,
  `d_type` TINYINT(1) NOT NULL DEFAULT '0' ,
  `object_id` INT(11) NOT NULL DEFAULT '0' ,
  `d_people` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_estonian_ci' NOT NULL ,
  `d_first` TINYINT(1) NOT NULL DEFAULT '0' ,
  `d_frontpage` TINYINT(1) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`image_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 1016
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_estonian_ci;


-- -----------------------------------------------------
-- Table `d17556sd47469`.`web_image_people`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `d17556sd47469`.`web_image_people` ;

CREATE  TABLE IF NOT EXISTS `d17556sd47469`.`web_image_people` (
  `image_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `tstamp_mod` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `tstamp_add` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `parent_id` INT(11) NOT NULL DEFAULT '0' ,
  `ord` INT(11) NOT NULL DEFAULT '0' ,
  `d_tag` VARCHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_estonian_ci' NOT NULL DEFAULT '' ,
  `d_url` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_estonian_ci' NOT NULL ,
  `d_image` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_estonian_ci' NOT NULL ,
  `d_image_ctype` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_estonian_ci' NOT NULL ,
  `d_image_fname` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_estonian_ci' NOT NULL ,
  `d_type` TINYINT(1) NOT NULL DEFAULT '0' ,
  `object_id` INT(11) NOT NULL DEFAULT '0' ,
  `d_people` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_estonian_ci' NOT NULL ,
  PRIMARY KEY (`image_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 361
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_estonian_ci;


-- -----------------------------------------------------
-- Table `d17556sd47469`.`web_kava`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `d17556sd47469`.`web_kava` ;

CREATE  TABLE IF NOT EXISTS `d17556sd47469`.`web_kava` (
  `page_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `parent_id` INT(11) NOT NULL DEFAULT '0' ,
  `ord` INT(11) NOT NULL DEFAULT '0' ,
  `tstamp_add` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `tstamp_mod` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `event_id` INT(11) NOT NULL DEFAULT '0' ,
  `performer_id` INT(11) NOT NULL DEFAULT '0' ,
  `place_id` INT(11) NOT NULL DEFAULT '0' ,
  `premiere` TINYINT(4) NOT NULL DEFAULT '0' ,
  `time` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `price1` VARCHAR(255) NOT NULL DEFAULT '0.00' ,
  `price2` VARCHAR(255) NOT NULL DEFAULT '0.00' ,
  `d_pricelink` VARCHAR(255) NOT NULL ,
  `d_title_est` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_title_eng` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_title_rus` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_intro_est` LONGTEXT NOT NULL ,
  `d_intro_eng` LONGTEXT NOT NULL ,
  `d_intro_rus` LONGTEXT NOT NULL ,
  `soldout` TINYINT(4) NOT NULL DEFAULT '0' ,
  `bronned` TINYINT(4) NOT NULL DEFAULT '0' ,
  `d_status` TINYINT(1) NOT NULL DEFAULT '0' ,
  `lasttime` TINYINT(1) NOT NULL DEFAULT '0' ,
  `ending` TINYINT(1) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`page_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 1781
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `d17556sd47469`.`web_page`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `d17556sd47469`.`web_page` ;

CREATE  TABLE IF NOT EXISTS `d17556sd47469`.`web_page` (
  `page_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `parent_id` INT(11) NOT NULL DEFAULT '0' ,
  `ord` INT(11) NOT NULL DEFAULT '0' ,
  `tstamp_mod` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `tstamp_add` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `d_tag` VARCHAR(32) NOT NULL DEFAULT '' ,
  `d_step` TINYINT(1) NOT NULL DEFAULT '0' ,
  `d_pagetitle` TEXT NOT NULL ,
  `d_title_est` TEXT NOT NULL ,
  `d_title_eng` TEXT NOT NULL ,
  `d_content_est` TEXT NOT NULL ,
  `d_content_eng` TEXT NOT NULL ,
  `d_intro_est` TEXT NOT NULL ,
  `d_intro_eng` TEXT NOT NULL ,
  `d_pagetype` INT(11) NOT NULL DEFAULT '0' ,
  `d_status` TINYINT(1) NOT NULL DEFAULT '0' ,
  `d_image1` VARCHAR(255) NOT NULL DEFAULT '0' ,
  `d_alturl` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_redirect` VARCHAR(255) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`page_id`) ,
  INDEX `parent_id` (`parent_id` ASC) ,
  INDEX `d_tag` (`d_tag` ASC) )
ENGINE = MyISAM
AUTO_INCREMENT = 38
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `d17556sd47469`.`web_people`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `d17556sd47469`.`web_people` ;

CREATE  TABLE IF NOT EXISTS `d17556sd47469`.`web_people` (
  `page_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `tstamp_mod` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `tstamp_add` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `d_title_est` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `d_content_est` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `d_content_eng` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `d_occupation_est` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL DEFAULT '' ,
  `d_occupation_eng` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL DEFAULT '' ,
  `d_email` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL DEFAULT '' ,
  `d_tag` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL DEFAULT '' ,
  `parent_id` INT(11) NULL DEFAULT NULL ,
  `d_image1` INT(11) NOT NULL DEFAULT '0' ,
  `ord` INT(11) NOT NULL DEFAULT '0' ,
  `d_status` TINYINT(1) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`page_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `d17556sd47469`.`web_performer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `d17556sd47469`.`web_performer` ;

CREATE  TABLE IF NOT EXISTS `d17556sd47469`.`web_performer` (
  `page_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `parent_id` INT(11) NOT NULL DEFAULT '0' ,
  `ord` INT(11) NOT NULL DEFAULT '0' ,
  `tstamp_add` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `tstamp_mod` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `d_title_est` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_title_eng` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_title_rus` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_url` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_status` TINYINT(1) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`page_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 140
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `d17556sd47469`.`web_place`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `d17556sd47469`.`web_place` ;

CREATE  TABLE IF NOT EXISTS `d17556sd47469`.`web_place` (
  `page_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `parent_id` INT(11) NOT NULL DEFAULT '0' ,
  `ord` INT(11) NOT NULL DEFAULT '0' ,
  `tstamp_add` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `tstamp_mod` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `d_title_est` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_title_eng` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_title_rus` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_url` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_status` TINYINT(1) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`page_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 67
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `d17556sd47469`.`web_text`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `d17556sd47469`.`web_text` ;

CREATE  TABLE IF NOT EXISTS `d17556sd47469`.`web_text` (
  `page_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `parent_id` INT(11) NOT NULL DEFAULT '0' ,
  `ord` INT(11) NOT NULL DEFAULT '0' ,
  `tstamp_mod` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `tstamp_add` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `d_tag` VARCHAR(32) NOT NULL DEFAULT '' ,
  `d_lang` TINYINT(1) NOT NULL DEFAULT '0' ,
  `d_pagetitle` TEXT NOT NULL ,
  `d_title_est` TEXT NOT NULL ,
  `d_title_eng` TEXT NOT NULL ,
  `d_content_est` TEXT NOT NULL ,
  `d_content_eng` TEXT NOT NULL ,
  `d_intro_est` TEXT NOT NULL ,
  `d_intro_eng` TEXT NOT NULL ,
  `d_pagetype` INT(11) NOT NULL DEFAULT '0' ,
  `d_status` TINYINT(1) NOT NULL DEFAULT '0' ,
  `d_image1` INT(11) NOT NULL DEFAULT '0' ,
  `d_alturl` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_redirect` VARCHAR(255) NOT NULL DEFAULT '' ,
  `event_id` INT(11) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`page_id`) ,
  INDEX `parent_id` (`parent_id` ASC) ,
  INDEX `d_tag` (`d_tag` ASC) )
ENGINE = MyISAM
AUTO_INCREMENT = 192
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `d17556sd47469`.`web_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `d17556sd47469`.`web_user` ;

CREATE  TABLE IF NOT EXISTS `d17556sd47469`.`web_user` (
  `page_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `parent_id` INT(11) NOT NULL DEFAULT '0' ,
  `ord` INT(11) NOT NULL DEFAULT '0' ,
  `tstamp_mod` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `tstamp_add` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `d_username` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_password` VARCHAR(20) NOT NULL DEFAULT '' ,
  `d_tag` VARCHAR(32) NOT NULL DEFAULT '' ,
  `d_step` TINYINT(1) NOT NULL DEFAULT '0' ,
  `d_title_est` TEXT NOT NULL ,
  `d_content_est` TEXT NOT NULL ,
  `d_pagetype` INT(11) NOT NULL DEFAULT '0' ,
  `d_status` TINYINT(1) NOT NULL DEFAULT '0' ,
  `d_image1` INT(11) NOT NULL DEFAULT '0' ,
  `d_email` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_occupation` VARCHAR(255) NOT NULL DEFAULT '' ,
  `d_region` INT(11) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`page_id`) ,
  INDEX `parent_id` (`parent_id` ASC) ,
  INDEX `d_tag` (`d_tag` ASC) )
ENGINE = MyISAM
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `d17556sd47469`.`fan_users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `d17556sd47469`.`fan_users` ;

CREATE  TABLE IF NOT EXISTS `d17556sd47469`.`fan_users` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(32) NOT NULL ,
  `facebook_id` INT NULL DEFAULT NULL ,
  `phone` VARCHAR(32) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
