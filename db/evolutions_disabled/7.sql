# Users table

# --- !Ups

alter table fan_user add offers_allowed tinyint(1) unsigned not null default=1;

# --- !Downs

alter table fan_user drop column offers_allowed;
