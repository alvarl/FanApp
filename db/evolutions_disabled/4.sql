# Users table

# --- !Ups

CREATE TABLE IF NOT EXISTS fan_event_tickets (
  id int not null auto_increment,
  web_show_id INT(11) NOT NULL COMMENT 'Link to MYISAM web_event' ,
  tickets int not null
  PRIMARY KEY (id))
ENGINE = InnoDB
COMMENT = 'Available ticket counts for shows';

CREATE TABLE IF NOT EXISTS fan_ticket_purchase (
  id int not null auto_increment,
  `user_id` INT NOT NULL ,
  web_show_id INT(11) NOT NULL COMMENT 'Link to MYISAM web_event' ,
  `count` int not null,
  bought_at timestamp,
  PRIMARY KEY (id),
  CONSTRAINT `fk_fan_ticket_purchase_fan_user`
  FOREIGN KEY (`user_id` )
  REFERENCES `fan_user` (`id` )
  ON DELETE cascade
  ON UPDATE cascade)
ENGINE = InnoDB
COMMENT = 'Ticket purchases by fans';

CREATE TABLE IF NOT EXISTS fan_point_transaction (
  id int not null auto_increment,
  user_id INT NOT NULL ,
  points int not null,
  description varchar(255),
  made_at timestamp,
  PRIMARY KEY (id),
  CONSTRAINT `fk_fan_point_transaction_fan_user`
  FOREIGN KEY (`user_id`)
  REFERENCES `fan_user` (`id` )
  ON DELETE cascade
  ON UPDATE cascade)
ENGINE = InnoDB
COMMENT = 'Fan point transactions';

update fan_user set points = 0;
alter table fan_user modify points int not null default 0;

# --- !Downs

DROP TABLE IF EXISTS fan_event_tickets;
DROP TABLE IF EXISTS fan_ticket_purchase;
alter table fan_user drop column points;
