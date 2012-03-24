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
  `facebook_id` INT NULL DEFAULT NULL ,
  `phone` VARCHAR(32) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fan_user_identity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fan_user_identity` ;

CREATE  TABLE IF NOT EXISTS `fan_user_identity` (
  `user_id` INT NOT NULL ,
  `type` VARCHAR(32) NOT NULL ,
  INDEX `fk_user_identity_fan_user` (`user_id` ASC) ,
  PRIMARY KEY (`user_id`, `type`) ,
  CONSTRAINT `fk_user_identity_fan_user`
    FOREIGN KEY (`user_id` )
    REFERENCES `fan_user` (`id` )
    ON DELETE SET NULL
    ON UPDATE SET NULL)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
