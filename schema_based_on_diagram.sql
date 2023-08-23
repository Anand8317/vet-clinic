CREATE TABLE patients (
    id serial PRIMARY KEY NOT NULL,
    name varchar(50) NOT NULL,
    date_of_birth date NOT NULL
);

CREATE TABLE medical_histories(
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    admitted_at TIMESTAMP NOT NULL,
    patient_id INT NOT NULL,
    status VARCHAR(120) NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight DECIMAL NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(id) NOT NULL
);

CREATE INDEX idx_meidcal_histories_patient_id ON medical_histories(patient_id);


CREATE TABLE invoices (
    id serial PRIMARY KEY NOT NULL,
    total_amount integer NOT NULL,
    generated_at timestamp NOT NULL,
    paid_at timestamp NOT NULL,
    medical_history_id integer REFERENCES medical_histories(id) NOT NULL
);

CREATE INDEX idx_invoices_medical_history_id ON invoices(medical_history_id);


CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    type varchar(50) NOT NULL,
    name varchar(50) NOT NULL
);

CREATE TABLE medical_histories_treatments (
    medical_id integer REFERENCES medical_histories(id) NOT NULL,
    treatment_id integer REFERENCES treatments(id) NOT NULL,
    PRIMARY KEY (medical_id, treatment_id) NOT NULL
);

CREATE INDEX idx_medical_histories_treatments_medical_id ON medical_histories_treatments(medical_id);
CREATE INDEX idx_medical_histories_treatments_treatment_id ON medical_histories_treatments(treatment_id);


CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY NOT NULL,
    unit_price DECIMAL NOT NULL,
    quantity int NOT NULL,
    total_price DECIMAL NOT NULL,
    invoice_id int NOT NULL,
    treatment_id int NOT NULL,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id) NOT NULL,
    FOREIGN KEY (treatment_id) REFERENCES treatments(id) NOT NULL
);

CREATE INDEX idx_invoice_items_invoice_id on invoice_items(invoice_id);
CREATE INDEX idx_invoice_items_treatment_id on invoice_items(treatment_id);
