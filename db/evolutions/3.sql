# Users table

# --- !Ups

CREATE TABLE IF NOT EXISTS `fan_event_rating` (
  id int not null auto_increment,
  `user_id` INT NOT NULL ,
  `web_event_id` INT(11) NOT NULL COMMENT 'Link to MYISAM web_event' ,
  `rating` VARCHAR(32) NOT NULL ,
  INDEX `fk_fan_event_rating_fan_user1` (`user_id` ASC) ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_fan_event_rating_fan_user1`
    FOREIGN KEY (`user_id` )
    REFERENCES `fan_user` (`id` )
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB
COMMENT = 'Stores like/dislike';

# --- !Downs

DROP TABLE IF EXISTS `fan_event_rating` ;
