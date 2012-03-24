SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


-- -----------------------------------------------------
-- Table `fan_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fan_user` ;

CREATE  TABLE IF NOT EXISTS `fan_user` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(32) NOT NULL ,
  `phone` VARCHAR(32) NULL DEFAULT NULL ,
  `name` VARCHAR(255) NULL DEFAULT 'Teatrihuviline' ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fan_user_identity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fan_user_identity` ;

CREATE  TABLE IF NOT EXISTS `fan_user_identity` (
  `type` VARCHAR(32) NOT NULL ,
  `provider_id` VARCHAR(128) NOT NULL ,
  `user_id` INT NOT NULL ,
  PRIMARY KEY (`type`) ,
  INDEX `fk_fan_user_identity_fan_user` (`user_id` ASC) ,
  CONSTRAINT `fk_fan_user_identity_fan_user`
    FOREIGN KEY (`user_id` )
    REFERENCES `fan_user` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fan_event_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fan_event_rating` ;

CREATE  TABLE IF NOT EXISTS `fan_event_rating` (
  `fan_user_id` INT NOT NULL ,
  `event_id` INT(11) NOT NULL COMMENT 'Link to MYISAM web_event' ,
  `rating` VARCHAR(32) NOT NULL ,
  INDEX `fk_fan_event_rating_fan_user1` (`fan_user_id` ASC) ,
  PRIMARY KEY (`event_id`, `fan_user_id`) ,
  CONSTRAINT `fk_fan_event_rating_fan_user1`
    FOREIGN KEY (`fan_user_id` )
    REFERENCES `fan_user` (`id` )
    ON DELETE SET NULL
    ON UPDATE SET NULL)
ENGINE = InnoDB
COMMENT = 'Stores like/dislike';



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
