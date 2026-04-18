INSERT INTO TipuriCombustibil (nume) VALUES
('Benzina'),
('Diesel'),
('Hibrid'),
('Electric'),
('GPL');

INSERT INTO Marci (nume) VALUES
    ('Dacia'),
    ('Ford'),
    ('Renault'),
    ('Seat'),
    ('Volkswagen');

INSERT INTO TipuriComponente (nume, sistem) VALUES
    ('Catalizator',        'Evacuare'),
    ('Termostat',          'Racire'),
    ('Bujii',              'Aprindere'),
    ('Bobina inductie',    'Aprindere'),
    ('Radiator',           'Racire'),
    ('Pompa apa',          'Racire'),
    ('Filtru aer',         'Admisie'),
    ('Filtru ulei',        'Lubrifiere'),
    ('Filtru combustibil', 'Alimentare'),
    ('Injector',           'Alimentare'),
    ('Pompa combustibil',  'Alimentare'),
    ('Clapeta acceleratie','Admisie');

INSERT INTO Modele (id_marca, nume_model, generatie, an_start, an_sfarsit) VALUES
    (1, 'Logan',   'M1',        2004, 2012),
    (1, 'Sandero', 'M1',        2008, 2012),
    (2, 'Focus',   'MK2',       2004, 2011),
    (2, 'Raptor',  'F150 Gen1', 2010, 2014),
    (3, 'Laguna',  'III',       2007, 2015),
    (4, 'Altea',   '5P',        2004, 2015),
    (5, 'Passat',  'B7',        2010, 2015),
    (5, 'Golf',    'IV',        1997, 2003);

INSERT INTO Motoare (id_model_referinta, id_combustibil, cod_motor, capacitate_cm3, putere_cp, cuplu_nm, standard_emisii, an_start, an_sfarsit) VALUES
    (1, 1, '1.4MPI',    1390, 75,  112, 'Euro 3', 2004, 2012),
    (3, 1, '1.6Ti-VCT', 1596, 105, 150, 'Euro 4', 2004, 2011),
    (4, 1, '6.2V8',     6200, 411, 588, 'Euro 5', 2010, 2014),
    (5, 2, '1.5dCi',    1461, 110, 240, 'Euro 4', 2007, 2015),
    (6, 1, '1.6MPI',    1595, 102, 148, 'Euro 4', 2004, 2015),
    (7, 2, '2.0TDI',    1968, 140, 320, 'Euro 5', 2010, 2015),
    (8, 1, '1.616V',    1598, 105, 148, 'Euro 3', 1997, 2003);

INSERT INTO MotorModele (id_motor, id_model) VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 5),
    (5, 6),
    (6, 7),
    (7, 8);

