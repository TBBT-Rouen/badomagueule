SHOW ERRORS;
SET SERVEROUTPUT ON;
/* partie de drop table */

DROP TABLE medecin cascade constraint;
DROP TABLE patient cascade constraint;
DROP TABLE laboratoire cascade constraint;
DROP TABLE medicament cascade constraint;
DROP TABLE indication cascade constraint;
DROP TABLE indique cascade constraint;
DROP TABLE traitement cascade constraint;
DROP TABLE constitue cascade constraint;
DROP TABLE maladie cascade constraint;
DROP TABLE souffre cascade constraint;
DROP TABLE necessite cascade constraint;
DROP TABLE developpe cascade constraint;
DROP TABLE travaillePour cascade constraint;
DROP TABLE consultation cascade constraint;
DROP TABLE substanceActive cascade constraint;
DROP TABLE effetIndesirable cascade constraint;
DROP TABLE possede cascade constraint;
DROP TABLE genere cascade constraint;
DROP TABLE reactionMedicamenteuse cascade constraint;
DROP TYPE type_medecin;
DROP TYPE type_patient;
DROP TYPE type_laboratoire;
DROP TYPE type_medicament;
/* Création de types */

CREATE TYPE type_medecin as object 
(
	id_medecin NUMBER(2),
	nom_medecin VARCHAR2(30),
	prenom_medecin VARCHAR2(30),
	specialite VARCHAR2(30)
)
NOT FINAL;
/

CREATE TYPE type_patient as object 
(
	id_patient NUMBER(2),
	nom_patient VARCHAR2(30),
	prenom_patient VARCHAR2(20),
	age_patient NUMBER(3)
)
NOT FINAL;
/

CREATE TYPE type_laboratoire as object 
(
	id_labo NUMBER(2),
	nom_labo VARCHAR2(30),
	adresse_labo VARCHAR2(30)
)
NOT FINAL;
/

CREATE TYPE type_medicament as object 
(
	id_medicament NUMBER(2),
	libelle VARCHAR2(30)
)
NOT FINAL;
/

/* Création des tables */

CREATE TABLE medecin OF type_medecin
(
	constraint PK_tablemedecin PRIMARY KEY (id_medecin)
);

CREATE TABLE patient OF type_patient
(
	constraint PK_tablepatient PRIMARY KEY (id_patient)
);

CREATE TABLE laboratoire of type_laboratoire
(
	constraint PK_tablelaboratoire PRIMARY KEY (id_labo)
);

CREATE TABLE medicament of type_medicament
(
	constraint PK_tablemedicament PRIMARY KEY (id_medicament)
);

CREATE TABLE indication 
(
	id_indication NUMBER(2) PRIMARY KEY,
	type_indication VARCHAR2(50)
);

CREATE TABLE indique 	
(
	id_medicament NUMBER(2),
	id_indication NUMBER(2),
	constraint PK_indique PRIMARY KEY (id_indication,id_medicament),
	constraint FK_indiqueindication FOREIGN KEY (id_indication) REFERENCES indication(id_indication),
	constraint FK_indiquemedicament FOREIGN KEY (id_medicament) REFERENCES medicament(id_medicament)
);

CREATE TABLE traitement
(
	id_traitement NUMBER(2) NOT NULL PRIMARY KEY
);

CREATE TABLE constitue
(
	id_traitement NUMBER(2),
	id_medicament NUMBER(2),
	constraint PK_constitue PRIMARY KEY (id_traitement,id_medicament),
	constraint FK_constituetraitement FOREIGN KEY (id_traitement) REFERENCES traitement(id_traitement),
	constraint FK_constituemedicament FOREIGN KEY (id_medicament) REFERENCES medicament(id_medicament)
);

CREATE TABLE maladie
(
	id_maladie NUMBER(2) NOT NULL PRIMARY KEY,
	nom_maladie VARCHAR2(50)
);

CREATE TABLE souffre 
(
	id_patient NUMBER(2),
	id_maladie NUMBER(2),
	constraint PK_souffre PRIMARY KEY (id_patient,id_maladie),
	constraint FK_souffrepatient FOREIGN KEY (id_patient) REFERENCES patient(id_patient),
	constraint FK_souffremaladie FOREIGN KEY (id_maladie) REFERENCES maladie(id_maladie)
);

CREATE TABLE necessite 
(
	id_traitement NUMBER(2),
	id_maladie NUMBER(2),
	constraint PK_necessite PRIMARY KEY (id_traitement,id_maladie),
	constraint FK_necessitetraitement FOREIGN KEY (id_traitement) REFERENCES traitement(id_traitement),
	constraint FK_necessitemaladie FOREIGN KEY (id_maladie) REFERENCES maladie(id_maladie)
);

CREATE TABLE developpe
(
	id_medecin NUMBER(2),
	id_medicament NUMBER(2),
	constraint PK_developpe PRIMARY KEY (id_medecin,id_medicament),
	constraint FK_developpemedecin FOREIGN KEY (id_medecin) REFERENCES medecin(id_medecin),
	constraint FK_developpemedicament FOREIGN KEY (id_medicament) REFERENCES medicament(id_medicament)
);

CREATE TABLE travaillePour
(
	id_medecin NUMBER(2),
	id_labo NUMBER(2),
	constraint PK_travaillePour PRIMARY KEY (id_medecin,id_labo),
	constraint FK_travaillePourmedecin FOREIGN KEY (id_medecin) REFERENCES medecin(id_medecin),
	constraint FK_travaillePourlaboratoire FOREIGN KEY (id_labo) REFERENCES laboratoire(id_labo)
);

