--Creating a readonly user for accessing tables(No-write permission)
--sudo su postgres

--psql

CREATE ROLE readonlyuser WITH LOGIN PASSWORD 'readonlyuser' NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION VALID UNTIL 'infinity';

--Assign permission to this read only user:
GRANT CONNECT ON DATABASE db_name TO readonlyuser;
\c db_name
GRANT USAGE ON SCHEMA public TO readonlyuser;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonlyuser;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO readonlyuser;

--Drop role
revoke ALL on all tables in schema public from readonlyuser;
drop owned by readonlyuser;
drop role readonlyuser;
