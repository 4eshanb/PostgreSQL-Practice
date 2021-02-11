CREATE TABLE car(
    car_uid UUID NOT NULL PRIMARY KEY,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    price NUMERIC(19, 2) NOT NULL
);

CREATE TABLE person (
    person_uid UUID NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    date_of_birth DATE NOT NULL,
    country_of_birth VARCHAR(50) NOT NULL,
    car_uid UUID REFERENCES car(car_uid),
    UNIQUE(car_uid),
    UNIQUE(email)
);

insert into person (person_uid, first_name, last_name, email, gender, date_of_birth, country_of_birth) values (uuid_generate_v4(), 'Clyde', 'Mattevi', null, 'Genderfluid', '2020-05-14', 'Indonesia');
insert into person (person_uid, first_name, last_name, email, gender, date_of_birth, country_of_birth) values (uuid_generate_v4(), 'Annette', 'Bickerdike', 'abickerdike1@cbc.ca', 'Bigender', '2020-04-03', 'China');
insert into person (person_uid, first_name, last_name, email, gender, date_of_birth, country_of_birth) values (uuid_generate_v4(), 'Dwain', 'Twidle', 'dtwidle2@oakley.com', 'Non-binary', '2020-08-03', 'Indonesia');

insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Ford', 'Mustang', '30475.20');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Ford', 'Mustang', '19812.68');
