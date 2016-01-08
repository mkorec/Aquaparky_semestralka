/*
Created: 01-Oct-15
Modified: 08-Jan-16
Model: Aquapark_IS
Database: Oracle 11g Release 2
*/


-- Drop relationships section -------------------------------------------------

ALTER TABLE cennik_atrakcia DROP CONSTRAINT atrakcia_ma_cennik
/
ALTER TABLE navstevnik_atrakcia DROP CONSTRAINT vyuziva_atrakcie
/
ALTER TABLE navstevnik_atrakcia DROP CONSTRAINT navstevnost_atrakcie
/
ALTER TABLE atrakcia DROP CONSTRAINT ma_atrakcie
/
ALTER TABLE aquapark_navstevnik DROP CONSTRAINT navstevuje
/
ALTER TABLE aquapark_navstevnik DROP CONSTRAINT ma_navstevnost
/
ALTER TABLE max_rychlost DROP CONSTRAINT ma_max_rychlost
/
ALTER TABLE aquapark DROP CONSTRAINT ma_adresu
/
ALTER TABLE adresa DROP CONSTRAINT ma_obec
/
ALTER TABLE obmedzenie_toboganu DROP CONSTRAINT ma_obmedzenie
/
ALTER TABLE cennik_aquapark_vstup DROP CONSTRAINT aquapark_ma_cennik
/
ALTER TABLE zlozenie_vody_v_bazene DROP CONSTRAINT ma_zlozenie
/
ALTER TABLE zlozenie_vody_v_bazene DROP CONSTRAINT ma_latky
/
ALTER TABLE tobogan DROP CONSTRAINT ISA_tobogan
/
ALTER TABLE bazen DROP CONSTRAINT ISA_bazen
/
ALTER TABLE majitel_aquapark DROP CONSTRAINT majitelia_aquapark
/
ALTER TABLE majitel_aquapark DROP CONSTRAINT majitel_majitelia
/




-- Drop keys for tables section -------------------------------------------------

ALTER TABLE navstevnik_atrakcia DROP CONSTRAINT navstevnik_atrakcia_key
/
ALTER TABLE aquapark_navstevnik DROP CONSTRAINT aquapark_navstevnik_key
/
ALTER TABLE max_rychlost DROP CONSTRAINT max_rychlost_key
/
ALTER TABLE cennik_atrakcia DROP CONSTRAINT cennik_atrakcia_key
/
ALTER TABLE obec DROP CONSTRAINT obec_key
/
ALTER TABLE obmedzenie_toboganu DROP CONSTRAINT obmedzenie_key
/
ALTER TABLE navstevnik DROP CONSTRAINT navstevnik_key
/
ALTER TABLE cennik_aquapark_vstup DROP CONSTRAINT cennik_key
/
ALTER TABLE adresa DROP CONSTRAINT adresa_key
/
ALTER TABLE zlozenie_vody_v_bazene DROP CONSTRAINT zlozenie_key
/
ALTER TABLE tobogan DROP CONSTRAINT tobogan_key
/
ALTER TABLE latka_vody DROP CONSTRAINT latka_key
/
ALTER TABLE bazen DROP CONSTRAINT bazen_key
/
ALTER TABLE atrakcia DROP CONSTRAINT atrakcia_key
/
ALTER TABLE majitel_aquapark DROP CONSTRAINT majitel_aquapark_key
/
ALTER TABLE majitel DROP CONSTRAINT majitel_key
/
ALTER TABLE aquapark DROP CONSTRAINT aquapark_key
/


-- Drop indexes section -------------------------------------------------

DROP INDEX IX_ma_obec
/
DROP INDEX IX_patri_aquaparku
/
DROP INDEX IX_ma_adresu
/


-- Drop packages section --------------------------------------------------- 

DROP PACKAGE AQUAPARK_PACKAGE
/

-- Drop tables section ---------------------------------------------------

DROP TABLE navstevnik_atrakcia CASCADE CONSTRAINTS
/
DROP TABLE aquapark_navstevnik CASCADE CONSTRAINTS
/
DROP TABLE max_rychlost CASCADE CONSTRAINTS
/
DROP TABLE cennik_atrakcia CASCADE CONSTRAINTS
/
DROP TABLE obec CASCADE CONSTRAINTS
/
DROP TABLE obmedzenie_toboganu CASCADE CONSTRAINTS
/
DROP TABLE navstevnik CASCADE CONSTRAINTS
/
DROP TABLE cennik_aquapark_vstup CASCADE CONSTRAINTS
/
DROP TABLE adresa CASCADE CONSTRAINTS
/
DROP TABLE zlozenie_vody_v_bazene CASCADE CONSTRAINTS
/
DROP TABLE tobogan CASCADE CONSTRAINTS
/
DROP TABLE latka_vody CASCADE CONSTRAINTS
/
DROP TABLE bazen CASCADE CONSTRAINTS
/
DROP TABLE atrakcia CASCADE CONSTRAINTS
/
DROP TABLE majitel_aquapark CASCADE CONSTRAINTS
/
DROP TABLE majitel CASCADE CONSTRAINTS
/
DROP TABLE aquapark CASCADE CONSTRAINTS
/

-- Drop sequences section --------------------------------------------------- 

DROP SEQUENCE latka_sequence
/
DROP SEQUENCE navstevnik_sequence
/
DROP SEQUENCE atrakcia_sequence
/
DROP SEQUENCE adresa_sequence
/
DROP SEQUENCE aquapark_sequence
/

-- Create sequences section -------------------------------------------------

CREATE SEQUENCE aquapark_sequence
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE adresa_sequence
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE atrakcia_sequence
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE navstevnik_sequence
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE latka_sequence
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

-- Create tables section -------------------------------------------------

-- Table aquapark

CREATE TABLE aquapark(
  id_aquapark Integer NOT NULL,
  prevadzka_od Integer NOT NULL,
  prevadzka_do Integer NOT NULL,
  nazov Varchar2(30 ) NOT NULL,
  id_adresa Integer NOT NULL
)
/

-- Create indexes for table aquapark

CREATE INDEX IX_ma_adresu ON aquapark (id_adresa)
/

-- Add keys for table aquapark

ALTER TABLE aquapark ADD CONSTRAINT aquapark_key PRIMARY KEY (id_aquapark)
/

-- Table majitel

CREATE TABLE majitel(
  rod_cislo Varchar2(10 ) NOT NULL,
  meno Varchar2(30 ) NOT NULL,
  priezvisko Varchar2(30 ) NOT NULL
)
/

-- Add keys for table majitel

ALTER TABLE majitel ADD CONSTRAINT majitel_key PRIMARY KEY (rod_cislo)
/

-- Table majitel_aquapark

CREATE TABLE majitel_aquapark(
  rod_cislo Varchar2(10 ) NOT NULL,
  id_aquapark Integer NOT NULL,
  datum_od Date NOT NULL,
  datum_do Date
)
/

-- Add keys for table majitel_aquapark

ALTER TABLE majitel_aquapark ADD CONSTRAINT majitel_aquapark_key PRIMARY KEY (rod_cislo,id_aquapark,datum_od)
/

-- Table atrakcia

CREATE TABLE atrakcia(
  id_atrakcia Integer NOT NULL,
  nazov Varchar2(30 ) NOT NULL,
  vnutorna Number(1,0),
  prevadzka_od Integer,
  prevadzka_do Integer,
  popis Varchar2(30 ),
  id_aquapark Integer
)
/

-- Create indexes for table atrakcia

CREATE INDEX IX_patri_aquaparku ON atrakcia (id_aquapark)
/

-- Add keys for table atrakcia

