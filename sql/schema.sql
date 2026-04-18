CREATE DATABASE IF NOT EXISTS automotive_catalog
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE automotive_catalog;

CREATE TABLE Marci (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nume     VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE TipuriCombustibil (
    id_combustibil INT AUTO_INCREMENT PRIMARY KEY,
    nume           VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE TipuriComponente (
    id_tip INT AUTO_INCREMENT PRIMARY KEY,
    nume   VARCHAR(100) NOT NULL,
    sistem VARCHAR(100)
);

CREATE TABLE Modele (
    id_model   INT AUTO_INCREMENT PRIMARY KEY,
    id_marca   INT          NOT NULL,
    nume_model VARCHAR(100) NOT NULL,
    generatie  VARCHAR(50),
    an_start   YEAR         NOT NULL,
    an_sfarsit YEAR,

    CONSTRAINT chk_ani_model
        CHECK (an_sfarsit IS NULL OR an_sfarsit >= an_start),

    FOREIGN KEY (id_marca) REFERENCES Marci(id_marca)
);

CREATE TABLE Motoare (
    id_motor           INT AUTO_INCREMENT PRIMARY KEY,
    id_model_referinta INT         NOT NULL,
    id_combustibil     INT         NOT NULL,
    cod_motor          VARCHAR(50) NOT NULL,
    capacitate_cm3     INT,
    putere_cp          INT,
    cuplu_nm           INT,
    standard_emisii    VARCHAR(20),
    an_start           YEAR,
    an_sfarsit         YEAR,

    CONSTRAINT chk_putere_cp     CHECK (putere_cp      IS NULL OR putere_cp      > 0),
    CONSTRAINT chk_capacitate    CHECK (capacitate_cm3  IS NULL OR capacitate_cm3 > 0),
    CONSTRAINT chk_cuplu         CHECK (cuplu_nm        IS NULL OR cuplu_nm       > 0),
    CONSTRAINT chk_ani_motor     CHECK (an_sfarsit      IS NULL OR an_sfarsit    >= an_start),

    FOREIGN KEY (id_model_referinta) REFERENCES Modele(id_model),
    FOREIGN KEY (id_combustibil)     REFERENCES TipuriCombustibil(id_combustibil)
);

CREATE TABLE MotorModele (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    id_motor      INT NOT NULL,
    id_model      INT NOT NULL,

    UNIQUE KEY uq_motor_model (id_motor, id_model),
    FOREIGN KEY (id_motor) REFERENCES Motoare(id_motor),
    FOREIGN KEY (id_model) REFERENCES Modele(id_model)
);

CREATE TABLE Componente (
    id_componenta  INT AUTO_INCREMENT PRIMARY KEY,
    id_tip         INT          NOT NULL,
    numar_oem      VARCHAR(100) NOT NULL UNIQUE,
    producator     VARCHAR(100),
    descriere      TEXT,
    tensiune_v     DECIMAL(6,2),
    curent_a       DECIMAL(6,2),
    putere_w       DECIMAL(8,2),
    pret_eur       DECIMAL(10,2),
    stoc_disponibil INT NOT NULL DEFAULT 0,
    created_at     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
                                ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT chk_tensiune  CHECK (tensiune_v      IS NULL OR tensiune_v      > 0),
    CONSTRAINT chk_curent    CHECK (curent_a         IS NULL OR curent_a        > 0),
    CONSTRAINT chk_putere_w  CHECK (putere_w         IS NULL OR putere_w        > 0),
    CONSTRAINT chk_pret      CHECK (pret_eur         IS NULL OR pret_eur       >= 0),
    CONSTRAINT chk_stoc      CHECK (stoc_disponibil >= 0),

    FOREIGN KEY (id_tip) REFERENCES TipuriComponente(id_tip)
);

CREATE TABLE CrossReferences (
    id                     INT AUTO_INCREMENT PRIMARY KEY,
    id_componenta          INT          NOT NULL,
    aftermarket_number     VARCHAR(100) NOT NULL,
    producator_aftermarket VARCHAR(100),

    UNIQUE KEY uq_xref (id_componenta, aftermarket_number),
    FOREIGN KEY (id_componenta) REFERENCES Componente(id_componenta)
);

CREATE TABLE ComponenteMotoare (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    id_componenta INT  NOT NULL,
    id_motor      INT  NOT NULL,
    note          TEXT,
    updated_at    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
                            ON UPDATE CURRENT_TIMESTAMP,

    UNIQUE KEY uq_comp_motor (id_componenta, id_motor),
    FOREIGN KEY (id_componenta) REFERENCES Componente(id_componenta),
    FOREIGN KEY (id_motor)      REFERENCES Motoare(id_motor)
);

CREATE INDEX idx_oem            ON Componente(numar_oem);
CREATE INDEX idx_motor_cod      ON Motoare(cod_motor);
CREATE INDEX idx_model_marca    ON Modele(id_marca);
CREATE INDEX idx_xref_oem       ON CrossReferences(id_componenta);
CREATE INDEX idx_compat_motor      ON ComponenteMotoare(id_motor);
CREATE INDEX idx_motor_combustibil ON Motoare(id_combustibil);
CREATE INDEX idx_comp_producator   ON Componente(producator);
CREATE INDEX idx_xref_aftermarket  ON CrossReferences(aftermarket_number);
CREATE INDEX idx_motormodele_model ON MotorModele(id_model);