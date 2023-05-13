/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
	id int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
	name varchar(255) NOT NULL,
	date_of_birth DATE NOT NULL,
	escape_attempts INT,
	neutered BOOLEAN,
	weight DECIMAL	
);
