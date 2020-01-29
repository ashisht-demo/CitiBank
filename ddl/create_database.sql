Rem----------------------------------------------------------------------------
Rem Name 	- create database
Rem Purpose - create databae citibank_db and schema.
Rem Author  - AshishT
Rem Created - 29Jan2020
Rem----------------------------------------------------------------------------
--Set environment variables to cmd.
-------------------------------------------------------------------------------
SET ORACLE_SID=orcl
SET ORACLE_HOME=D:\oracle\product\12.2.0\dbhome_1
-------------------------------------------------------------------------------
--Connect to sql*Plus and log in to SYS account.
-------------------------------------------------------------------------------
sqlplus /nolog
conn / as sysdba

--Open all pluggable databases
alter pluggable database all open;
SHOW CON_NAME
SHOW PDBS 
-------------------------------------------------------------------------------
--Create pluggable database.
-------------------------------------------------------------------------------
--To avoid ORA-65016: FILE_NAME_CONVERT must be specified

ALTER SYSTEM SET db_create_file_dest = 'D:\oracle\oradata\orcl';
CREATE PLUGGABLE DATABASE citibank_db ADMIN USER ADMIN IDENTIFIED BY Welcome_1;
ALTER PLUGGABLE DATABASE citibank_db OPEN;
ALTER SESSION SET CONTAINER=citibank_db;
SHOW PDBS;
-------------------------------------------------------------------------------
--check services.
-------------------------------------------------------------------------------
--citibank_db.persistent.co.in
select name, con_id from v$active_services order by 1;
-------------------------------------------------------------------------------
--Create schema.
-------------------------------------------------------------------------------
CREATE USER city_core IDENTIFIED BY Welcome_1;
--schema grants.
DEFINE v_schema_user = city_core;
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, ALTER SESSION, CREATE SEQUENCE TO &&v_schema_user.;
GRANT CREATE ANY SYNONYM, CREATE dataBASE LINK, CREATE CLUSTER, CREATE TRIGGER TO &&v_schema_user.;
GRANT CREATE PROCEDURE, CREATE ROLE TO &&v_schema_user.;

ALTER SESSION SET CURRENT_SCHEMA = city_core;

CREATE TABLE model
(
class varchar2(40),
description varchar2(400)
);

select name, con_id from v$active_services order by 1;
citibank_db.persistent.co.in
---------------------------------------------------------
CREATE OR REPLACE PROCEDURE Proc_create_model
IS
BEGIN
	dbms_output.put_line('Process Create Model');
END;