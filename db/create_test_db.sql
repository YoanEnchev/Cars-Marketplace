/* Make sure the DB and credentials are the same as in the .flaskenv.test DB */
CREATE USER postgres_test WITH PASSWORD 'test_db_common';

CREATE DATABASE cars_marketplace_test;

GRANT ALL PRIVILEGES ON DATABASE cars_marketplace_test TO postgres_test;