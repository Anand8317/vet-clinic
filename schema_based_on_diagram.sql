CREATE TABLE patients (
    id serial PRIMARY KEY,
    name varchar(50),
    date_of_birth date
);

CREATE TABLE medical_histories(
	id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(120),
    neutered BOOLEAN,
    weight DECIMAL,
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE invoices (
    id serial PRIMARY KEY,
    total_amount integer,
	generated_at timestamp,
	paid_at timestamp,
    medical_history_id integer REFERENCES medical_histories(id)
);

CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    type varchar(50),
    name varchar(50)
);