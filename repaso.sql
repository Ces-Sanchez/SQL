drop SCHEMA if EXISTS natas17;
create SCHEMA natas17;
use natas17;

CREATE TABLE users (
  myusername varchar(64) DEFAULT NULL,
  mypassword varchar(64) DEFAULT NULL
);

show tables;