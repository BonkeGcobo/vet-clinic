SELECT * FROM animals where name LIKE '%mon';
SELECT * FROM animals where date_of_birth BETWEEN '2016-01-01' and '2019-12-31';
SELECT * FROM animals where neutered=TRUE AND escape_attemps <3;
SELECT date_of_birth from animals where name = 'Pikachu' or name = 'Agumon';
SELECT name, escape_attemps from animals where weight_kg < 10.5;
SELECT * FROM animals where neutered= TRUE;
SELECT * FROM animals where name != 'Gabumon';
SELECT * FROM animals where weight_kg BETWEEN 10.4 and 17.3;

BEGIN;
UPDATE animals SET species='unspecified';
ROLLBACK;
END;


BEGIN;
UPDATE animals SET species='digimon' where name LIKE '%mon';
UPDATE animals SET species='pokemon' where species is NULL;
END;

/*Delete data from the table and rollback*/
BEGIN;
TRUNCATE TABLE  animals;
ROLLBACK;
END;

BEGIN;
 DELETE FROM animals where date_of_birth BETWEEN '2022-01-01' and '2099-12-31';
 SAVEPOINT my_savepoint;
 UPDATE animals SET weight_kg = weight_kg * -1;
 ROLLBACK;
 UPDATE animals SET weight_kg = weight_kg * -1 where weight_kg < 0;
COMMIT;

/*How many animals are there?*/
SELECT COUNT(id) FROM animals;

/*How many animals have never tried to escape?*/
SELECT COUNT(escape_attemps) FROM animals where escape_attemps = 0;

/*What is the average weight of animals?*/
SELECT AVG(weight_kg) FROM animals; 

/*Who escapes the most, neutered or not neutered animals?*/
SELECT neutered, MAX(escape_attemps) FROM animals
  GROUP BY neutered;

 /*What is the minimum and maximum weight of each type of species?*/
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals
   GROUP BY species;

 /*What is the average number of escape attempts per animal type of those born between 1990 and 2000?*/
 SELECT AVG(escape_attemps) FROM animals where date_of_birth BETWEEN '1990-01-01' and '2000-12-31';


 /* Write queries (using JOIN) to answer the following questions: */
/* What animals belong to Melody Pond? */
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Melody Pond';

/* List of all animals that are pokemon (their type is Pokemon). */
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.id = 1;

/* List all owners and their animals, remember to include those that don't own any animal. */
SELECT animals.name,full_name FROM owners LEFT JOIN animals ON animals.owner_id=owners.id;

/* How many animals are there per species? */
SELECT COUNT(*), species.name FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

/* List all Digimon owned by Jennifer Orwell. */
SELECT animals.* FROM animals LEFT JOIN owners ON animals.owner_id = owners.id LEFT JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

/* List all animals owned by Dean Winchester that haven't tried to escape */
SELECT animals.* FROM animals LEFT JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attemps = 0;

/* Who owns the most animals? */
SELECT owners.full_name, COUNT(animals.name) AS total FROM owners LEFT JOIN animals ON animals.owner_id=owners.id GROUP BY owners.full_name ORDER BY total DESC LIMIT 1; 