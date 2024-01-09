-- Active: 1704665492989@@127.0.0.1@3306


-- Práticas

-- Prática 1

CREATE TABLE licenses (
    id TEXT PRIMARY KEY NOT NULL UNIQUE,
    register_number TEXT NOT NULL UNIQUE,
    category TEXT NOT NULL
);

CREATE TABLE drivers(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses(id)
);

INSERT INTO licenses (id, register_number, category)
VALUES
    ('l001', '123456', 'A'),
    ('l002', '876543', 'AB');

SELECT * FROM licenses;

INSERT INTO drivers (id, name, email, password, license_id)
VALUES
    ('d001', 'Fulano', 'fulano@email.com', 'fulano123', 'l001'),
    ('d002', 'Ciclano', 'ciclano@email.com', 'ciclano123', 'l002');

SELECT * FROM drivers;

SELECT * FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id;

SELECT
    drivers.id AS driverId,
    drivers.name,
    drivers.email,
    drivers.password,
    licenses.id AS licenseID,
    licenses.register_number AS registerNumber,
    licenses.category
FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id;

-- Prática 3

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE phones (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (id, name, email, password)
VALUES
    ('u001', 'Fulana', 'fulana@email.com', 'fulana000'),
    ('u002', 'Ciclana', 'ciclana@email.com', 'ciclana000');

INSERT INTO phones (id, phone_number, user_id)
VALUES
    ('p001', '48911112222', 'u001'),
    ('p002', '48922223333', 'u001'),
    ('p003', '48933334444', 'u002');

SELECT * FROM users;

SELECT * FROM phones;

SELECT * FROM users
INNER JOIN phones
ON phones.user_id = users.id;