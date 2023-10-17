DROP TABLE IF EXISTS client CASCADE;
DROP TABLE IF EXISTS staff CASCADE;
DROP TABLE IF EXISTS account CASCADE;
DROP TABLE IF EXISTS currency CASCADE;
DROP TABLE IF EXISTS bank_transaction CASCADE;
DROP TABLE IF EXISTS credit CASCADE;
DROP TABLE IF EXISTS deposit CASCADE;
DROP TABLE IF EXISTS credit_product CASCADE;
DROP TABLE IF EXISTS client_category CASCADE;
DROP TABLE IF EXISTS bank_branch CASCADE;
DROP TABLE IF EXISTS client_staff CASCADE;
DROP TABLE IF EXISTS address CASCADE;
DROP TABLE IF EXISTS working_hours CASCADE;

CREATE TABLE client (
  client_id SERIAL PRIMARY KEY,
  account_id INT UNIQUE,
  client_category_id INT,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  email VARCHAR(30) UNIQUE NOT NULL,
  phone CHAR(13),
  client_password VARCHAR(20) NOT NULL
);

CREATE TABLE staff (
  staff_id SERIAL PRIMARY KEY,
  bank_branch_id INT,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  staff_password VARCHAR(20) NOT NULL,
  phone CHAR(13) NOT NULL,
  job_position VARCHAR(20) NOT NULL,
  department VARCHAR(20) NOT NULL
);

CREATE TABLE account (
  account_id SERIAL PRIMARY KEY,
  currency_id INT NOT NULL,
  balance DECIMAL DEFAULT 0.00,
  opening_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE currency (
  currency_id SERIAL PRIMARY KEY,
  currency_name VARCHAR(15) UNIQUE NOT NULL,
  code INT UNIQUE NOT NULL,
  symbol CHAR(1) UNIQUE NOT NULL
);

CREATE TABLE bank_transaction (
  bank_transaction_id SERIAL PRIMARY KEY,
  account_id INT NOT NULL,
  amount DECIMAL NOT NULL,
  bank_transaction_type VARCHAR(20),
  transaction_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  description VARCHAR(200)
);

CREATE TABLE credit (
  credit_id SERIAL PRIMARY KEY,
  account_id INT NOT NULL,
  credit_product_id INT NOT NULL,
  amount DECIMAL NOT NULL,
  issuance_date DATE NOT NULL,
  repayment_period INT NOT NULL
);

CREATE TABLE deposit (
  deposit_id SERIAL PRIMARY KEY,
  account_id INT NOT NULL,
  deposit_type VARCHAR(20) NOT NULL,
  amount DECIMAL NOT NULL,
  issuance_date DATE NOT NULL,
  is_early_withdrawal BOOL NOT NULL,
  interestRate REAL NOT NULL,
  term INT NOT NULL
);

CREATE TABLE credit_product (
  credit_product_id SERIAL PRIMARY KEY,
  credit_product_name VARCHAR(50) UNIQUE NOT NULL,
  credit_product_type VARCHAR(50) NOT NULL,
  description VARCHAR(50),
  max_amount DECIMAL NOT NULL,
  interest_rate REAL NOT NULL,
  is_actual BOOL NOT NULL
);

CREATE TABLE client_category (
  client_category_id SERIAL PRIMARY KEY,
  client_category_name VARCHAR(30) UNIQUE NOT NULL,
  description VARCHAR(200),
  criteria VARCHAR(100) NOT NULL,
  bonus VARCHAR(100) NOT NULL
);

CREATE TABLE working_hours (
  working_hours_id SERIAL PRIMARY KEY,
  opening_time INTERVAL NOT NULL,
  closing_time INTERVAL NOT NULL
);

CREATE TABLE address (
  address_id SERIAL PRIMARY KEY,
  country VARCHAR(30) NOT NULL,
  sity VARCHAR(30) NOT NULL,
  street VARCHAR (30) NOT NULL,
  house_number INT NOT NULL
);

CREATE TABLE bank_branch (
  bank_branch_id SERIAL PRIMARY KEY,
  working_hours_id INT NOT NULL,
  address_id INT UNIQUE NOT NULL,
  bank_branch_name VARCHAR(30) NOT NULL,
  phone CHAR(13) NOT NULL
);

CREATE TABLE client_staff (
  client_id INT NOT NULL,
  staff_id INT NOT NULL
);

ALTER TABLE client ADD FOREIGN KEY (client_category_id) REFERENCES client_category (client_category_id);
ALTER TABLE client ADD FOREIGN KEY (account_id) REFERENCES account (account_id);
ALTER TABLE staff ADD FOREIGN KEY (bank_branch_id) REFERENCES bank_branch (bank_branch_id);
ALTER TABLE account ADD FOREIGN KEY (currency_id) REFERENCES currency (currency_id);
ALTER TABLE bank_transaction ADD FOREIGN KEY (account_id) REFERENCES account (account_id);
ALTER TABLE credit ADD FOREIGN KEY (account_id) REFERENCES account (account_id);
ALTER TABLE deposit ADD FOREIGN KEY (account_id) REFERENCES account (account_id);
ALTER TABLE credit ADD FOREIGN KEY (credit_product_id) REFERENCES credit_product (credit_product_id);
ALTER TABLE client_staff ADD FOREIGN KEY (client_id) REFERENCES client (client_id);
ALTER TABLE client_staff ADD FOREIGN KEY (staff_id) REFERENCES staff (staff_id);
ALTER TABLE bank_branch ADD FOREIGN KEY (working_hours_id) REFERENCES working_hours (working_hours_id);
ALTER TABLE bank_branch ADD FOREIGN KEY (address_id) REFERENCES address (address_id);

CREATE INDEX idx_email ON client(email);
CREATE INDEX idx_client_category_id ON client(client_category_id);
CREATE INDEX idx_account_id ON account(account_id);
CREATE INDEX idx_bank_transaction_account_id ON bank_transaction(account_id);
CREATE INDEX idx_credit_account_id ON credit(account_id);
CREATE INDEX idx_deposit_account_id ON deposit(account_id);
CREATE INDEX idx_credit_product_id ON credit_product(credit_product_id);
CREATE INDEX idx_client_category_name ON client_category(client_category_name);
CREATE INDEX idx_bank_branch_name ON bank_branch(bank_branch_name);
CREATE INDEX idx_client_staff_client_id ON client_staff(client_id);
CREATE INDEX idx_client_staff_staff_id ON client_staff(staff_id);