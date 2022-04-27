/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals where name LIKE '%mon';
SELECT * FROM animals where date_of_birth BETWEEN '2016-01-01' and '2019-12-31';
SELECT * FROM animals where neutered=TRUE AND escape_attemps <3;
SELECT date_of_birth from animals where name = 'Pikachu' or name = 'Agumon';
SELECT name, escape_attemps from animals where weight_kg < 10.5;
SELECT * FROM animals where neutered= TRUE;
SELECT * FROM animals where name != 'Gabumon';
SELECT * FROM animals where weight_kg BETWEEN 10.4 and 17.3;