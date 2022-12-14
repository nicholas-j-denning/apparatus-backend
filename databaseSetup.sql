-- Delete everything and start fresh
DROP TABLE IF EXISTS profile;
DROP TABLE IF EXISTS cart;
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
    normal_price NUMERIC NOT NULL,
    price NUMERIC NOT NULL,
    category VARCHAR REFERENCES category(category),
    image_URL VARCHAR NOT NULL
);

-- Insert contraptions
INSERT INTO product 
    VALUES( 
        1, 
        'Potential Leveling Array', 
        'This contraption stabalizes potential fields even in mission critical applications, at least most of the time.', 
        999999.99, 
        999999.99, 
        'contraption', 
        '/img/contraption' || 1 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        2, 
        'Microvice', 
        'Many users report that our custom engineered microvices can securely clamp even the most cantankorus microworkpieces.', 
        999999.99, 
        999999.99, 
        'contraption', 
        '/img/contraption' || 2 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        3, 
        'Metasilk Threading Arm', 
        'Using the latest advancements in metamaterials research, this robotic arm can produce and weave textiles 100,0000,000,000 times stronger than carbon nanotubes.', 
        999999.99, 
        999999.99, 
        'contraption', 
        '/img/contraption' || 3 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        4, 
        'Reliquification Processor', 
        'If your liquids refuse to stay liquid, we''ve got you covered.', 
        999999.99, 
        499999.99, 
        'contraption', 
        '/img/contraption' || 4 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        5, 
        'Plasmatic Interferometer',
        'Align your plasma phases on the quantum level.', 
        999999.99, 
        999999.99, 
        'contraption', 
        '/img/contraption' || 5 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        6, 
        'Tension/Torsion Balancer', 
        'Perfectly balance the forces in your workpiece with this exquisite balancer.', 
        999999.99, 
        999999.99, 
        'contraption', 
        '/img/contraption' || 6 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        7, 
        'Scientific Whirligig', 
        'This impressive experimental contraption reveals the inner secrets of rotation.', 
        999999.99, 
        999999.99, 
        'contraption', 
        '/img/contraption' || 7 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        8, 
        'Lazer Piston Decalcifier', 
        'A calcified laser pistion is truely an embarassing state of affairs.', 
        999999.99, 
        199999.99, 
        'contraption', 
        '/img/contraption' || 8 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        9, 
        'Gizmo Winder', 
        'This gizmo winding contraption is the only safe way to wind Apparatus MFG LLC branded gizmos. Safety only guaranteed under optimal conditions.', 
        999999.99, 
        999999.99, 
        'contraption', 
        '/img/contraption' || 9 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        10, 
        'Gravity Spindle', 
        'It''s possible to balance even the most delicate machines using only this spindle and your local gravity field.', 
        999999.99, 
        999999.99, 
        'contraption', 
        '/img/contraption' || 10 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        11, 
        'Decooker', 
        'Acheive negentropy at home and cook in reverse.', 
        999999.99, 
        599999.99, 
        'contraption', 
        '/img/contraption' || 11 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        12, 
        'Complex Contraption', 
        'Even our team of expert engineers and scientists don''t  know what this one does.', 
        999999.99, 
        999999.99, 
        'contraption', 
        '/img/contraption' || 12 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        13, 
        'Sentient Arm', 
        'This robotic arm comes complete with a phenomenal field and moral agency. Please be nice to it.', 
        999999.99, 
        899999.99, 
        'contraption', 
        '/img/contraption' || 13 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        14, 
        'Retrolathe', 
        'Just a good ol'' fashon retrolathe like they used in the wild west.', 
        999999.99, 
        999999.99, 
        'contraption', 
        '/img/contraption' || 14 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        15, 
        'Voltage Wave Complexifier', 
        'Transmit electrical power forwards or backwards in time.', 
        999999.99, 
        199999.99, 
        'contraption', 
        '/img/contraption' || 15 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        16, 
        'Mechanical Clicker', 
        'Produces many different types of vibrations, some of which are hazardous to human health.', 
        999999.99, 
        999999.99, 
        'contraption', 
        '/img/contraption' || 16 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        17, 
        'Fusion Engine Calibrator', 
        'Calibrate your fusion engines with ease... or difficulty.', 
        999999.99, 
        999999.99, 
        'contraption', 
        '/img/contraption' || 17 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        18, 
        'Hyperrack', 
        'Perfectly engineered to work with our Apparatus MFG LLC machines, acheive deracking, reracking, unracking, infraracking, and metaracking.', 
        999999.99, 
        999999.99, 
        'contraption', 
        '/img/contraption' || 18 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        19, 
        'Mysterious Arm', 
        'Seems like all it does is whip that little dangling thing around. Completely useless... unless you know it''s secret.', 
        999999.99, 
        999999.99, 
        'contraption', 
        '/img/contraption' || 19 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        20, 
        'Ferrofluid Rinsing Station', 
        'Clean your parts with oscillating magnetic fields in both lateral, radial, and transverse orientations.', 
        999999.99, 
        999999.99, 
        'contraption', 
        '/img/contraption' || 20 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        21, 
        'Quintic Mechanism', 
        'Utilizes the latest advancements in Galois theory to solve differential equations completely mechanically, even if local EM fields are destabalized.', 
        999999.99, 
        999999.99, 
        'contraption', 
        '/img/contraption' || 21 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        22, 
        'Factory Table', 
        'Enable miniaturized production. Fast. Efficient. Nearly safe.', 
        999999.99, 
        999999.99, 
        'contraption', 
        '/img/contraption' || 22 || '.jpg'
    ); 
