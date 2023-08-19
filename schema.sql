/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
	id int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
	name varchar(255) NOT NULL,
	date_of_birth DATE NOT NULL,
	escape_attempts INT,
	neutered BOOLEAN,
	weight DECIMAL	
);

ALTER TABLE animals ADD species VARCHAR;

CREATE TABLE owners(id SERIAL  PRIMARY KEY,full_name VARCHAR,age INT);
CREATE TABLE species(id SERIAL  PRIMARY KEY,name VARCHAR);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id);

CREATE TABLE vets(id SERIAL PRIMARY KEY,name VARCHAR,age INT,date_of_graduation DATE);
CREATE TABLE specializations(species_id INT,vets_id INT,FOREIGN KEY (species_id) REFERENCES species(id),FOREIGN KEY (vets_id) REFERENCES vets(id));
CREATE TABLE visits(animals_id INT,vets_id INT,FOREIGN KEY (animals_id) REFERENCES animals(id),FOREIGN KEY(vets_id) REFERENCES vets(id));
