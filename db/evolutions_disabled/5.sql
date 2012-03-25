# Users table

# --- !Ups

CREATE TABLE IF NOT EXISTS fan_actor_patting (
  id int not null auto_increment,
  user_id INT NOT NULL ,
  points int not null,
  description varchar(255),
  bought_at timestamp,
  PRIMARY KEY (id),
  CONSTRAINT `fk_fan_actor_patting_fan_user`
  FOREIGN KEY (`user_id` )
  REFERENCES `fan_user` (`id` )
  ON DELETE cascade
  ON UPDATE cascade)
ENGINE = InnoDB
COMMENT = 'Friendly gestures to actors and actresses by fans';

# --- !Downs

DROP TABLE IF EXISTS fan_actor_patting;