ALTER TABLE atrakcia ADD CONSTRAINT atrakcia_key PRIMARY KEY (id_atrakcia)
/

-- Table bazen

CREATE TABLE bazen(
  id_bazen Integer NOT NULL,
  hlbka_vody Float NOT NULL,
  teplota_vody Float NOT NULL,
  typ Varchar2(15 ) NOT NULL,
  pre_neplavcov Number(1,0) NOT NULL
)
/

-- Add keys for table bazen

ALTER TABLE bazen ADD CONSTRAINT bazen_key PRIMARY KEY (id_bazen)
/

-- Table latka_vody

CREATE TABLE latka_vody(
  id_latka Integer NOT NULL,
  nazov Varchar2(30 ) NOT NULL,
  vplyv_latky Varchar2(30 ) NOT NULL
)
/

-- Add keys for table latka_vody

ALTER TABLE latka_vody ADD CONSTRAINT latka_key PRIMARY KEY (id_latka)
/

-- Table tobogan

CREATE TABLE tobogan(
  id_tobogan Integer NOT NULL,
  dlzka Float NOT NULL,
  obtiaznost Integer NOT NULL,
  nafukovacka Number(1,0) NOT NULL,
  otvoreny Number(1,0) NOT NULL,
  farba Varchar2(10 )
)
/

-- Add keys for table tobogan

ALTER TABLE tobogan ADD CONSTRAINT tobogan_key PRIMARY KEY (id_tobogan)
/

-- Table zlozenie_vody_v_bazene

CREATE TABLE zlozenie_vody_v_bazene(
  id_latky Integer NOT NULL,
  id_bazen Integer NOT NULL,
  mnozstvo Number
)
/

-- Add keys for table zlozenie_vody_v_bazene

ALTER TABLE zlozenie_vody_v_bazene ADD CONSTRAINT zlozenie_key PRIMARY KEY (id_latky,id_bazen)
/

-- Table adresa

CREATE TABLE adresa(
  id_adresa Integer NOT NULL,
  ulica Varchar2(30 ),
  cislo Integer,
  id_obec Char(6 )
)
/

-- Create indexes for table adresa

CREATE INDEX IX_ma_obec ON adresa (id_obec)
/

-- Add keys for table adresa

ALTER TABLE adresa ADD CONSTRAINT adresa_key PRIMARY KEY (id_adresa)
/

-- Table cennik_aquapark_vstup

CREATE TABLE cennik_aquapark_vstup(
  skupina Varchar2(10 ) NOT NULL,
  platna_od Date NOT NULL,
  id_aquapark Integer NOT NULL,
  platna_do Date,
  suma Float NOT NULL
)
/

-- Add keys for table cennik_aquapark_vstup

ALTER TABLE cennik_aquapark_vstup ADD CONSTRAINT cennik_key PRIMARY KEY (platna_od,id_aquapark,skupina)
/

-- Table navstevnik

CREATE TABLE navstevnik(
  id_navstevnik Integer NOT NULL,
  meno Varchar2(10 ),
  priezvisko Varchar2(15 )
)
/

-- Add keys for table navstevnik

ALTER TABLE navstevnik ADD CONSTRAINT navstevnik_key PRIMARY KEY (id_navstevnik)
/

-- Table obmedzenie_toboganu

CREATE TABLE obmedzenie_toboganu(
  id_obmedzenie Varchar2(15 ) NOT NULL,
  id_tobogan Integer NOT NULL,
  hodnota Float NOT NULL,
  popis Varchar2(30 )
)
/

-- Add keys for table obmedzenie_toboganu

ALTER TABLE obmedzenie_toboganu ADD CONSTRAINT obmedzenie_key PRIMARY KEY (id_obmedzenie,id_tobogan)
/

-- Table obec

CREATE TABLE obec(
  id_obec Char(6 ) NOT NULL,
  nazov Varchar2(30 ) NOT NULL
)
/

-- Add keys for table obec

ALTER TABLE obec ADD CONSTRAINT obec_key PRIMARY KEY (id_obec)
/

-- Table cennik_atrakcia

CREATE TABLE cennik_atrakcia(
  platna_od Date NOT NULL,
  id_atrakcia Integer NOT NULL,
  platna_do Date,
  suma Float NOT NULL
)
/

-- Add keys for table cennik_atrakcia

ALTER TABLE cennik_atrakcia ADD CONSTRAINT cennik_atrakcia_key PRIMARY KEY (platna_od,id_atrakcia)
/

-- Table max_rychlost

CREATE TABLE max_rychlost(
  datum Date NOT NULL,
  id_tobogan Integer NOT NULL,
  rychlost Float NOT NULL
)
/

-- Add keys for table max_rychlost

ALTER TABLE max_rychlost ADD CONSTRAINT max_rychlost_key PRIMARY KEY (datum,id_tobogan)
/

-- Table aquapark_navstevnik

CREATE TABLE aquapark_navstevnik(
  id_aquapark Integer NOT NULL,
  id_navstevnik Integer NOT NULL,
  vstup Date NOT NULL,
  odchod Date NOT NULL
)
/

-- Add keys for table aquapark_navstevnik

ALTER TABLE aquapark_navstevnik ADD CONSTRAINT aquapark_navstevnik_key PRIMARY KEY (id_aquapark,id_navstevnik,vstup)
/

-- Table navstevnik_atrakcia

CREATE TABLE navstevnik_atrakcia(
  cas Date NOT NULL,
  id_navstevnik Integer NOT NULL,
  id_atrakcia Integer NOT NULL
)
/

-- Add keys for table navstevnik_atrakcia

ALTER TABLE navstevnik_atrakcia ADD CONSTRAINT navstevnik_atrakcia_key PRIMARY KEY (id_atrakcia,id_navstevnik,cas)
/

-- Create packages section -------------------------------------------------