INSERT INTO product 
    VALUES( 
        23, 
        'Utrajig', 
        'Clamp down your workpiece by applying radial forces previously thought impossible.', 
        999999.99, 
        999999.99, 
        'contraption', 
        '/img/contraption' || 23 || '.jpg'
    ); 
INSERT INTO product 
    VALUES(
        24, 
        'Templexity Controller', 
        'A more or less comprehensible way to regain a sense of control over mangled timelines.', 
        999999.99, 
        999999.99, 
        'device', 
        '/img/device' || 1 || '.jpg'
    ); 
INSERT INTO product 
VALUES(
        25, 
        'Metaconsole', 
        'Similar for a console, but for other consoles. DO NOT ATTEMPT TO USE MORE THAN ONE IN A SINGLE SYSTEM.', 
        999999.99, 
        999999.99, 
        'device', 
        '/img/device' || 2 || '.jpg'
    ); 
INSERT INTO product 
VALUES(
        26, 
        'Releveling Surface', 
        'This releveling surface is flat when it needs to be, down to the atomic level.', 
        999999.99, 
        999999.99, 
        'device', 
        '/img/device' || 3 || '.jpg'
    ); 
INSERT INTO product 
VALUES(
        27, 
        'Strategic Interface', 
        'Gain absolute, unquestionable mastery over all aspects of the production process.', 
        999999.99, 
        999999.99, 
        'device', 
        '/img/device' || 4 || '.jpg'
    ); 
INSERT INTO product 
VALUES(
        28, 
        'Tachyon Dectector', 
        'Don''t let you competitors meddle with your timelines. Detect retrocausal interference before (or after) it happens.', 
        999999.99, 
        999999.99, 
        'device', 
        '/img/device' || 5 || '.jpg'
    ); 
INSERT INTO product 
VALUES(
        29, 
        'Quantum Mainboard', 
        'This mainboard laughs in the face of Moore''s Law and provides 100,000 yoctoFLOPS of processing power by calculating on the quark level.', 
        999999.99, 
        999999.99, 
        'device', 
        '/img/device' || 6 || '.jpg'
    ); 
INSERT INTO product 
VALUES(
        30, 
        'Overviewer, with Remote', 
        'Know what''s going on in your production process with a level of certainty which violates even the so-called "uncertainty principle".', 
        999999.99, 
        999999.99, 
        'device', 
        '/img/device' || 7 || '.jpg'
    ); 
INSERT INTO product 
VALUES(
        31, 
        'Neutron Bath', 
        'Decharge your parts quickly and completely with neutron submersion.', 
        999999.99, 
        999999.99, 
        'device', 
        '/img/device' || 8 || '.jpg'
    ); 
INSERT INTO product 
VALUES(
        32, 
        'Experimental Clincher', 
        'Finish your experiments with convenience and style.', 
        999999.99, 
        999999.99, 
        'device', 
        '/img/device' || 9 || '.jpg'
    ); 
