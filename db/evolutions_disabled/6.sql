# Users table

# --- !Ups

ALTER TABLE fan_user_identity DROP PRIMARY KEY;
ALTER TABLE fan_user_identity ADD PRIMARY KEY (`provider_id`, `type`);

# --- !Downs

ALTER TABLE fan_user_identity DROP PRIMARY KEY;
ALTER TABLE fan_user_identity ADD PRIMARY KEY (`type`);
