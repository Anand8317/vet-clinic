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

CREATE TABLE medical_histories_treatments (
    medical_id integer REFERENCES medical_histories(id),
    treatment_id integer REFERENCES treatments(id),
    PRIMARY KEY (medical_id, treatment_id)
);

CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    unit_price DECIMAL,
	quantity int,
	total_price DECIMAL,
    invoice_id int,
    treatment_id int,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);