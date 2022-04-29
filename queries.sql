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

/*Who was the last animal seen by William Tatcher? */
SELECT vets.name, animals.name, date_of_visits FROM vets JOIN visits ON vets.id=visits.vets_id JOIN animals ON animals.id= visits.animal_id WHERE vets.name = 'William Tatcher' ORDER BY visits.date_of_visits DESC LIMIT 1;

/* How many different animals did Stephanie Mendez see? */
SELECT COUNT(*) as total_animals from vets JOIN visits ON vets.id = visits.vets_id WHERE name='Stephanie Mendez';

/*List all vets and their specialties, including vets with no specialties.*/
SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON specializations.vets_id = vets.id LEFT JOIN species ON specializations.species_id = species.id;

/* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */
SELECT animals.name, date_of_visits FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visits BETWEEN '2020-01-02' AND '2020-08-30';

/*What animal has the most visits to vets? */
SELECT animals.name, COUNT(*) as total FROM animals JOIN visits ON visits.animal_id = animals.id GROUP BY animals.name ORDER BY total DESC LIMIT 1;

/* Who was Maisy Smith's first visit? */
SELECT vets.name, animals.name, date_of_visit FROM vets JOIN visits on vets.id = visits.vets_id JOIN animals ON animals.id = visits.animals_id WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visits ASC LIMIT 1

/*Details for most recent visit: animal information, vet information, and date of visit. */
SELECT date_of_visits, animals.name, animals.date_of_birth, animals.escape_attemps, animals.neutered, animals.weight_kg, vets.name, vets.age, vets.date_of_graduation
FROM visits
JOIN animals ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vets_id
ORDER BY date_of_visits
DESC LIMIT 1;


/*How many visits were with a vet that did not specialize in that animal's species? */
SELECT COUNT(*)
FROM visits
JOIN animals ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vets_id
JOIN specializations ON specializations.vets_id = visits.vets_id
WHERE animals.species_id != specializations.species_id;

/*What specialty should Maisy Smith consider getting? Look for the species she gets the most.*/
SELECT species.name, COUNT(visits.animal_id)
FROM visits
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animal_id
JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name; 