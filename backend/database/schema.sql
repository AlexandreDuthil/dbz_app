DROP DATABASE IF EXISTS dbz_db;
CREATE DATABASE dbz_db;
USE dbz_db;
CREATE TABLE characters (
                id INT AUTO_INCREMENT NOT NULL,
                name VARCHAR(255) NOT NULL,
                description VARCHAR(255) NOT NULL,
                PRIMARY KEY (id)
);