CREATE PACKAGE AQUAPARK_PACKAGE
AS
  FUNCTION EXIST_AQUAPARK(
      PID INTEGER)
    RETURN BOOLEAN;
  FUNCTION EXIST_AQUAPARK_NAZOV(
      PNAZOV VARCHAR2)
    RETURN BOOLEAN;
  FUNCTION CREATE_AQUAPARK(
      PNAZOV        VARCHAR2,
      PPREVADZKA_OD INTEGER,
      PPREVADZKA_DO INTEGER,
      PULICA        VARCHAR2,
      PCISLO        INTEGER,
      POBEC         CHAR)
    RETURN INTEGER;
  FUNCTION DELETE_AQUAPARK(
      PID INTEGER)
    RETURN INTEGER;
  FUNCTION UPDATE_AQUAPARK(
      PID           INTEGER,
      PNAZOV        VARCHAR2,
      PPREVADZKA_OD INTEGER,
      PPREVADZKA_DO INTEGER,
      PULICA        VARCHAR2,
      PCISLO        INTEGER,
      POBEC         CHAR)
    RETURN INTEGER;
  FUNCTION ADD_CENA(
      AQUAPARK INTEGER,
      PSKUPINA VARCHAR2,
      PSUMA FLOAT)
    RETURN INTEGER;
  FUNCTION REMOVE_CENA(
      AQUAPARK   INTEGER,
      PSKUPINA   VARCHAR2,
      PPLATNA_OD DATE)
    RETURN INTEGER;
  FUNCTION EXIST_MAJITEL(
      PROD_CISLO VARCHAR2)
    RETURN BOOLEAN;
  FUNCTION EXIST_MAJITEL_AQUAPARK(
      AQUAPARK   INTEGER,
      PROD_CISLO VARCHAR2)
    RETURN BOOLEAN;
  FUNCTION ADD_MAJITEL(
      AQUAPARK    INTEGER,
      PROD_CISLO  VARCHAR2,
      PMENO       VARCHAR2,
      PPRIEZVISKO VARCHAR2)
    RETURN INTEGER;
  FUNCTION REMOVE_MAJITEL(
      AQUAPARK   INTEGER,
      PROD_CISLO VARCHAR2)
    RETURN INTEGER;
  FUNCTION EXIST_ATRAKCIA(
      AQUAPARK INTEGER,
      ATRAKCIA INTEGER)
    RETURN BOOLEAN;
  FUNCTION ADD_ATRAKCIA(
      AQUAPARK      INTEGER,
      PNAZOV        VARCHAR2,
      PVNUTORNA     NUMBER,
      PPREVADZKA_OD INTEGER,
      PPREVADZKA_DO INTEGER,
      PPOPIS        VARCHAR2,
      PSUMA FLOAT)
    RETURN INTEGER;
  FUNCTION UPDATE_ATRAKCIA(
      AQUAPARK      INTEGER,
      ATRAKCIA      INTEGER,
      PNAZOV        VARCHAR2,
      PVNUTORNA     NUMBER,
      PPREVADZKA_OD INTEGER,
      PPREVADZKA_DO INTEGER,
      PPOPIS        VARCHAR2,
      PSUMA FLOAT)
    RETURN INTEGER;
  FUNCTION DELETE_ATRAKCIA(
      AQUAPARK INTEGER,
      ATRAKCIA INTEGER)
    RETURN INTEGER;
  FUNCTION EXIST_TOBOGAN(
      AQUAPARK INTEGER,
      TOBOGAN  INTEGER)
    RETURN BOOLEAN;
  FUNCTION CREATE_TOBOGAN(
      AQUAPARK      INTEGER,
      PNAZOV        VARCHAR2,
      PVNUTORNA     NUMBER,
      PPREVADZKA_OD INTEGER,
      PPREVADZKA_DO INTEGER,
      PPOPIS        VARCHAR2,
      PSUMA FLOAT,
      PDLZKA FLOAT,
      POBTIAZNOST  INTEGER,
      PNAFUKOVACKA NUMBER,
      POTVORENY    NUMBER,
      PFARBA       VARCHAR2)
    RETURN INTEGER;
  FUNCTION UPDATE_TOBOGAN(
      AQUAPARK      INTEGER,
      TOBOGAN       INTEGER,
      PNAZOV        VARCHAR2,
      PVNUTORNA     NUMBER,
      PPREVADZKA_OD INTEGER,
      PPREVADZKA_DO INTEGER,
      PPOPIS        VARCHAR2,
      PSUMA FLOAT,
      PDLZKA FLOAT,
      POBTIAZNOST  INTEGER,
      PNAFUKOVACKA NUMBER,
      POTVORENY    NUMBER,
      PFARBA       VARCHAR2)
    RETURN INTEGER;
  FUNCTION DELETE_TOBOGAN(
      AQUAPARK INTEGER,
      TOBOGAN  INTEGER)
    RETURN NUMBER;
  FUNCTION EXIST_OBMEDZENIE(
      OBMEDZENIE VARCHAR2,
      TOBOGAN    INTEGER)
    RETURN BOOLEAN;
  FUNCTION ADD_OBMEDZENIE(
      AQUAPARK INTEGER,
      TOBOGAN  INTEGER,
      NAZOV    VARCHAR2,
      PHODNOTA FLOAT,
      PPOPIS VARCHAR2)
    RETURN INTEGER;
  FUNCTION REMOVE_OBMEDZENIE(
      TOBOGAN INTEGER,
      NAZOV   VARCHAR2)
    RETURN INTEGER;
  FUNCTION EXIST_BAZEN(
      AQUAPARK INTEGER,
      BAZEN    INTEGER)
    RETURN BOOLEAN;
  FUNCTION CREATE_BAZEN(
      AQUAPARK      INTEGER,
      PNAZOV        VARCHAR2,
      PVNUTORNA     NUMBER,
      PPREVADZKA_OD INTEGER,
      PPREVADZKA_DO INTEGER,
      PPOPIS        VARCHAR2,
      PSUMA FLOAT,
      PHLBKA FLOAT,
      PTEPLOTA  INTEGER,
      PNEPLAVCI NUMBER,
      PTYP      VARCHAR2)
    RETURN INTEGER;
  FUNCTION UPDATE_BAZEN(
      AQUAPARK      INTEGER,
      BAZEN         INTEGER,
      PNAZOV        VARCHAR2,
      PVNUTORNA     NUMBER,
      PPREVADZKA_OD INTEGER,
      PPREVADZKA_DO INTEGER,
      PPOPIS        VARCHAR2,
      PSUMA FLOAT,
      PHLBKA FLOAT,
      PTEPLOTA  INTEGER,
      PNEPLAVCI NUMBER,
      PTYP      VARCHAR2)
    RETURN INTEGER;
  FUNCTION DELETE_BAZEN(
      AQUAPARK INTEGER,
      BAZEN    INTEGER)
    RETURN INTEGER;
  FUNCTION EXIST_LATKA(
      LATKA INTEGER)
    RETURN BOOLEAN;
  FUNCTION EXIST_LATKA_NAZOV(
      NAZOV VARCHAR2)
    RETURN BOOLEAN;
  FUNCTION CREATE_LATKA(
      PNAZOV VARCHAR2,
      PVPLYV VARCHAR2)
    RETURN INTEGER;
  FUNCTION UPDATE_LATKA(
      LATKA  INTEGER,
      PNAZOV VARCHAR2,
      PVPLYV VARCHAR2)
    RETURN INTEGER;
  FUNCTION DELETE_LATKA(
      LATKA INTEGER)
    RETURN INTEGER;
  FUNCTION ADD_LATKA(
      BAZEN     INTEGER,
      LATKA     INTEGER,
      PMNOZSTVO NUMBER)
    RETURN INTEGER;
  FUNCTION REMOVE_LATKA(
      BAZEN INTEGER,
      LATKA INTEGER)
    RETURN INTEGER;
  PROCEDURE GENERATE_NAVSTEVNOST(
      AQUAPARK INTEGER,
      DATUM    DATE);
  FUNCTION GENERATE_NAVSTEVNIK(
      AQUAPARK INTEGER)
    RETURN INTEGER;
END AQUAPARK_PACKAGE;
/
CREATE PACKAGE BODY AQUAPARK_PACKAGE
AS

-- Exist aquapark ID
  FUNCTION EXIST_AQUAPARK(
      PID INTEGER)
    RETURN BOOLEAN AS
  POCET NUMBER DEFAULT 0;
  BEGIN
    SELECT 
      COUNT(*) INTO POCET 
    FROM 
      AQUAPARK
    WHERE 
      AQUAPARK.ID_AQUAPARK = PID;
    
    IF (POCET = 0) THEN
      RETURN FALSE;
    END IF;
    
    RETURN TRUE;
  END EXIST_AQUAPARK;

-- Exist aquapark nazov
  FUNCTION EXIST_AQUAPARK_NAZOV(
      PNAZOV VARCHAR2)
    RETURN BOOLEAN AS
  POCET NUMBER DEFAULT 0;
  BEGIN
    SELECT 
      COUNT(*) INTO POCET 
    FROM 
      AQUAPARK
    WHERE 
      AQUAPARK.NAZOV = PNAZOV;
    
    IF (POCET = 0) THEN
      RETURN FALSE;
    END IF;
    
    RETURN TRUE;
  END EXIST_AQUAPARK_NAZOV;

