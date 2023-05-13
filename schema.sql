/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
	id INT,
	name TEXT NOT NULL,
	date_of_birth DATE NOT NULL,
	escape_attempts INT,
	neutered BOOLEAN,
	weight DECIMAL	
);