CREATE TABLE consultation
(
	id_consultation NUMBER(2) NOT NULL PRIMARY KEY,
	date_consultation DATE,
	id_medecin NUMBER(2),
	id_patient NUMBER(2),
	id_traitement NUMBER(2),
	constraint FK_consultationmedecin FOREIGN KEY (id_medecin) REFERENCES medecin(id_medecin),
	constraint FK_consultationpatient FOREIGN KEY (id_patient) REFERENCES patient(id_patient),
	constraint FK_consultationtraitement FOREIGN KEY (id_traitement) REFERENCES traitement(id_traitement)
);

CREATE TABLE substanceActive
(
	id_substance NUMBER(2) NOT NULL PRIMARY KEY,
	description_substance VARCHAR2(50)
);

CREATE TABLE effetIndesirable
(
	id_effet NUMBER(2) NOT NULL PRIMARY KEY,
	description_effet VARCHAR2(50)
);

CREATE TABLE possede
(
	id_substance NUMBER(2),
	id_medicament NUMBER(2),
	constraint PK_possede PRIMARY KEY (id_substance,id_medicament),
	constraint FK_possedesubstance FOREIGN KEY (id_substance) REFERENCES substanceActive(id_substance),
	constraint FK_possedemedicament FOREIGN KEY (id_medicament) REFERENCES medicament(id_medicament)
);

CREATE TABLE genere
(
	id_substance NUMBER(2),
	id_effet NUMBER(2),
	constraint PK_genere PRIMARY KEY (id_substance,id_effet),
	constraint FK_generesubstance FOREIGN KEY (id_substance) REFERENCES substanceActive(id_substance),
	constraint FK_genereeffet FOREIGN KEY (id_effet) REFERENCES effetIndesirable(id_effet)
);

CREATE TABLE reactionMedicamenteuse
(
	id_reaction NUMBER(2) NOT NULL PRIMARY KEY,
	id_effet NUMBER(2),
	id_medicament1 NUMBER(2),
	id_medicament2 NUMBER(2),
	constraint FK_reactionMedocEffet FOREIGN KEY (id_effet) REFERENCES effetIndesirable(id_effet),
	constraint FK_reactionMedocMedicament1 FOREIGN KEY (id_medicament1) REFERENCES medicament(id_medicament),
	constraint FK_reactionMedocMedicament2 FOREIGN KEY (id_medicament2) REFERENCES medicament(id_medicament)
);

/* Partie de création des triggers */

CREATE OR REPLACE TRIGGER nouveau_medecin
BEFORE INSERT ON medecin
FOR EACH ROW
DECLARE
	id_max NUMBER;
BEGIN
	IF (:NEW.id_medecin IS NULL) THEN
		SELECT MAX(id_medecin) INTO id_max FROM medecin;
		IF (id_max IS NULL) THEN
			:NEW.id_medecin:=1;
		ELSE
			:NEW.id_medecin:=id_max+1;
		END IF;
	END IF;
	IF (:NEW.specialite IS NULL) THEN
		:NEW.specialite:='jambe';
	END IF;
END;
/

CREATE OR REPLACE TRIGGER nouveau_patient
BEFORE INSERT ON patient
FOR EACH ROW
DECLARE
	id_max NUMBER;
BEGIN
	IF (:NEW.id_patient IS NULL) THEN
		SELECT MAX(id_patient) INTO id_max FROM patient;
		IF (id_max IS NULL) THEN
			:NEW.id_patient:=1;
		ELSE
			:NEW.id_patient:=id_max+1;
		END IF;
	END IF;
END;
/

CREATE OR REPLACE TRIGGER nouveau_medicament
BEFORE INSERT ON medicament
FOR EACH ROW
DECLARE
	id_max NUMBER;
BEGIN
	IF (:NEW.id_medicament IS NULL) THEN
		SELECT MAX(id_medicament) INTO id_max FROM medicament;
		IF (id_max IS NULL) THEN
			:NEW.id_medicament:=1;
		ELSE
			:NEW.id_medicament:=id_max+1;
		END IF;
	END IF;
END;
/

CREATE OR REPLACE TRIGGER nouveau_traitement
BEFORE INSERT ON traitement
FOR EACH ROW
DECLARE
	id_max NUMBER;
BEGIN
	IF (:NEW.id_traitement IS NULL) THEN
		SELECT MAX(id_traitement) INTO id_max FROM traitement;
		IF (id_max IS NULL) THEN
			:NEW.id_traitement:=1;
		ELSE
			:NEW.id_traitement:=id_max+1;
		END IF;
	END IF;
END;
/

CREATE OR REPLACE TRIGGER date_consult_null
BEFORE INSERT ON consultation
FOR EACH ROW
DECLARE
BEGIN
	IF (:NEW.date_consultation IS NULL) THEN
		:NEW.date_consultation:= SYSDATE;
	END IF;
END;
/

CREATE OR REPLACE TRIGGER nouvelle_maladie
BEFORE INSERT ON maladie
FOR EACH ROW
DECLARE
	id_max NUMBER;
BEGIN
	IF (:NEW.id_maladie IS NULL) THEN
		SELECT MAX(id_maladie) INTO id_max FROM maladie;
		IF (id_max IS NULL) THEN
			:NEW.id_maladie:=1;
		ELSE
			:NEW.id_maladie:=id_max+1;
		END IF;
	END IF;
END;
/

CREATE OR REPLACE TRIGGER nouveau_labo
BEFORE INSERT ON laboratoire
FOR EACH ROW
DECLARE
	id_max NUMBER;
BEGIN
	IF (:NEW.id_labo IS NULL) THEN
		SELECT MAX(id_labo) INTO id_max FROM laboratoire;
		IF (id_max IS NULL) THEN
			:NEW.id_labo:=1;
		ELSE
			:NEW.id_labo:=id_max+1;
		END IF;
	END IF;
END;
/