-- Create aquapark
  FUNCTION CREATE_AQUAPARK(
      PNAZOV        VARCHAR2,
      PPREVADZKA_OD INTEGER,
      PPREVADZKA_DO INTEGER,
      PULICA        VARCHAR2,
      PCISLO        INTEGER,
      POBEC         CHAR)
    RETURN INTEGER AS
    EXIST BOOLEAN := FALSE;
  BEGIN
    EXIST := EXIST_AQUAPARK_NAZOV(PNAZOV);
    
    IF (EXIST) THEN
      RETURN 0;
    END IF;
    
    INSERT INTO ADRESA (ULICA, CISLO, ID_OBEC)
    VALUES (PULICA, PCISLO, POBEC);
    
    INSERT INTO AQUAPARK (PREVADZKA_OD, PREVADZKA_DO, NAZOV, ID_ADRESA)
    VALUES(PPREVADZKA_OD, PPREVADZKA_DO, PNAZOV, ADRESA_SEQUENCE.CURRVAL);
    
    RETURN 1;
  END CREATE_AQUAPARK;

-- Delete aquapark
  FUNCTION DELETE_AQUAPARK(
      PID INTEGER)
    RETURN INTEGER AS
    TYPE T_ATRAKCIA 
    IS TABLE OF ATRAKCIA.ID_ATRAKCIA%TYPE
       INDEX BY PLS_INTEGER;
    TOBOGANY T_ATRAKCIA;
    BAZENY T_ATRAKCIA;
    
    TYPE T_CENNIK
    IS TABLE OF CENNIK_AQUAPARK_VSTUP%ROWTYPE;
    CENNIK T_CENNIK;
    
    EXIST BOOLEAN;
    POM INTEGER := 0;
    PARK AQUAPARK%ROWTYPE;
  BEGIN
    EXIST := EXIST_AQUAPARK(PID);
    
    IF (EXIST) THEN
      SELECT 
        * INTO PARK
      FROM 
        AQUAPARK
      WHERE ID_AQUAPARK = PID;
      
      -- delete cennik vstupov
      SELECT
        * BULK COLLECT INTO CENNIK
      FROM CENNIK_AQUAPARK_VSTUP
      WHERE ID_AQUAPARK = PID;
      
      FOR INDX IN 1 .. CENNIK.COUNT 
      LOOP
        POM := REMOVE_CENA(PID, CENNIK(INDX).SKUPINA, CENNIK(INDX).PLATNA_OD);
      END LOOP;
      
      -- delete majitelia
      DELETE MAJITEL_AQUAPARK
      WHERE ID_AQUAPARK = PID;
      
      -- delete navstevnost
      DELETE AQUAPARK_NAVSTEVNIK
      WHERE ID_AQUAPARK = PID;
      
      -- delete tobogany
      SELECT 
        ID_TOBOGAN BULK COLLECT INTO TOBOGANY 
      FROM ATRAKCIA JOIN TOBOGAN ON (ATRAKCIA.ID_ATRAKCIA = TOBOGAN.ID_TOBOGAN)
      WHERE ID_AQUAPARK = PID;
      
      FOR INDX IN 1 .. TOBOGANY.COUNT 
      LOOP
        POM := DELETE_TOBOGAN(PID, TOBOGANY(INDX));
      END LOOP;
      
      -- delete bazeny
      SELECT 
        ID_BAZEN BULK COLLECT INTO BAZENY 
      FROM ATRAKCIA JOIN BAZEN ON (ATRAKCIA.ID_ATRAKCIA = BAZEN.ID_BAZEN)
      WHERE ID_AQUAPARK = PID;
      
      FOR INDX IN 1 .. BAZENY.COUNT 
      LOOP
        POM := DELETE_BAZEN(PID, BAZENY(INDX));
      END LOOP;
      
      -- delete aquapark
      DELETE AQUAPARK
      WHERE ID_AQUAPARK = PID;
      
      -- delete adresa
      DELETE ADRESA WHERE ID_ADRESA = PARK.ID_ADRESA;
      
      RETURN 1;
    END IF;
    RETURN 0;
  END DELETE_AQUAPARK;

-- update aquapark
  FUNCTION UPDATE_AQUAPARK(
      PID           INTEGER,
      PNAZOV        VARCHAR2,
      PPREVADZKA_OD INTEGER,
      PPREVADZKA_DO INTEGER,
      PULICA        VARCHAR2,
      PCISLO        INTEGER,
      POBEC         CHAR)
    RETURN INTEGER AS
    EXIST BOOLEAN;
    PARK AQUAPARK%ROWTYPE;
  BEGIN
    EXIST := EXIST_AQUAPARK(PID);
    
    IF (EXIST) THEN
      SELECT 
        * INTO PARK
      FROM 
        AQUAPARK
      WHERE ID_AQUAPARK = PID;
      
      -- update adresa
      UPDATE 
        ADRESA
      SET 
        ULICA = PULICA, 
        CISLO = PCISLO, 
        ID_OBEC = POBEC
      WHERE 
        ID_ADRESA = PARK.ID_ADRESA;
      
      -- update aquapark
      UPDATE
        AQUAPARK
      SET
        NAZOV = PNAZOV,
        PREVADZKA_OD = PPREVADZKA_OD,
        PREVADZKA_DO = PPREVADZKA_DO
      WHERE
        ID_AQUAPARK = PID;
      
    END IF;
    
    RETURN 0;
  END UPDATE_AQUAPARK;

-- add new cena
  FUNCTION ADD_CENA(
      AQUAPARK INTEGER,
      PSKUPINA VARCHAR2,
      PSUMA FLOAT)
    RETURN INTEGER AS
    POCET INTEGER := 0;
    DATUM DATE;
  BEGIN
    SELECT COUNT(*) INTO POCET
    FROM CENNIK_AQUAPARK_VSTUP
    WHERE ID_AQUAPARK = AQUAPARK
      AND SKUPINA = PSKUPINA;
      
    IF (POCET > 0) THEN
      SELECT PLATNA_OD INTO DATUM
      FROM CENNIK_AQUAPARK_VSTUP
      WHERE ID_AQUAPARK = AQUAPARK
        AND SKUPINA = PSKUPINA AND PLATNA_DO IS NULL;

      IF (DATUM < CURRENT_DATE) THEN
        UPDATE 
          CENNIK_AQUAPARK_VSTUP
        SET
          PLATNA_DO = CURRENT_DATE
        WHERE ID_AQUAPARK = AQUAPARK
          AND SKUPINA = PSKUPINA
          AND PLATNA_DO IS NULL;
      ELSE
        DELETE 
          CENNIK_AQUAPARK_VSTUP
        WHERE ID_AQUAPARK = AQUAPARK
          AND SKUPINA = PSKUPINA
          AND PLATNA_DO IS NULL;
      END IF;
      
      INSERT INTO CENNIK_AQUAPARK_VSTUP
      VALUES (PSKUPINA, CURRENT_DATE, AQUAPARK, NULL, PSUMA);
    END IF;    
  RETURN 1;
  END ADD_CENA;

-- remove cena
  FUNCTION REMOVE_CENA(
      AQUAPARK   INTEGER,
      PSKUPINA   VARCHAR2,
      PPLATNA_OD DATE)
    RETURN INTEGER AS
  POCET INTEGER := 0;
  BEGIN
    SELECT COUNT(*) INTO POCET
    FROM CENNIK_AQUAPARK_VSTUP
    WHERE ID_AQUAPARK = AQUAPARK
      AND SKUPINA = PSKUPINA;
      
    IF (POCET > 0) THEN
      DELETE 
        CENNIK_AQUAPARK_VSTUP
      WHERE ID_AQUAPARK = AQUAPARK
        AND PLATNA_OD = PPLATNA_OD
        AND SKUPINA = PSKUPINA;
    END IF;
    
  RETURN 1;
  END REMOVE_CENA;