INSERT INTO Componente (id_tip, numar_oem, producator, descriere, tensiune_v, curent_a, putere_w, pret_eur, stoc_disponibil) VALUES
    (1,  '8200267186',  'Bosal',       'Catalizator Euro 3, motor K7M 1.4 MPI',          NULL, NULL, NULL,  85.00, 12),
    (1,  '7700416983',  'Walker',      'Catalizator Euro 4, motor K9K 1.5 dCi',           NULL, NULL, NULL,  95.00,  8),
    (1,  '1K0254501LX', 'Eberspacher', 'Catalizator Euro 3, motor VAG 1.6 8V',            NULL, NULL, NULL, 110.00,  5),
    (2,  '8200680584',  'Mahle',       'Termostat 89°C, motor K7M/K9K Renault-Nissan',    NULL, NULL, NULL,  18.50, 30),
    (2,  '11537549476', 'Behr',        'Termostat 87°C, motoare VAG 1.6/1.8/2.0 benzina', NULL, NULL, NULL,  22.00, 15),
    (2,  '059121113B',  'Febi',        'Termostat 87°C, motor VAG 2.0 TDI PD',            NULL, NULL, NULL,  24.00, 20),
    (3,  '7700500155',  'NGK',         'Bujii BKR6E, motor K7M 1.4 MPI, set 4',           NULL, NULL, NULL,  14.00, 50),
    (3,  '101000033AA', 'Bosch',       'Bujii BKUR6ET-10, motoare VAG 1.6/2.0 benzina',   NULL, NULL, NULL,  16.00, 40),
    (4,  '06B905115R',  'Bosch',       'Bobina inductie, motoare VAG 1.6/1.8T benzina',   12.0,  7.5,  90,   45.00, 18),
    (4,  '22448-8H315', 'Hitachi',     'Bobina inductie, motor QR20DE/QR25DE Nissan',      12.0,  8.0,  95,   42.00, 10),
    (4,  '5970.85',     'Valeo',       'Bobina inductie, motoare PSA TU/EW benzina',       12.0,  7.0,  85,   38.00, 14),
    (5,  '6001547488',  'Nissens',     'Radiator racire, 53kW, 3 randuri aluminiu',        NULL, NULL, NULL, 120.00,  6),
    (5,  '1K0121251DB', 'Behr',        'Radiator racire, Golf V/Passat B6, aluminiu',      NULL, NULL, NULL, 145.00,  4),
    (5,  '21410-ED000', 'Denso',       'Radiator racire, motor HR16DE Nissan',             NULL, NULL, NULL, 115.00,  7),
    (6,  '7701476473',  'Hepu',        'Pompa apa, motor K9K 1.5 dCi, cu garnitura',       NULL, NULL, NULL,  55.00, 12),
    (6,  '06A121011',   'SKF',         'Pompa apa, motor VAG 1.6 8V AEH/AKL/APF',         NULL, NULL, NULL,  62.00,  9),
    (6,  '16100-29185', 'AISIN',       'Pompa apa, motor 1NZ-FE Toyota',                  NULL, NULL, NULL,  58.00, 11),
    (7,  '1J0129620',   'Mann',        'Filtru aer, cutie filtru VAG 1J, 248x202x46mm',   NULL, NULL, NULL,   9.50, 60),
    (7,  '16546-ED000', 'Mahle',       'Filtru aer, motor HR16DE/HR15DE Nissan',           NULL, NULL, NULL,   8.00, 45),
    (7,  '1444TV',      'Purflux',     'Filtru aer, motor TU1/TU3/TU5 Peugeot',           NULL, NULL, NULL,   7.50, 55),
    (8,  '06A115561B',  'Mann',        'Filtru ulei HU 512/1 x, motor VAG 1.6/1.8 benzina', NULL, NULL, NULL, 6.50, 80),
    (8,  '7700274177',  'Purflux',     'Filtru ulei LS218, motoare Renault 1.4/1.6/1.9',  NULL, NULL, NULL,   5.50, 75),
    (8,  '04152-YZZA5', 'Toyota',      'Filtru ulei OEM Toyota, 3/4-16 UNF',              NULL, NULL, NULL,   7.00, 40),
    (9,  '1K0201051K',  'Mahle',       'Filtru combustibil KL 440/1, diesel, 10 bar',     NULL, NULL, NULL,  15.00, 25),
    (9,  '7701206118',  'Bosch',       'Filtru combustibil benzina, motor Renault 1.4/1.6', NULL, NULL, NULL, 12.00, 30),
    (9,  'WK820/3',     'Mann',        'Filtru combustibil WK 820/3, diesel, universal',  NULL, NULL, NULL,  10.00, 50),
    (10, '0280150718',  'Bosch',       'Injector EV6, 205cc/min, rezistenta inalta',      12.0,  1.2,  14,   85.00, 16),
    (10, '16600-00Q0A', 'Denso',       'Injector diesel common-rail, motor K9K Nissan',   12.0,  1.3,  15,   92.00,  8),
    (10, '1980F0',      'Siemens',     'Injector benzina, motor TU/EW PSA',               12.0,  1.4,  16,   78.00, 11),
    (11, '1K0919051DB', 'VDO',         'Pompa combustibil 60L/h, 3.5 bar, motor VAG',     12.0,  8.0,  96,   68.00,  9),
    (11, '17202-ED80A', 'Denso',       'Pompa combustibil, motor HR16DE/CR14DE Nissan',   12.0,  7.5,  90,   72.00,  6),
    (11, '7700426361',  'Renault',     'Pompa combustibil OEM, motoare Renault 1.4/1.6',  12.0,  8.5, 100,   65.00, 13),
    (12, '7M3133062A',  'Pierburg',    'Clapeta acceleratie 60mm, motor VAG 1.6/1.8',     12.0,  3.0,  36,   95.00,  7),
    (12, '8200285011',  'Bosch',       'Clapeta acceleratie 60mm, motor K4M/K7M Renault', 12.0,  3.2,  38,   88.00, 10),
    (12, '16119-AX600', 'Hitachi',     'Clapeta acceleratie 60mm, motor HR16DE Nissan',   12.0,  3.1,  37,   82.00,  8);