INSERT INTO product 
VALUES(
        33, 
        'Femtovoltizing Module', 
        'Attaining the proper electron phases has never before been this easy.', 
        999999.99, 
        999999.99, 
        'device', 
        '/img/device' || 10 || '.jpg'
    ); 
INSERT INTO product 
VALUES(
        34, 
        'Ultrasonic Chelator', 
        'This device uses a tuned frequency array to generate chelating agents directly from vacuum fluctuations.', 
        999999.99, 
        999999.99, 
        'device', 
        '/img/device' || 11 || '.jpg'
    ); 
INSERT INTO product 
VALUES(
        35, 
        'Expression Card', 
        'This expressive expansion card expedites production exponentially.', 
        999999.99, 
        999999.99, 
        'device', 
        '/img/device' || 12 || '.jpg'
    ); 
INSERT INTO product 
VALUES(
        36, 
        'Vortex Modulator', 
        'Even complex vortex configurations can be manipulated by this intuitive interface.', 
        999999.99, 
        999999.99, 
        'device', 
        '/img/device' || 13 || '.jpg'
    ); 
INSERT INTO product 
VALUES(
        37, 
        'Alignment Vice', 
        'It''s very important to keep the machines in your production process in working condition with regular alignments.', 
        999999.99, 
        999999.99, 
        'device', 
        '/img/device' || 14 || '.jpg'
    ); 

-- Insert gadgets
/* INSERT INTO product 
    SELECT 
        i+37, 
        'Gadget ' || i::text, 
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
        999999.99, 
        999999.99, 
        'gadget', 
        '/img/gadget' || i::text || '.jpg'
        FROM generate_series(1,9) AS t(i)
   ;  */
INSERT INTO product 
VALUES(
    38, 
    'PsiPhone 26', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gadget', 
    '/img/gadget1.jpg'
); 
INSERT INTO product 
VALUES(
    39, 
    'Pocket Dimensional Analyzer', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gadget', 
    '/img/gadget2.jpg'
); 
INSERT INTO product 
VALUES(
    40, 
    'Flux Resynthesizer', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gadget', 
    '/img/gadget3.jpg'
); 
INSERT INTO product 
VALUES(
    41, 
    'Programmable Gyroclock', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gadget', 
    '/img/gadget4.jpg'
); 
INSERT INTO product 
VALUES(
    42, 
    'Biosynthesis Validator', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gadget', 
    '/img/gadget5.jpg'
); 
INSERT INTO product 
VALUES(
    43, 
    'Hydrochromoscope', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gadget', 
    '/img/gadget6.jpg'
); 
INSERT INTO product 
VALUES(
    44, 
    'Industrial Centralizer', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gadget', 
    '/img/gadget7.jpg'
); 
INSERT INTO product 
VALUES(
    45, 
    'Planar Digitizer', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gadget', 
    '/img/gadget8.jpg'
); 
INSERT INTO product 
VALUES(
    46, 
    'Autoparenting Unit', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gadget', 
    '/img/gadget9.jpg'
); 

-- Insert gizmos
/* INSERT INTO product 
    SELECT 
        i+46, 
        'Gizmo ' || i::text, 
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
        999999.99, 
        999999.99, 
        'gizmo', 
        '/img/gizmo' || i::text || '.jpg'
        FROM generate_series(1,12) AS t(i)
   ;  */