-- test if exists majitel
  FUNCTION EXIST_MAJITEL(
      PROD_CISLO VARCHAR2)
    RETURN BOOLEAN AS
  POCET NUMBER DEFAULT 0;
  BEGIN
    SELECT COUNT(*) INTO POCET 
    FROM MAJITEL
    WHERE MAJITEL.ROD_CISLO = PROD_CISLO;
    
    IF (POCET = 0) THEN
      RETURN FALSE;
    END IF;
    
    RETURN TRUE;
  END EXIST_MAJITEL;

-- test if majitel has aquapark
  FUNCTION EXIST_MAJITEL_AQUAPARK(
      AQUAPARK   INTEGER,
      PROD_CISLO VARCHAR2)
    RETURN BOOLEAN AS
  POCET NUMBER DEFAULT 0;
  BEGIN
    SELECT COUNT(*) INTO POCET 
    FROM MAJITEL_AQUAPARK
    WHERE MAJITEL_AQUAPARK.ID_AQUAPARK = AQUAPARK
      AND MAJITEL_AQUAPARK.ROD_CISLO = PROD_CISLO
      AND MAJITEL_AQUAPARK.DATUM_DO IS NULL;
    
    IF (POCET = 0) THEN
      RETURN FALSE;
    END IF;
    
    RETURN TRUE;
  END EXIST_MAJITEL_AQUAPARK;

-- add majitel to aquapark
  FUNCTION ADD_MAJITEL(
      AQUAPARK    INTEGER,
      PROD_CISLO  VARCHAR2,
      PMENO       VARCHAR2,
      PPRIEZVISKO VARCHAR2)
    RETURN INTEGER AS
    EXIST BOOLEAN := FALSE;
  BEGIN
    EXIST := EXIST_MAJITEL_AQUAPARK(AQUAPARK, PROD_CISLO);
    IF (EXIST) THEN
      RETURN 0;
    END IF;
    
    EXIST := EXIST_MAJITEL(PROD_CISLO);
    IF (EXIST = FALSE) THEN
      -- insert majitel
      INSERT INTO MAJITEL
      VALUES (PROD_CISLO, PMENO, PPRIEZVISKO);
    END IF;
    
    -- insert majitel_aquapark
    INSERT INTO MAJITEL_AQUAPARK
    VALUES (PROD_CISLO, AQUAPARK, CURRENT_DATE, NULL);
    
    RETURN 1;
  END ADD_MAJITEL;

-- remove majitel from aquapark
  FUNCTION REMOVE_MAJITEL(
      AQUAPARK   INTEGER,
      PROD_CISLO VARCHAR2)
    RETURN INTEGER AS
  EXIST BOOLEAN := FALSE;
  DATUM DATE;
  BEGIN
    EXIST := EXIST_MAJITEL_AQUAPARK(AQUAPARK, PROD_CISLO);
    IF (EXIST = FALSE) THEN
      RETURN 0;
    END IF;
    
    SELECT DATUM_OD INTO DATUM FROM MAJITEL_AQUAPARK 
    WHERE ROD_CISLO = PROD_CISLO AND ID_AQUAPARK = AQUAPARK AND DATUM_DO IS NULL;
    
    IF (DATUM < CURRENT_DATE) THEN
      UPDATE 
        MAJITEL_AQUAPARK
      SET
        DATUM_DO = CURRENT_DATE
      WHERE
        ROD_CISLO = PROD_CISLO
        AND ID_AQUAPARK = AQUAPARK;
    ELSE
      DELETE 
        MAJITEL_AQUAPARK
      WHERE
        ROD_CISLO = PROD_CISLO
        AND ID_AQUAPARK = AQUAPARK;
    END IF;
    
    RETURN 1;
  END REMOVE_MAJITEL;

-- test if exists atrakcia
  FUNCTION EXIST_ATRAKCIA(
      AQUAPARK INTEGER,
      ATRAKCIA INTEGER)
    RETURN BOOLEAN AS
  POCET NUMBER DEFAULT 0;
  BEGIN
    SELECT COUNT(*) INTO POCET 
    FROM ATRAKCIA
    WHERE ATRAKCIA.ID_AQUAPARK = AQUAPARK
      AND ATRAKCIA.ID_ATRAKCIA = ATRAKCIA;
    
    IF (POCET = 0) THEN
      RETURN FALSE;
    END IF;
    
    RETURN TRUE;
  END EXIST_ATRAKCIA;

-- create atrakcia
  FUNCTION ADD_ATRAKCIA(
      AQUAPARK      INTEGER,
      PNAZOV        VARCHAR2,
      PVNUTORNA     NUMBER,
      PPREVADZKA_OD INTEGER,
      PPREVADZKA_DO INTEGER,
      PPOPIS        VARCHAR2,
      PSUMA FLOAT)
    RETURN INTEGER AS
    EXIST BOOLEAN := FALSE;
  BEGIN
    EXIST := EXIST_AQUAPARK(AQUAPARK);
    
    IF (EXIST) THEN
      INSERT INTO ATRAKCIA (NAZOV, VNUTORNA, PREVADZKA_OD, PREVADZKA_DO, POPIS, ID_AQUAPARK)
      VALUES (PNAZOV, PVNUTORNA, PPREVADZKA_OD, PPREVADZKA_DO, PPOPIS, AQUAPARK);
      
      INSERT INTO CENNIK_ATRAKCIA
      VALUES (CURRENT_DATE, ATRAKCIA_SEQUENCE.CURRVAL, NULL, PSUMA);
      
      RETURN ATRAKCIA_SEQUENCE.CURRVAL;
    END IF;
    
    RETURN 0;
  END ADD_ATRAKCIA;

-- update atrakcia
  FUNCTION UPDATE_ATRAKCIA(
      AQUAPARK      INTEGER,
      ATRAKCIA      INTEGER,
      PNAZOV        VARCHAR2,
      PVNUTORNA     NUMBER,
      PPREVADZKA_OD INTEGER,
      PPREVADZKA_DO INTEGER,
      PPOPIS        VARCHAR2,
      PSUMA FLOAT)
    RETURN INTEGER AS
    EXIST BOOLEAN := FALSE;
    CENA FLOAT := 0;
    DATUM DATE;
  BEGIN
    EXIST := EXIST_ATRAKCIA(AQUAPARK, ATRAKCIA);
    
    IF (EXIST) THEN
      UPDATE ATRAKCIA
      SET
        NAZOV = PNAZOV, 
        VNUTORNA = PVNUTORNA, 
        PREVADZKA_OD = PPREVADZKA_OD, 
        PREVADZKA_DO = PPREVADZKA_DO, 
        POPIS = PPOPIS
      WHERE
        ID_ATRAKCIA = ATRAKCIA
        AND ID_AQUAPARK = AQUAPARK;
      
      SELECT SUMA INTO CENA FROM CENNIK_ATRAKCIA
      WHERE ID_ATRAKCIA = ATRAKCIA AND PLATNA_DO IS NULL;
      
      IF (CENA <> PSUMA) THEN
        SELECT PLATNA_OD INTO DATUM
        FROM CENNIK_ATRAKCIA
        WHERE ID_ATRAKCIA = ATRAKCIA
          AND PLATNA_DO IS NULL;
  
        IF (DATUM < CURRENT_DATE) THEN
          UPDATE 
            CENNIK_ATRAKCIA
          SET
            PLATNA_DO = CURRENT_DATE
          WHERE ID_ATRAKCIA = ATRAKCIA
            AND PLATNA_DO IS NULL;
        ELSE
          DELETE CENNIK_ATRAKCIA
          WHERE
            ID_ATRAKCIA = ATRAKCIA AND PLATNA_DO IS NULL;
        END IF;
            
        INSERT INTO CENNIK_ATRAKCIA
        VALUES (CURRENT_DATE, ATRAKCIA, NULL, PSUMA);
        
        RETURN 1;
      END IF;      
      RETURN 0;
    END IF;
    
    RETURN 0;
  END UPDATE_ATRAKCIA;

