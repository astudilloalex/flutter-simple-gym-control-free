CREATE TABLE company(
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    phone TEXT NOT NULL,
    address TEXT NOT NULL
);

CREATE TABLE roles(
    id INTEGER PRIMARY KEY,
    code TEXT UNIQUE NOT NULL,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE employees(
    id INTEGER PRIMARY KEY,
    id_card TEXT UNIQUE NOT NULL,
    hire_date DATE NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

CREATE TABLE customers(
    id INTEGER PRIMARY KEY,
    id_card TEXT UNIQUE NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE,
    phone TEXT UNIQUE,
    initial_date DATE NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    username TEXT NOT NULL,
    password TEXT NOT NULL,
    employee_id INTEGER NOT NULL,
    role_id INTEGER NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

INSERT INTO
    roles(id, code, name)
VALUES
    (1, 'ADM', 'ADMIN'),
    (2, 'EMP', 'EMPLOYEE');

INSERT INTO
    employees(
        id,
        id_card,
        hire_date,
        first_name,
        last_name,
        email
    )
VALUES
    (
        1,
        '0123456789',
        datetime('now'),
        'Admin',
        'Admin',
        'example@email.com'
    );

INSERT INTO
    users(id, username, password, employee_id, role_id)
VALUES
    (
        1,
        'admin',
        '$2a$10$ZfTA12S04CUU7kSvGbgYou/oH4XavsKlJ7vsHdmzZpomRDpRDk.92',
        1,
        1
    );