CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  date_of_birth DATE,
  PRIMARY KEY(id)
);

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR(100),
  PRIMARY KEY(id),
  FOREIGN KEY(patient_id) REFERENCES patients(id)
);

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL(5,2),
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  PRIMARY KEY(id),
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR (50),
  name VARCHAR (50),
  PRIMARY KEY(id)
);

CREATE TABLE medical_hitories_treatments(
  treatments_id INT,
  medical_hitories_id INT,
  PRIMARY KEY(treatments_id,medical_hitories_id),
  FOREIGN key (treatments_id) REFERENCES treatments(id),
  FOREIGN key (medical_histories_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL(5,2),
  quantity INT,
  total_price DECIMAL(3,4),
  invoice_id INT,
  treatment_id INT,
  PRIMARY KEY(id),
  FOREIGN key (invoice_id) REFERENCES invoice(id),
  FOREIGN key (treatment_id) REFERENCES treatments(id)
);

CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON medical_histories_treatments (medical_history_id);
CREATE INDEX ON medical_histories_treatments (treatment_id);

