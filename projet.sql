SHOW ERRORS;
SET SERVEROUTPUT ON;

/* partie de drop */

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

/* Création d'un type médecin */

CREATE TYPE type_medecin as object 
(
	id_medecin NUMBER(2),
	nom_medecin VARCHAR2(30),
	prenom_medecin VARCHAR2(30),
	specialite VARCHAR2(30)
)
NOT FINAL;
/

/* Création d'un type patient */

CREATE TYPE type_patient as object 
(
	id_patient NUMBER(2),
	nom_patient VARCHAR2(30),
	prenom_patient VARCHAR2(20),
	age_patient NUMBER(3)
)
NOT FINAL;
/

/* Création d'un type laboratoire */

CREATE TYPE type_laboratoire as object 
(
	id_labo NUMBER(2),
	nom_labo VARCHAR2(30),
	adresse_labo VARCHAR2(30)
)
NOT FINAL;
/

/* Création d'un type médicament */

CREATE TYPE type_medicament as object 
(
	id_medicament NUMBER(2),
	libelle VARCHAR2(30)
)
NOT FINAL;
/

/* Création des tables */

/* Création de la table médecin avec le type type_médecin avec comme clé primaire id_medecin */

CREATE TABLE medecin OF type_medecin
(
	constraint PK_tablemedecin PRIMARY KEY (id_medecin)
);

/* Création de la table patient avec le type type_patient avec comme clé primaire id_patient */

CREATE TABLE patient OF type_patient
(
	constraint PK_tablepatient PRIMARY KEY (id_patient)
);

/* Création de la table laboratoire avec le type type_laboratoire avec comme clé primaire id_labo */

CREATE TABLE laboratoire of type_laboratoire
(
	constraint PK_tablelaboratoire PRIMARY KEY (id_labo)
);

/* Création de la table médicament avec le type type_medicament avec comme clé primaire id_medicament */

CREATE TABLE medicament of type_medicament
(
	constraint PK_tablemedicament PRIMARY KEY (id_medicament)
);

/* Création de la table indication avec comme clé primaire id_indication */

CREATE TABLE indication 
(
	id_indication NUMBER(2) PRIMARY KEY,
	type_indication VARCHAR2(50)
);

/* 
Création de la table indique avec : 
- clé primaire : le couple (id_indication,id_medicament)
- clé étrangère : id_indication de la table indication et id_medicament de la table medicament
*/

CREATE TABLE indique 	
(
	id_medicament NUMBER(2),
	id_indication NUMBER(2),
	constraint PK_indique PRIMARY KEY (id_indication,id_medicament),
	constraint FK_indiqueindication FOREIGN KEY (id_indication) REFERENCES indication(id_indication),
	constraint FK_indiquemedicament FOREIGN KEY (id_medicament) REFERENCES medicament(id_medicament)
);

/* Création de la table traitement avec comme clé primaire id_traitement */

CREATE TABLE traitement
(
	id_traitement NUMBER(2) NOT NULL PRIMARY KEY
);

/* 
Création de la table constitue avec : 
- clé primaire : le couple (id_traitement,id_medicament)
- clé étrangère : id_traitement de la table traitement et id_medicament de la table medicament
*/

CREATE TABLE constitue
(
	id_traitement NUMBER(2),
	id_medicament NUMBER(2),
	constraint PK_constitue PRIMARY KEY (id_traitement,id_medicament),
	constraint FK_constituetraitement FOREIGN KEY (id_traitement) REFERENCES traitement(id_traitement),
	constraint FK_constituemedicament FOREIGN KEY (id_medicament) REFERENCES medicament(id_medicament)
);

/* Création de la table maladie avec comme clé primaire id_maladie */

CREATE TABLE maladie
(
	id_maladie NUMBER(2) NOT NULL PRIMARY KEY,
	nom_maladie VARCHAR2(50)
);

/* 
Création de la table souffre avec : 
- clé primaire : le couple (id_patient,id_maladie)
- clé étrangère : id_patient de la table patient et id_maladie de la table maladie
*/

