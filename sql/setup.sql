CREATE TABLE users(
  id char(20) primary key
, name varchar(50)
, email varchar(100)
, password_digest varchar(60)
);
INSERT INTO users values ("ichiro_suzuki", "鈴木 一朗", "ichiro-suzuki@site.com", "$2a$10$kuRXc36NrgRvfTfJhNu96OjdGogYX8JZPbvbr9Rp9sjGAWsU.h0MC");
INSERT INTO users values ("shiro_suzuki", "鈴木 四郎", "shiro-suzuki@site.com", "$2a$10$kuRXc36NrgRvfTfJhNu96OjdGogYX8JZPbvbr9Rp9sjGAWsU.h0MC");
