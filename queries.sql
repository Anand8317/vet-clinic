/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name like '%mon';
SELECT name from animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-12-31';
SELECT name from animals WHERE neutered = 'true' AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts from animals WHERE weight > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight >= 10.4 AND weight <= 17.3;


BEGIN TRANSACTION;
UPDATE animals SET species='unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN TRANSACTION;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' where species IS NULL;
SELECT * FROM animals;
COMMIT;

BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

 BEGIN TRANSACTION;
 DELETE FROM animals WHERE date_of_birth > '2022-01-01';
 SAVEPOINT tran1;
 UPDATE animals SET weight_kg = weight_kg * -1;
 ROLLBACK TO del_1;
 UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
 COMMIT;

 SELECT COUNT(*) FROM animals;
 SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
 SELECT AVG(weight_kg) FROM animals;
 SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;
 SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
 SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

 SELECT *FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name='Melody Pond';
 SELECT *FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name='Pokemon';
 SELECT owners.full_name,animals.name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;
 SELECT species.name,COUNT(animals.id) FROM animals  JOIN species ON animals.species_id = species.id GROUP BY species.name;
 SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';
 SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
 SELECT owners.full_name FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY COUNT(animals.id) DESC LIMIT 1;