-- delete atrakcia
  FUNCTION DELETE_ATRAKCIA(
      AQUAPARK INTEGER,
      ATRAKCIA INTEGER)
    RETURN INTEGER AS
  EXIST BOOLEAN := FALSE;
  BEGIN
    EXIST := EXIST_ATRAKCIA(AQUAPARK, ATRAKCIA);
    
    IF (EXIST) THEN
      DELETE FROM CENNIK_ATRAKCIA
      WHERE ID_ATRAKCIA = ATRAKCIA;
      
      DELETE FROM NAVSTEVNIK_ATRAKCIA
      WHERE ID_ATRAKCIA = ATRAKCIA;
      
      DELETE FROM ATRAKCIA
      WHERE ID_ATRAKCIA = ATRAKCIA;
    END IF;
    
    RETURN 0;
  END DELETE_ATRAKCIA;

-- test if exists tobogan
  FUNCTION EXIST_TOBOGAN(
      AQUAPARK INTEGER,
      TOBOGAN  INTEGER)
    RETURN BOOLEAN AS
  POCET NUMBER DEFAULT 0;
  BEGIN
    SELECT COUNT(*) INTO POCET 
    FROM TOBOGAN JOIN ATRAKCIA ON (TOBOGAN.ID_TOBOGAN = ATRAKCIA.ID_ATRAKCIA)
    WHERE ID_AQUAPARK = AQUAPARK
      AND ID_ATRAKCIA = TOBOGAN;
    
    IF (POCET = 0) THEN
      RETURN FALSE;
    END IF;
    
    RETURN TRUE;
  END EXIST_TOBOGAN;

-- create tobogan
  FUNCTION CREATE_TOBOGAN(
      AQUAPARK      INTEGER,
      PNAZOV        VARCHAR2,
      PVNUTORNA     NUMBER,
      PPREVADZKA_OD INTEGER,
      PPREVADZKA_DO INTEGER,
      PPOPIS        VARCHAR2,
      PSUMA FLOAT,
      PDLZKA FLOAT,
      POBTIAZNOST  INTEGER,
      PNAFUKOVACKA NUMBER,
      POTVORENY    NUMBER,
      PFARBA       VARCHAR2)
    RETURN INTEGER AS
    ATRAKCIA INTEGER := 0;
  BEGIN
    ATRAKCIA := ADD_ATRAKCIA(AQUAPARK, PNAZOV, PVNUTORNA, PPREVADZKA_OD, PPREVADZKA_DO, PPOPIS, PSUMA);
    
    IF (ATRAKCIA <> 0) THEN
      INSERT INTO TOBOGAN 
        (ID_TOBOGAN, DLZKA, OBTIAZNOST, NAFUKOVACKA, OTVORENY, FARBA)
      VALUES 
        (ATRAKCIA, PDLZKA, POBTIAZNOST, PNAFUKOVACKA, POTVORENY, PFARBA);
      
      RETURN 1;
    END IF;
    
    RETURN 0;
  END CREATE_TOBOGAN;

-- update tobogan
  FUNCTION UPDATE_TOBOGAN(
      AQUAPARK      INTEGER,
      TOBOGAN       INTEGER,
      PNAZOV        VARCHAR2,
      PVNUTORNA     NUMBER,
      PPREVADZKA_OD INTEGER,
      PPREVADZKA_DO INTEGER,
      PPOPIS        VARCHAR2,
      PSUMA FLOAT,
      PDLZKA FLOAT,
      POBTIAZNOST  INTEGER,
      PNAFUKOVACKA NUMBER,
      POTVORENY    NUMBER,
      PFARBA       VARCHAR2)
    RETURN INTEGER AS
  EXIST BOOLEAN := FALSE;
  BEGIN
    EXIST := EXIST_TOBOGAN(AQUAPARK, TOBOGAN);
    
    IF (EXIST) THEN
      UPDATE TOBOGAN
      SET
        DLZKA = PDLZKA,
        OBTIAZNOST = POBTIAZNOST,
        NAFUKOVACKA = PNAFUKOVACKA,
        OTVORENY = POTVORENY,
        FARBA = PFARBA
      WHERE
        ID_TOBOGAN = TOBOGAN;
      
      RETURN UPDATE_ATRAKCIA(AQUAPARK, TOBOGAN, PNAZOV, PVNUTORNA, PPREVADZKA_OD, PPREVADZKA_DO, PPOPIS, PSUMA);
    END IF;

    RETURN 0;
  END UPDATE_TOBOGAN;

-- delete tobogan
  FUNCTION DELETE_TOBOGAN(
      AQUAPARK INTEGER,
      TOBOGAN    INTEGER)
    RETURN NUMBER AS
  EXIST BOOLEAN := FALSE;
  BEGIN
    EXIST := EXIST_TOBOGAN(AQUAPARK, TOBOGAN);
    
    IF (EXIST) THEN
      DELETE OBMEDZENIE_TOBOGANU
      WHERE ID_TOBOGAN = TOBOGAN;
      
      DELETE MAX_RYCHLOST
      WHERE ID_TOBOGAN = TOBOGAN;
      
      RETURN DELETE_ATRAKCIA(AQUAPARK, TOBOGAN);
    END IF;

    RETURN 0;
  END DELETE_TOBOGAN;

-- test if exists obmedzenie
  FUNCTION EXIST_OBMEDZENIE(
      OBMEDZENIE VARCHAR2,
      TOBOGAN INTEGER)
    RETURN BOOLEAN AS
    POCET NUMBER DEFAULT 0;
  BEGIN
    SELECT 
      COUNT(*) INTO POCET 
    FROM 
      OBMEDZENIE_TOBOGANU
    WHERE
      ID_OBMEDZENIE = OBMEDZENIE AND ID_TOBOGAN = TOBOGAN;
    
    IF (POCET > 0) THEN
      RETURN TRUE;
    END IF;
  
    RETURN FALSE;
  END EXIST_OBMEDZENIE;

-- add obmedzenie to tobogan
  FUNCTION ADD_OBMEDZENIE(
      AQUAPARK      INTEGER,
      TOBOGAN INTEGER,
      NAZOV   VARCHAR2,
      PHODNOTA FLOAT,
      PPOPIS VARCHAR2)
    RETURN INTEGER AS
    EXIST BOOLEAN := FALSE;
  BEGIN
    EXIST := EXIST_TOBOGAN(AQUAPARK, TOBOGAN);
    
    IF (EXIST) THEN
      EXIST := EXIST_OBMEDZENIE(NAZOV, TOBOGAN);
      
      IF (EXIST = FALSE) THEN
        INSERT INTO OBMEDZENIE_TOBOGANU
        VALUES (NAZOV, TOBOGAN, PHODNOTA, PPOPIS);
      
        RETURN 1;
      END IF;
    END IF;
  
    RETURN 0;
  END ADD_OBMEDZENIE;

