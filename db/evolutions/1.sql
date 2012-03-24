# Users table

# --- !Ups

CREATE  TABLE IF NOT EXISTS `d17556sd47469`.`fan_user` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(32) NOT NULL ,
  `facebook_id` INT NULL DEFAULT NULL ,
  `phone` VARCHAR(32) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

# --- !Downs

DROP TABLE IF EXISTS `d17556sd47469`.`fan_user` ;