INSERT INTO CrossReferences (id_componenta, aftermarket_number, producator_aftermarket)
    SELECT id_componenta, 'KT 560.14',  'BM Catalysts' FROM Componente WHERE numar_oem = '8200267186'
    UNION ALL
    SELECT id_componenta, '09.39.012',  'Imasaf'       FROM Componente WHERE numar_oem = '8200267186'
    UNION ALL
    SELECT id_componenta, 'KT 120045E', 'BM Catalysts' FROM Componente WHERE numar_oem = '7700416983'
    UNION ALL
    SELECT id_componenta, 'ZS 328',     'Beru'         FROM Componente WHERE numar_oem = '06B905115R'
    UNION ALL
    SELECT id_componenta, 'IC16109',    'Facet'        FROM Componente WHERE numar_oem = '06B905115R'
    UNION ALL
    SELECT id_componenta, 'TH6869.83J', 'Vernet'       FROM Componente WHERE numar_oem = '8200680584'
    UNION ALL
    SELECT id_componenta, 'KL 440/1',   'Knecht'       FROM Componente WHERE numar_oem = '1K0201051K'
    UNION ALL
    SELECT id_componenta, 'BKR5E',      'NGK'          FROM Componente WHERE numar_oem = '7700500155'
    UNION ALL
    SELECT id_componenta, 'LX 3397',    'Mahle'        FROM Componente WHERE numar_oem = '1J0129620';

INSERT INTO ComponenteMotoare (id_componenta, id_motor, note)
SELECT c.id_componenta, 1, 'Logan M1 si Sandero M1'
FROM Componente c
WHERE c.numar_oem IN ('8200267186','8200680584','7700500155','06B905115R','7701476473','6001547488', '7700274177', '7701206118', '7700426361', '8200285011');

INSERT INTO ComponenteMotoare (id_componenta, id_motor, note)
SELECT c.id_componenta, 2, 'Ford Focus MK2'
FROM Componente c
WHERE c.numar_oem IN ('101000033AA', '06B905115R','0280150718','1K0919051DB','7M3133062A');

INSERT INTO ComponenteMotoare (id_componenta, id_motor, note)
SELECT c.id_componenta, 4, 'Renault Laguna III'
FROM Componente c
WHERE c.numar_oem IN ('7700416983','8200680584','7701476473','7700274177','1K0201051K', 'WK820/3', '7700426361', '16600-00Q0A');

INSERT INTO ComponenteMotoare (id_componenta, id_motor, note)
SELECT c.id_componenta, 5, 'Seat Altea 5P'
FROM Componente c
WHERE c.numar_oem IN ('06B905115R','11537549476', '101000033AA', '1J0129620','06A115561B','1K0201051K','7M3133062A');

INSERT INTO ComponenteMotoare (id_componenta, id_motor, note)
SELECT c.id_componenta, 6, 'VW Passat B7'
FROM Componente c
WHERE c.numar_oem IN ('059121113B','06A121011','1K0201051K', 'WK820/3','1K0919051DB','7M3133062A');

INSERT INTO ComponenteMotoare (id_componenta, id_motor, note)
SELECT c.id_componenta, 7, 'VW Golf IV'
FROM Componente c
WHERE c.numar_oem IN ('1K0254501LX', '11537549476','101000033AA', '06B905115R', '1J0129620', '06A115561B', '06A121011', 'WK820/3');