CREATE TABLE animals (
   id INT GENERATED BY DEFAULT AS IDENTITY, name VARCHAR NOT NULL, date_of_birth DATE, escape_attemps INT, neutered BOOLEAN NOT NULL, weight_kg NUMERIC(5,2) );
);