CREATE TABLE souffre 
(
	id_patient NUMBER(2),
	id_maladie NUMBER(2),
	constraint PK_souffre PRIMARY KEY (id_patient,id_maladie),
	constraint FK_souffrepatient FOREIGN KEY (id_patient) REFERENCES patient(id_patient),
	constraint FK_souffremaladie FOREIGN KEY (id_maladie) REFERENCES maladie(id_maladie)
);

/* 
Création de la table necessite avec : 
- clé primaire : le couple (id_traitement,id_maladie)
- clé étrangère : id_traitement de la table traitement et id_maladie de la table maladie
*/

CREATE TABLE necessite 
(
	id_traitement NUMBER(2),
	id_maladie NUMBER(2),
	constraint PK_necessite PRIMARY KEY (id_traitement,id_maladie),
	constraint FK_necessitetraitement FOREIGN KEY (id_traitement) REFERENCES traitement(id_traitement),
	constraint FK_necessitemaladie FOREIGN KEY (id_maladie) REFERENCES maladie(id_maladie)
);

/* 
Création de la table developpe avec : 
- clé primaire : le couple (id_medecin,id_medicament)
- clé étrangère : id_medecin de la table medecin et id_medicament de la table medicament
*/

CREATE TABLE developpe
(
	id_medecin NUMBER(2),
	id_medicament NUMBER(2),
	constraint PK_developpe PRIMARY KEY (id_medecin,id_medicament),
	constraint FK_developpemedecin FOREIGN KEY (id_medecin) REFERENCES medecin(id_medecin),
	constraint FK_developpemedicament FOREIGN KEY (id_medicament) REFERENCES medicament(id_medicament)
);

/* 
Création de la table travaillePour avec : 
- clé primaire : le couple (id_medecin,id_labo)
- clé étrangère : id_medecin de la table medecin et id_labo de la table laboratoire
*/

CREATE TABLE travaillePour
(
	id_medecin NUMBER(2),
	id_labo NUMBER(2),
	constraint PK_travaillePour PRIMARY KEY (id_medecin,id_labo),
	constraint FK_travaillePourmedecin FOREIGN KEY (id_medecin) REFERENCES medecin(id_medecin),
	constraint FK_travaillePourlaboratoire FOREIGN KEY (id_labo) REFERENCES laboratoire(id_labo)
);

/* 
Création de la table indique avec : 
- clé primaire : id_consultation
- clé étrangère : id_medecin de la table medecin, id_patient de la table patient et id_traitement de la table traitement
*/

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

/* Création de la table substanceActive avec comme clé primaire id_substance */

CREATE TABLE substanceActive
(
	id_substance NUMBER(2) NOT NULL PRIMARY KEY,
	description_substance VARCHAR2(50)
);

/* Création de la table effetIndesirable avec comme clé primaire id_effet */

CREATE TABLE effetIndesirable
(
	id_effet NUMBER(2) NOT NULL PRIMARY KEY,
	description_effet VARCHAR2(50)
);

/* 
Création de la table possede avec : 
- clé primaire : le couple (id_substance,id_medicament)
- clé étrangère : id_substance de la table substanceActive, id_medicament de la table medicament
*/

CREATE TABLE possede
(
	id_substance NUMBER(2),
	id_medicament NUMBER(2),
	constraint PK_possede PRIMARY KEY (id_substance,id_medicament),
	constraint FK_possedesubstance FOREIGN KEY (id_substance) REFERENCES substanceActive(id_substance),
	constraint FK_possedemedicament FOREIGN KEY (id_medicament) REFERENCES medicament(id_medicament)
);

/* 
Création de la table genere avec : 
- clé primaire : le couple (id_substance,id_effet)
- clé étrangère : id_substance de la table substanceActive, id_effet de la table effetIndesirable
*/

CREATE TABLE genere
(
	id_substance NUMBER(2),
	id_effet NUMBER(2),
	constraint PK_genere PRIMARY KEY (id_substance,id_effet),
	constraint FK_generesubstance FOREIGN KEY (id_substance) REFERENCES substanceActive(id_substance),
	constraint FK_genereeffet FOREIGN KEY (id_effet) REFERENCES effetIndesirable(id_effet)
);

/* 
Création de la table indique avec : 
- clé primaire : id_reaction
- clé étrangère : id_effet de la table effetIndesirable, id_medicament1 de la table medicament et id_medicament2 de la table medicament
*/

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
