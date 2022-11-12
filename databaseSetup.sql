-- Delete everything and start fresh
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS users;

-- One record per product category
CREATE TABLE category(
    category VARCHAR PRIMARY KEY
);

INSERT INTO category VALUES('contraption');
INSERT INTO category VALUES('device');
INSERT INTO category VALUES('gadget');
INSERT INTO category VALUES('gizmo');
INSERT INTO category VALUES('machine');

-- One record per product
CREATE TABLE product(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    description TEXT NOT NULL,
    price NUMERIC NOT NULL,
    category VARCHAR REFERENCES category(category),
    image_URL VARCHAR NOT NULL
);

-- Insert contraptions
INSERT INTO product 
    SELECT 
        i, 
        'Contraption ' || i::text, 
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
        999999.99, 
        'contraption', 
        '/img/contraption' || i::text || '.jpg'
        FROM generate_series(1,23) AS t(i)
   ; 

-- Insert devices
INSERT INTO product 
    SELECT 
        i+23, 
        'Device ' || i::text, 
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
        999999.99, 
        'device', 
        '/img/device' || i::text || '.jpg'
        FROM generate_series(1,14) AS t(i)
   ; 

-- Insert gadgets
INSERT INTO product 
    SELECT 
        i+37, 
        'Gadget ' || i::text, 
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
        999999.99, 
        'gadget', 
        '/img/gadget' || i::text || '.jpg'
        FROM generate_series(1,9) AS t(i)
   ; 

-- Insert gizmos
INSERT INTO product 
    SELECT 
        i+46, 
        'Gizmo ' || i::text, 
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
        999999.99, 
        'gizmo', 
        '/img/gizmo' || i::text || '.jpg'
        FROM generate_series(1,12) AS t(i)
   ; 

-- Insert machines
INSERT INTO product 
    SELECT 
        i+58, 
        'Machine ' || i::text, 
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
        999999.99, 
        'machine', 
        '/img/machine' || i::text || '.jpg'
        FROM generate_series(1,25) AS t(i)
   ; 


-- Create Users table. The name "user" is reserved keyword, so the name is "users".
CREATE TABLE IF NOT EXISTS users (
	user_id SERIAL PRIMARY KEY,
    user_login VARCHAR(100) UNIQUE NOT NULL,
    user_encryptedPassword VARCHAR(100) NOT NULL,
    user_salt BYTEA NOT NULL
);