CREATE TABLE car(
    id BIGINT NOT NULL PRIMARY KEY,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    price NUMERIC(19, 2) NOT NULL
);

CREATE TABLE person (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    date_of_birth DATE NOT NULL,
    country_of_birth VARCHAR(50) NOT NULL,
    car_id BIGINT REFERENCES car(id),
    UNIQUE(car_id)
);

insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Clyde', 'Mattevi', null, 'Genderfluid', '2020-05-14', 'Indonesia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Annette', 'Bickerdike', 'abickerdike1@cbc.ca', 'Bigender', '2020-04-03', 'China');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Dwain', 'Twidle', 'dtwidle2@oakley.com', 'Non-binary', '2020-08-03', 'Indonesia');

insert into car (id, make, model, price) values (1, 'Ford', 'Mustang', '30475.20');
insert into car (id, make, model, price) values (2, 'Ford', 'Mustang', '19812.68');
