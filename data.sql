INSERT INTO animals(name, date_of_birth, escape_attemps,neutered, weight_kg) values ('Agumon', '2020-02-03',0 ,TRUE, 10.23);
INSERT INTO animals(name, date_of_birth,escape_attemps ,neutered, weight_kg) values ('Gabumon', '2018-11-15',2, TRUE, 8);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attemps) values('Pikachu', '2021-01-07',15.04, FALSE, 1);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attemps) values ('Devimon', '2021-05-12',11, TRUE, 5);
INSERT INTO animals(name, date_of_birth, escape_attemps,neutered, weight_kg) values  ('Charmander', '2020-02-08', 0, FALSE, -11);
INSERT INTO animals(name, date_of_birth, escape_attemps,neutered, weight_kg) values  ('Plantmon', '2021-11-15', 2, TRUE, 5.7);
INSERT INTO animals(name, date_of_birth, escape_attemps,neutered, weight_kg) values  ('Squirtle', '1993-04-02', 3, FALSE, -12.13);
INSERT INTO animals(name, date_of_birth, escape_attemps,neutered, weight_kg) values  ('Angemon', '2005-06-12', 1, FALSE, -45);
INSERT INTO animals(name, date_of_birth, escape_attemps,neutered, weight_kg) values  ('Boarmon', '2005-06-07', 7, TRUE, 20.4);
INSERT INTO animals(name, date_of_birth, escape_attemps,neutered, weight_kg) values  ('Blossom', '1998-10-13', 3, TRUE, 17);
INSERT INTO animals(name, date_of_birth, escape_attemps,neutered, weight_kg) values  ('Ditto', '2022-05-14', 4, TRUE, 22);

/*Inserting into owners table*/
INSERT INTO owners(id, full_name,age) VALUES (1, 'Sam Smith',34)
INSERT INTO owners(id, full_name,age) VALUES (2, 'Jennifer Orwell',19)
INSERT INTO owners(id, full_name,age) VALUES (3, 'Bob',45)
INSERT INTO owners(id, full_name,age) VALUES (4, 'Melody Pond',77)
INSERT INTO owners(id, full_name,age) VALUES (5, 'Dean Winchester',14)
INSERT INTO owners(id, full_name,age) VALUES (6, 'Jodie Whittaker',38)

/*Inserting into species*/
INSERT INTO species(id,name) VALUES (1, 'Pokemon')
INSERT INTO species(id,name) VALUES (2, 'Digimon')


UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') where name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') where name = 'Gabumon' or name='Pikachu';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') where name = 'Devimon' or name='Plantmon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') where name = 'Charmander' or name ='Squirtle' or name='Blossom';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') where name = 'Angemon' or name='Boarmon';