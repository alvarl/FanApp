# Users table

# --- !Ups


CREATE  TABLE IF NOT EXISTS `fan_user_identity` (
  `user_id` INT NOT NULL ,
  `type` VARCHAR(32) NOT NULL ,
  `provider_id` VARCHAR(128) NOT NULL ,
  INDEX `fk_user_identity_fan_user` (`user_id` ASC) ,
  PRIMARY KEY (`user_id`, `type`) ,
  CONSTRAINT `fk_user_identity_fan_user`
    FOREIGN KEY (`user_id` )
    REFERENCES `fan_user` (`id` )
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;

alter table fan_user add (`name` varchar(255));

# --- !Downs

DROP TABLE IF EXISTS `fan_user_identity` ;

alter table fan_user drop column `name`;