-- remove obmedzenie from tobogan
  FUNCTION REMOVE_OBMEDZENIE(
      TOBOGAN INTEGER,
      NAZOV   VARCHAR2)
    RETURN INTEGER AS
    EXIST BOOLEAN := FALSE;
  BEGIN
    EXIST := EXIST_OBMEDZENIE(NAZOV, TOBOGAN);
      
      IF (EXIST) THEN
        DELETE OBMEDZENIE_TOBOGANU
        WHERE ID_OBMEDZENIE = NAZOV AND ID_TOBOGAN = TOBOGAN;
        
        RETURN 1;
      END IF;
      
    RETURN 0;
  END REMOVE_OBMEDZENIE;

-- test if exists bazen
  FUNCTION EXIST_BAZEN(
      AQUAPARK INTEGER,
      BAZEN    INTEGER)
    RETURN BOOLEAN AS
  POCET NUMBER DEFAULT 0;
  BEGIN
    SELECT COUNT(*) INTO POCET 
    FROM BAZEN JOIN ATRAKCIA ON (BAZEN.ID_BAZEN = ATRAKCIA.ID_ATRAKCIA)
    WHERE ID_AQUAPARK = AQUAPARK
      AND ID_ATRAKCIA = BAZEN;
    
    IF (POCET = 0) THEN
      RETURN FALSE;
    END IF;
    
    RETURN TRUE;
  END EXIST_BAZEN;

-- create bazen
  FUNCTION CREATE_BAZEN(
      AQUAPARK      INTEGER,
      PNAZOV        VARCHAR2,
      PVNUTORNA     NUMBER,
      PPREVADZKA_OD INTEGER,
      PPREVADZKA_DO INTEGER,
      PPOPIS        VARCHAR2,
      PSUMA FLOAT,
      PHLBKA FLOAT,
      PTEPLOTA  INTEGER,
      PNEPLAVCI NUMBER,
      PTYP      VARCHAR2)
    RETURN INTEGER AS
  ATRAKCIA INTEGER := 0;
  BEGIN
    ATRAKCIA := ADD_ATRAKCIA(AQUAPARK, PNAZOV, PVNUTORNA, PPREVADZKA_OD, PPREVADZKA_DO, PPOPIS, PSUMA);
    
    IF (ATRAKCIA <> 0) THEN
      INSERT INTO BAZEN 
        (ID_BAZEN, HLBKA_VODY, TEPLOTA_VODY, TYP, PRE_NEPLAVCOV)
      VALUES 
        (ATRAKCIA, PHLBKA, PTEPLOTA, PTYP, PNEPLAVCI);
      
      RETURN 1;
    END IF;
    
    RETURN 0;
    RETURN NULL;
  END CREATE_BAZEN;

-- update bazen
  FUNCTION UPDATE_BAZEN(
      AQUAPARK      INTEGER,
      BAZEN         INTEGER,
      PNAZOV        VARCHAR2,
      PVNUTORNA     NUMBER,
      PPREVADZKA_OD INTEGER,
      PPREVADZKA_DO INTEGER,
      PPOPIS        VARCHAR2,
      PSUMA FLOAT,
      PHLBKA FLOAT,
      PTEPLOTA  INTEGER,
      PNEPLAVCI NUMBER,
      PTYP      VARCHAR2)
    RETURN INTEGER AS
  EXIST BOOLEAN := FALSE;
  BEGIN
    EXIST := EXIST_BAZEN(AQUAPARK, BAZEN);
    
    IF (EXIST) THEN
      UPDATE BAZEN
      SET
        HLBKA_VODY = PHLBKA,
        TEPLOTA_VODY = PTEPLOTA,
        TYP = PTYP,
        PRE_NEPLAVCOV = PNEPLAVCI
      WHERE
        ID_BAZEN = BAZEN;
      
      RETURN UPDATE_ATRAKCIA(AQUAPARK, BAZEN, PNAZOV, PVNUTORNA, PPREVADZKA_OD, PPREVADZKA_DO, PPOPIS, PSUMA);
    END IF;

    RETURN 0;
  END UPDATE_BAZEN;

-- delete bazen
  FUNCTION DELETE_BAZEN(
      AQUAPARK INTEGER,
      BAZEN    INTEGER)
    RETURN INTEGER AS
    EXIST BOOLEAN := FALSE;
  BEGIN
    EXIST := EXIST_BAZEN(AQUAPARK, BAZEN);
    
    IF (EXIST) THEN
      DELETE ZLOZENIE_VODY_V_BAZENE
      WHERE ID_BAZEN = BAZEN;
      
      DELETE BAZEN
      WHERE ID_BAZEN = BAZEN;
      
      RETURN DELETE_ATRAKCIA(AQUAPARK, BAZEN);
    END IF;

    RETURN 0;
  END DELETE_BAZEN;

-- test if latka exists
  FUNCTION EXIST_LATKA(
      LATKA INTEGER)
    RETURN BOOLEAN AS
    POCET NUMBER DEFAULT 0;
  BEGIN
    SELECT COUNT(*) INTO POCET 
    FROM LATKA_VODY
    WHERE LATKA_VODY.ID_LATKA = LATKA;
    
    IF (POCET = 0) THEN
      RETURN FALSE;
    END IF;
    
    RETURN TRUE;
  END EXIST_LATKA;

-- test if latka with nazov exists
  FUNCTION EXIST_LATKA_NAZOV(
      NAZOV VARCHAR2)
    RETURN BOOLEAN AS
    POCET NUMBER DEFAULT 0;
  BEGIN
    SELECT COUNT(*) INTO POCET 
    FROM LATKA_VODY
    WHERE LATKA_VODY.NAZOV = NAZOV;
    
    IF (POCET = 0) THEN
      RETURN FALSE;
    END IF;
    
    RETURN TRUE;
  END EXIST_LATKA_NAZOV;

-- create latka in DB
  FUNCTION CREATE_LATKA(
      PNAZOV VARCHAR2,
      PVPLYV VARCHAR2)
    RETURN INTEGER AS
    EXIST BOOLEAN := FALSE;
  BEGIN
    EXIST := EXIST_LATKA_NAZOV(PNAZOV);
    
    IF (EXIST = FALSE) THEN
      INSERT INTO LATKA_VODY (NAZOV, VPLYV_LATKY)
      VALUES (PNAZOV, PVPLYV);
      
      RETURN 1;
    END IF;
  
    RETURN 0;
  END CREATE_LATKA;

-- udpate latka
  FUNCTION UPDATE_LATKA(
      LATKA  INTEGER,
      PNAZOV VARCHAR2,
      PVPLYV VARCHAR2)
    RETURN INTEGER AS
  EXIST BOOLEAN := FALSE;
  BEGIN
    EXIST := EXIST_LATKA(LATKA);
    
    IF (EXIST) THEN
      UPDATE 
        LATKA_VODY 
      SET
        NAZOV = PNAZOV, 
        VPLYV_LATKY = PVPLYV
      WHERE
        ID_LATKA = LATKA;
      
      RETURN 1;
    END IF;
  
    RETURN 0;
  END UPDATE_LATKA;

-- delete latka from DB
  FUNCTION DELETE_LATKA(
      LATKA INTEGER)
    RETURN INTEGER AS
  EXIST BOOLEAN := FALSE;
  BEGIN
    EXIST := EXIST_LATKA(LATKA);
    
    IF (EXIST) THEN
      DELETE ZLOZENIE_VODY_V_BAZENE
      WHERE ID_LATKY = LATKA;
      
      DELETE LATKA_VODY 
      WHERE ID_LATKA = LATKA;
      
      RETURN 1;
    END IF;
  
    RETURN 0;
  END DELETE_LATKA;

