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
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') where name = 'Devimon' or name='Plantmon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') where name = 'Charmander' or name ='Squirtle' or name='Blossom';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') where name = 'Angemon' or name='Boarmon';


INSERT INTO vets(id, name, age, date_of_graduation) VALUES (1, 'William Tatcher', 45, '2000-04-23');
INSERT INTO vets(id, name, age, date_of_graduation) VALUES (2, 'Maisy Smith', 26, '2019-01-17');
INSERT INTO vets(id, name, age, date_of_graduation) VALUES (3, 'Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets(id, name, age, date_of_graduation) VALUES (4, 'Jack Harkness', 38, '2008-06-08');
/*inserting into the specialization table*/
INSERT INTO specializations (species_id, vets_id) VALUES (1,1),(2,3),(1,3),(2,4);


/* Agumon -1- visited William Tatcher -1- on May 24th, 2020. 
 Agumon -1- visited Stephanie Mendez -3- on Jul 22th, 2020. */
INSERT INTO visits (animal_id, vets_id, date_of_visits) VALUES (1,1,TO_DATE('24/05/2020', 'DD/MM/YYYY')), (1,3,TO_DATE('22/07/2020', 'DD/MM/YYYY'));

/* Gabumon id=2 visited Jack Harkness, vet_id=4 on Feb 2nd, 2021. */
INSERT INTO visits (animal_id, vets_id, date_of_visits) VALUES (2,4,'2021-02-02');

/* Pikachu id=3 visited Maisy Smith id=2 on Jan 5th, 2020. 
 Pikachu visited Maisy Smith on Mar 8th, 2020. 
 Pikachu visited Maisy Smith on May 14th, 2020.*/ 
INSERT INTO visits (animal_id, vets_id, date_of_visits) VALUES (3,2,'2020-01-05'), (3,2,'2020-03-08'), (3,2,'2020-05-14');

/* Devimon id=4 visited Stephanie Mendez id=3 on May 4th, 2021. */
INSERT INTO visits (animal_id, vets_id, date_of_visits) VALUES (4,3,'2021-05-04');

/*Charmander id=5 visited Jack Harkness id=4 on Feb 24th, 2021. */
INSERT INTO visits (animal_id, vets_id, date_of_visits) VALUES (5,4,'2021-02-24');

/* Plantmon id=10 visited Maisy Smith id=2 on Dec 21st, 2019. 
 Plantmon visited William Tatcher id=1 on Aug 10th, 2020. 
 Plantmon visited Maisy Smith on Apr 7th, 2021. */
INSERT INTO visits (animal_id, vets_id, date_of_visits) VALUES (10,2,'2019-12-21'), (10,1,'2020-08-10'), (10,2,'2021-04-07');

/* Squirtle id=7 visited Stephanie Mendez id=3 on Sep 29th, 2019. */
INSERT INTO visits (animal_id, vets_id, date_of_visits) VALUES (7,3,'2019-09-29');

/* Angemon id=8 visited Jack Harkness id=4 on Oct 3rd, 2020. 
 Angemon visited Jack Harkness id=4 on Nov 4th, 2020. */
INSERT INTO visits (animal_id, vets_id, date_of_visits) VALUES (8,4,'2020-10-03'), (8,4,'2020-11-04');


/* Boarmon id=9 visited Maisy Smith id=2 on Jan 24th, 2019.
 Boarmon visited Maisy Smith on May 15th, 2019.
 Boarmon visited Maisy Smith on Feb 27th, 2020.
 Boarmon visited Maisy Smith on Aug 3rd, 2020.*/
INSERT INTO visits (animal_id, vets_id, date_of_visits) VALUES (9,2,'2019-01-24'), (9,2,'2019-05-15'), (9,2,'2020-02-27'), (9,2,'2020-08-03');


/* Blossom id=10 visited Stephanie Mendez id=3 on May 24th, 2020.
 Blossom visited William Tatcher id=1 on Jan 11th, 2021.  */
INSERT INTO visits (animal_id, vets_id, date_of_visits) VALUES (10,3,'2020-05-24'), (10,1,'2021-01-11');