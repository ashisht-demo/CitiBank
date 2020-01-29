Rem----------------------------------------------------------------------------
Rem Name 	- create table
Rem Purpose - create tables of city_core schema.
Rem Author  - AshishT
Rem Created - 29Jan2020
Rem----------------------------------------------------------------------------
--Set environment variables to cmd.
-------------------------------------------------------------------------------
ALTER SESSION SET CURRENT_SCHEMA = city_core;

CREATE TABLE bank_locations
(
  branch_id number,
  branch_code varchar2(20),
  address varchar2(1000),
  CONSTRAINT pk_bank_locations PRIMARY KEY (branch_id)
);

CREATE TABLE customers
( customer_id number,
  branch_id number,
  customer_name varchar2(80),
  contact_info varchar2(1000),
  CONSTRAINT pk_customer PRIMARY KEY (customer_id),
  CONSTRAINT fk_customer_branch FOREIGN KEY(branch_id)
			REFERENCES bank_locations(branch_id)
);

CREATE TABLE account_type
(
  account_type_id number,
  account_type varchar2(20),
  CONSTRAINT pk_account_type PRIMARY KEY (account_type_id)
);

CREATE TABLE accounts
(
  account_id number,
  customer_id number,
  branch_id number,
  account_type_id number,
  acccount_number number,
  balance number,
  CONSTRAINT pk_accounts PRIMARY KEY (account_id),
  CONSTRAINT fk_accounts_customer FOREIGN KEY(customer_id)
			REFERENCES customers(customer_id),
  CONSTRAINT fk_accounts_bank_locations FOREIGN KEY(branch_id)
			REFERENCES bank_locations(branch_id),			
  CONSTRAINT fk_accounts_account_type FOREIGN KEY(account_type_id)
			REFERENCES account_type(account_type_id)			
);