-- add latka to bazen
  FUNCTION ADD_LATKA(
      BAZEN INTEGER,
      LATKA INTEGER,
      PMNOZSTVO NUMBER)
    RETURN INTEGER AS
  EXIST BOOLEAN := FALSE;
  POCET INTEGER := 0;
  BEGIN
    EXIST := EXIST_LATKA(LATKA);
    
    IF (EXIST) THEN
      SELECT COUNT(*) INTO POCET FROM BAZEN WHERE ID_BAZEN = BAZEN;
      
      IF (POCET > 0) THEN
        INSERT INTO ZLOZENIE_VODY_V_BAZENE
        VALUES (LATKA, BAZEN, PMNOZSTVO);
  
        RETURN 1;
      END IF;
    END IF;

    RETURN 0;
  END ADD_LATKA;

-- remove latka from bazen
  FUNCTION REMOVE_LATKA(
      BAZEN INTEGER,
      LATKA INTEGER)
    RETURN INTEGER AS
  POCET INTEGER := 0;
  BEGIN
    SELECT COUNT(*) INTO POCET 
    FROM ZLOZENIE_VODY_V_BAZENE 
    WHERE ID_BAZEN = BAZEN AND ID_LATKY = LATKA;
      
    IF (POCET > 0) THEN
      DELETE ZLOZENIE_VODY_V_BAZENE
      WHERE ID_BAZEN = BAZEN AND ID_LATKY = LATKA;

      RETURN 1;
    END IF;

    RETURN 0;
  END REMOVE_LATKA;

-- TODO
  PROCEDURE GENERATE_NAVSTEVNOST(
      AQUAPARK INTEGER,
      DATUM    DATE) AS
  BEGIN
    -- TODO: Implementation required for PROCEDURE AQUAPARK_PACKAGE.GENERATE_NAVSTEVNOST
    NULL;
  END GENERATE_NAVSTEVNOST;

  FUNCTION GENERATE_NAVSTEVNIK(
      AQUAPARK INTEGER)
    RETURN INTEGER AS
  BEGIN
    -- TODO: Implementation required for FUNCTION AQUAPARK_PACKAGE.GENERATE_NAVSTEVNIK
    RETURN NULL;
  END GENERATE_NAVSTEVNIK;

END AQUAPARK_PACKAGE;
/

-- Trigger for sequence aquapark_sequence for column id_aquapark in table aquapark ---------
CREATE OR REPLACE TRIGGER ts_aquapark_aquapark_sequence BEFORE INSERT
ON aquapark FOR EACH ROW
BEGIN
  :new.id_aquapark := aquapark_sequence.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_aquapark_aquapark_sequence AFTER UPDATE OF id_aquapark
ON aquapark FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_aquapark in table aquapark as it uses sequence.');
END;
/

-- Trigger for sequence atrakcia_sequence for column id_atrakcia in table atrakcia ---------
CREATE OR REPLACE TRIGGER ts_atrakcia_atrakcia_sequence BEFORE INSERT
ON atrakcia FOR EACH ROW
BEGIN
  :new.id_atrakcia := atrakcia_sequence.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_atrakcia_atrakcia_sequence AFTER UPDATE OF id_atrakcia
ON atrakcia FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_atrakcia in table atrakcia as it uses sequence.');
END;
/

-- Trigger for sequence latka_sequence for column id_latka in table latka_vody ---------
CREATE OR REPLACE TRIGGER ts_latka_vody_latka_sequence BEFORE INSERT
ON latka_vody FOR EACH ROW
BEGIN
  :new.id_latka := latka_sequence.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_latka_vody_latka_sequence AFTER UPDATE OF id_latka
ON latka_vody FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_latka in table latka_vody as it uses sequence.');
END;
/

-- Trigger for sequence adresa_sequence for column id_adresa in table adresa ---------
CREATE OR REPLACE TRIGGER ts_adresa_adresa_sequence BEFORE INSERT
ON adresa FOR EACH ROW
BEGIN
  :new.id_adresa := adresa_sequence.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_adresa_adresa_sequence AFTER UPDATE OF id_adresa
ON adresa FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_adresa in table adresa as it uses sequence.');
END;
/

-- Trigger for sequence navstevnik_sequence for column id_navstevnik in table navstevnik ---------
CREATE OR REPLACE TRIGGER ts_navstevnik_navstevnik_seq_0 BEFORE INSERT
ON navstevnik FOR EACH ROW
BEGIN
  :new.id_navstevnik := navstevnik_sequence.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_navstevnik_navstevnik_se_0 AFTER UPDATE OF id_navstevnik
ON navstevnik FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_navstevnik in table navstevnik as it uses sequence.');
END;
/


-- Create relationships section ------------------------------------------------- 

ALTER TABLE majitel_aquapark ADD CONSTRAINT majitel_majitelia FOREIGN KEY (rod_cislo) REFERENCES majitel (rod_cislo)
/

ALTER TABLE majitel_aquapark ADD CONSTRAINT majitelia_aquapark FOREIGN KEY (id_aquapark) REFERENCES aquapark (id_aquapark)
/

ALTER TABLE bazen ADD CONSTRAINT ISA_bazen FOREIGN KEY (id_bazen) REFERENCES atrakcia (id_atrakcia)
/

ALTER TABLE tobogan ADD CONSTRAINT ISA_tobogan FOREIGN KEY (id_tobogan) REFERENCES atrakcia (id_atrakcia)
/

ALTER TABLE zlozenie_vody_v_bazene ADD CONSTRAINT ma_latky FOREIGN KEY (id_latky) REFERENCES latka_vody (id_latka)
/

ALTER TABLE zlozenie_vody_v_bazene ADD CONSTRAINT ma_zlozenie FOREIGN KEY (id_bazen) REFERENCES bazen (id_bazen)
/

ALTER TABLE cennik_aquapark_vstup ADD CONSTRAINT aquapark_ma_cennik FOREIGN KEY (id_aquapark) REFERENCES aquapark (id_aquapark)
/

ALTER TABLE obmedzenie_toboganu ADD CONSTRAINT ma_obmedzenie FOREIGN KEY (id_tobogan) REFERENCES tobogan (id_tobogan)
/

ALTER TABLE adresa ADD CONSTRAINT ma_obec FOREIGN KEY (id_obec) REFERENCES obec (id_obec)
/

ALTER TABLE aquapark ADD CONSTRAINT ma_adresu FOREIGN KEY (id_adresa) REFERENCES adresa (id_adresa)
/

ALTER TABLE max_rychlost ADD CONSTRAINT ma_max_rychlost FOREIGN KEY (id_tobogan) REFERENCES tobogan (id_tobogan)
/

ALTER TABLE aquapark_navstevnik ADD CONSTRAINT ma_navstevnost FOREIGN KEY (id_aquapark) REFERENCES aquapark (id_aquapark)
/

ALTER TABLE aquapark_navstevnik ADD CONSTRAINT navstevuje FOREIGN KEY (id_navstevnik) REFERENCES navstevnik (id_navstevnik)
/

ALTER TABLE atrakcia ADD CONSTRAINT ma_atrakcie FOREIGN KEY (id_aquapark) REFERENCES aquapark (id_aquapark)
/

ALTER TABLE navstevnik_atrakcia ADD CONSTRAINT navstevnost_atrakcie FOREIGN KEY (id_atrakcia) REFERENCES atrakcia (id_atrakcia)
/

ALTER TABLE navstevnik_atrakcia ADD CONSTRAINT vyuziva_atrakcie FOREIGN KEY (id_navstevnik) REFERENCES navstevnik (id_navstevnik)
/

ALTER TABLE cennik_atrakcia ADD CONSTRAINT atrakcia_ma_cennik FOREIGN KEY (id_atrakcia) REFERENCES atrakcia (id_atrakcia)
/


