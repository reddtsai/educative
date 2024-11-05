CREATE ROLE replicator WITH REPLICATION LOGIN ENCRYPTED PASSWORD '1qaz2wsx';

CREATE TABLE IF NOT EXISTS users (
    "ID" SERIAL PRIMARY KEY,
    "ACCOUNT" VARCHAR(256) NOT NULL UNIQUE,
    "EMAIL" VARCHAR(256) NOT NULL,
    "PASSWORD" VARCHAR(256) NOT NULL,
    "CREATED_AT" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UPDATED_AT" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);