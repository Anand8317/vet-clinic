/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight) VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight) VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight) VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight) VALUES (4, 'Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Charmander','2020-02-08',0,false,-11);
INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Plantmon','2021-11-15',2,true,-5.7);
INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Squirtle','1993-04-02',3,false,-12.13);
INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Angemon','2005-06-12',1,true,-45);
INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Boarmon','2005-06-07',7,true,20.4);
INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Blossom','1998-10-13',3,true,17);
INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Ditto','2022-05-14',4,true,22.0);

INSERT INTO owners(full_name,age) VALUES('Sam Smith',34);
INSERT INTO owners(full_name,age) VALUES('Jennifer Orwell',19);
INSERT INTO owners(full_name,age) VALUES('Bob',45);
INSERT INTO owners(full_name,age) VALUES('Melody Pond',77);
INSERT INTO owners(full_name,age) VALUES('Dean Winchester',14);
INSERT INTO owners(full_name,age) VALUES('Jodie Whittaker',38);

INSERT INTO species(name) VALUES('Pokemon');
INSERT INTO species(name) VALUES('Digimon');

UPDATE animals SET species_id=(SELECT id FROM species WHERE name='Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id=(SELECT id FROM species WHERE name='Pokemon') WHERE species_id IS NULL;
UPDATE animals SET owner_id=(SELECT id FROM owners WHERE full_name='Sam Smith') WHERE name='Agumon';
UPDATE animals SET owner_id=(SELECT id FROM owners WHERE full_name='Jennifer Orwell') WHERE name IN('Gabumon','Pikachu');
UPDATE animals SET owner_id=(SELECT id FROM owners WHERE full_name='Bob') WHERE name IN('Devimon','Plantmon');
UPDATE animals SET owner_id=(SELECT id FROM owners WHERE full_name='Melody Pond') WHERE name IN('Charmander','Squirtle','Blossom');
UPDATE animals SET owner_id=(SELECT id FROM owners WHERE full_name='Dean Winchester') WHERE name IN('Angemon','Boarmon');

INSERT INTO vets(name,age,date_of_graduation) VALUES('William Tatcher',45,'2020-04-23');
INSERT INTO vets(name,age,date_of_graduation) VALUES('Maisy Smith',26,'2019-01-17');
INSERT INTO vets(name,age,date_of_graduation) VALUES('Stephanie Mendez',64,'1981-05-04');
INSERT INTO vets(name,age,date_of_graduation) VALUES('Jack Harkness',38,'2008-06-08');
UPDATE vets SET date_of_graduation='2000-04-23' WHERE id=1;

INSERT INTO specializations(species_id,vets_id) VALUES(1,1);
INSERT INTO specializations(species_id,vets_id) VALUES(1,3);
INSERT INTO specializations(species_id,vets_id) VALUES(2,3);
INSERT INTO specializations(species_id,vets_id) VALUES(2,4);

INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(1,1,'2020-05-24');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(1,3,'2020-07-22');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(2,4,'2021-02-02');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(3,2,'2020-01-05');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(3,2,'2020-03-08');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(3,2,'2020-05-14');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(4,3,'2021-05-04');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(5,4,'2021-02-24');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(6,2,'2019-12-21');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(6,1,'2020-08-10');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(6,2,'2021-04-07');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(7,3,'2019-09-29');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(8,4,'2020-10-03');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(8,4,'2020-11-04');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(9,2,'2019-01-24');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(9,2,'2019-05-15');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(9,2,'2020-02-27');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(9,2,'2020-08-03');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(9,3,'2020-05-24');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(9,1,'2021-01-11');