INSERT INTO product 
VALUES(
    47, 
    'Calibration Widget', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gizmo', 
    '/img/gizmo1.jpg'
); 
INSERT INTO product 
VALUES(
    48, 
    'Nanoverter', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gizmo', 
    '/img/gizmo2.jpg'
); 
INSERT INTO product 
VALUES(
    49, 
    'Miniportal', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gizmo', 
    '/img/gizmo3.jpg'
); 
INSERT INTO product 
VALUES(
    50, 
    'Transmagnetic Key', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gizmo', 
    '/img/gizmo4.jpg'
); 
INSERT INTO product 
VALUES(
    51, 
    'Autotonic Circuit', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gizmo', 
    '/img/gizmo5.jpg'
); 
INSERT INTO product 
VALUES(
    52, 
    'Field Bridge', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gizmo', 
    '/img/gizmo6.jpg'
); 
INSERT INTO product 
VALUES(
    53, 
    'Neural Decoder', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gizmo', 
    '/img/gizmo7.jpg'
); 
INSERT INTO product 
VALUES(
    54, 
    'Self-Balancing Gizmo', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gizmo', 
    '/img/gizmo8.jpg'
); 
INSERT INTO product 
VALUES(
    55, 
    'Gyrobalance', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gizmo', 
    '/img/gizmo9.jpg'
); 
INSERT INTO product 
VALUES(
    56, 
    'Clockwork Torquer', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gizmo', 
    '/img/gizmo10.jpg'
); 
INSERT INTO product 
VALUES(
    57, 
    'Frequency Scrambler Set', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gizmo', 
    '/img/gizmo11.jpg'
); 
INSERT INTO product 
VALUES(
    58, 
    'Spherometer', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'gizmo', 
    '/img/gizmo12.jpg'
); 

-- Insert machines
/* INSERT INTO product 
    SELECT 
        i+58, 
        'Machine ' || i::text, 
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
        999999.99, 
        999999.99, 
        'machine', 
        '/img/machine' || i::text || '.jpg'
        FROM generate_series(1,25) AS t(i)
   ;  */
INSERT INTO product 
VALUES(
    59, 
    'Gigamill', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine1.jpg'
); 
INSERT INTO product 
VALUES(
    60, 
    'Inverse Osmosis Filter', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine2.jpg'
); 
INSERT INTO product 
VALUES(
    61, 
    'Particle Confiner', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine3.jpg'
); 
INSERT INTO product 
VALUES(
    62, 
    'Turboproducer', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine4.jpg'
); 
INSERT INTO product 
VALUES(
    63, 
    'Deluxe Steamer', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine5.jpg'
); 
INSERT INTO product 
VALUES(
    64, 
    'Lazer Kiln', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine6.jpg'
); 
INSERT INTO product 
VALUES(
    65, 
    'Megawinder', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine8.jpg'
); 
INSERT INTO product 
VALUES(
    66, 
    'Dimensional Scanner', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine9.jpg'
); 
INSERT INTO product 
VALUES(
    67, 
    'Hypersonic Broach', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine10.jpg'
); 
INSERT INTO product 
VALUES(
    68, 
    'Reactor Vat', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine11.jpg'
); 
INSERT INTO product VALUES(
    69, 
    'Lab-in-a-Box', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine13.jpg'
); 
INSERT INTO product 
VALUES(
    72, 
    'Machine', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine14.jpg'
); 
INSERT INTO product 
VALUES(
    73, 
    'Machine', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine15.jpg'
); 
INSERT INTO product 
VALUES(
    74, 
    'Machine', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine16.jpg'
); 
INSERT INTO product 
VALUES(
    75, 
    'Machine', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine17.jpg'
); 
INSERT INTO product 
VALUES(
    76, 
    'Machine', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine18.jpg'
); 
INSERT INTO product 
VALUES(
    77, 
    'Machine', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine19.jpg'
); 
INSERT INTO product 
VALUES(
    78, 
    'Machine', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine20.jpg'
); 
INSERT INTO product 
VALUES(
    79, 
    'Machine', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine21.jpg'
); 
INSERT INTO product 
VALUES(
    80, 
    'Machine', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine22.jpg'
); 
INSERT INTO product 
VALUES(
    81, 
    'Machine', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine23.jpg'
); 
INSERT INTO product 
VALUES(
    82, 
    'Machine', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine24.jpg'
); 
INSERT INTO product 
VALUES(
    83, 
    'Machine', 
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
    999999.99, 
    999999.99, 
    'machine', 
    '/img/machine25.jpg'
);  


-- Create Users table. The name "user" is reserved keyword, so the name is "users".
CREATE TABLE IF NOT EXISTS users (
	id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    encrypted_password TEXT,
    salt BYTEA
);

CREATE TABLE profile (
	id SERIAL PRIMARY KEY,
	phone_number TEXT,
	gender TEXT,
	dob TEXT,
	user_id INTEGER REFERENCES users(id)
);

CREATE TABLE cart (
    id INTEGER PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    product_id INTEGER REFERENCES product(id)
);
