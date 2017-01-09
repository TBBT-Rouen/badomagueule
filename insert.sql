INSERT INTO medecin
   VALUES (type_medecin(1, UPPER('Legens'), UPPER('Pierre'),'pied'));
INSERT INTO medecin
   VALUES (type_medecin(2, UPPER('Rubert'), UPPER('Rodolphe'),'ongle'));
INSERT INTO medecin
   VALUES (type_medecin(3, UPPER('Azizou'), UPPER('Uziza'),'cheveux'));
INSERT INTO medecin
   VALUES (type_medecin(4, UPPER('Noimia'), UPPER('Elicia'),'doigt'));
INSERT INTO medecin
   VALUES (type_medecin(5, UPPER('Lokol'), UPPER('Surio'),'nez'));
INSERT INTO medecin
   VALUES (type_medecin(6, UPPER('Kori'), UPPER('Pori'),'fesses'));

INSERT INTO patient
	VALUES (type_patient(1,'Edouard','Martin',12));
INSERT INTO patient
	VALUES (type_patient(2,'Petit','Lucas',20));
INSERT INTO patient
	VALUES (type_patient(3,'Robert','Alice',28));
INSERT INTO patient
	VALUES (type_patient(4,'Rcihard','Jade',36));
INSERT INTO patient
	VALUES (type_patient(5,'Durand','Jules',44));
INSERT INTO patient
	VALUES (type_patient(6,'Dubois','Gabin',52));
INSERT INTO patient
	VALUES (type_patient(7,'Moreau','Ambre',60));

INSERT INTO laboratoire
	VALUES (type_laboratoire(1,'Bayer','Rue de Bayer'));
INSERT INTO laboratoire
	VALUES (type_laboratoire(2,'Etoile','Rue de lEtoile'));
INSERT INTO laboratoire
	VALUES (type_laboratoire(3,'Soleil','Rue du Soleil'));

INSERT INTO medicament
	VALUES (type_medicament(1,'Piedoide'));
INSERT INTO medicament
	VALUES (type_medicament(2,'Ongloide'));
INSERT INTO medicament
	VALUES (type_medicament(3,'Cheveuxioide'));
INSERT INTO medicament
	VALUES (type_medicament(4,'Doigtoide'));
INSERT INTO medicament
	VALUES (type_medicament(5,'Nezoide'));
INSERT INTO medicament
	VALUES (type_medicament(6,'Fessoide'));

INSERT INTO indication 
	VALUES (1,'Pour les pieds');
INSERT INTO indication 
	VALUES (2,'Pour les Ongles');
INSERT INTO indication 
	VALUES (3,'Pour les Cheveux');
INSERT INTO indication 
	VALUES (4,'Pour les Doigts');
INSERT INTO indication 
	VALUES (5,'Pour le Nez');
INSERT INTO indication 
	VALUES (6,'Pourquoi');

INSERT INTO indique
	VALUES (1,1);
INSERT INTO indique
	VALUES (2,2);
INSERT INTO indique
	VALUES (3,3);
INSERT INTO indique
	VALUES (4,4);
INSERT INTO indique
	VALUES (5,5);
INSERT INTO indique
	VALUES (6,6);

INSERT INTO traitement
	VALUES (1);
INSERT INTO traitement
	VALUES (2);
INSERT INTO traitement
	VALUES (3);
INSERT INTO traitement
	VALUES (4);
INSERT INTO traitement
	VALUES (5);
INSERT INTO traitement
	VALUES (6);

INSERT INTO constitue
	VALUES (1,1);
INSERT INTO constitue
	VALUES (2,2);
INSERT INTO constitue
	VALUES (3,3);
INSERT INTO constitue
	VALUES (4,4);
INSERT INTO constitue
	VALUES (5,5);
INSERT INTO constitue
	VALUES (6,6);

INSERT INTO maladie
	VALUES (1,'Piesite');
INSERT INTO maladie
	VALUES (2,'Onglesite');
INSERT INTO maladie
	VALUES (3,'Cheveusite');
INSERT INTO maladie
	VALUES (4,'Doisite');
INSERT INTO maladie
	VALUES (5,'Nezoite');
INSERT INTO maladie
	VALUES (6,'Pkzite');

INSERT INTO souffre
	VALUES (1,1);
INSERT INTO souffre
	VALUES (2,2);
INSERT INTO souffre
	VALUES (3,3);
INSERT INTO souffre
	VALUES (4,4);
INSERT INTO souffre
	VALUES (5,5);
INSERT INTO souffre
	VALUES (6,6);

INSERT INTO necessite
	VALUES (1,1);
INSERT INTO necessite
	VALUES (2,2);
INSERT INTO necessite
	VALUES (3,3);
INSERT INTO necessite
	VALUES (4,4);
INSERT INTO necessite
	VALUES (5,5);
INSERT INTO necessite
	VALUES (6,6);

INSERT INTO developpe
	VALUES (1,1);
INSERT INTO developpe
	VALUES (2,2);
INSERT INTO developpe
	VALUES (3,3);
INSERT INTO developpe
	VALUES (4,4);
INSERT INTO developpe
	VALUES (5,5);
INSERT INTO developpe
	VALUES (6,6);

INSERT INTO travaillePour
	VALUES (1,1);
INSERT INTO travaillePour
	VALUES (2,2);
INSERT INTO travaillePour
	VALUES (3,3);
INSERT INTO travaillePour
	VALUES (4,1);
INSERT INTO travaillePour
	VALUES (5,2);
INSERT INTO travaillePour
	VALUES (6,2);

INSERT INTO consultation
	VALUES (1,NULL,1,1,1);
INSERT INTO consultation
	VALUES (2,NULL,2,2,2);
INSERT INTO consultation
	VALUES (3,NULL,3,3,3);
INSERT INTO consultation
	VALUES (4,NULL,4,4,4);
INSERT INTO consultation
	VALUES (5,NULL,5,5,5);
INSERT INTO consultation
	VALUES (6,NULL,6,6,6);

INSERT INTO substanceActive
	VALUES (1,'pium');
INSERT INTO substanceActive
	VALUES (2,'onglum');
INSERT INTO substanceActive
	VALUES (3,'chum');
INSERT INTO substanceActive
	VALUES (4,'dum');
INSERT INTO substanceActive
	VALUES (5,'num');
INSERT INTO substanceActive
	VALUES (6,'pkum');

INSERT INTO effetIndesirable
	VALUES (1,'Pied qui pue');
INSERT INTO effetIndesirable
	VALUES (2,'Ongle noire');
INSERT INTO effetIndesirable
	VALUES (3,'Cheveux gras');
INSERT INTO effetIndesirable
	VALUES (4,'Main lourd');
INSERT INTO effetIndesirable
	VALUES (5,'Nez bouché');
INSERT INTO effetIndesirable
	VALUES (6,'Hémoiroide');

INSERT INTO possede
	VALUES (1,1);
INSERT INTO possede
	VALUES (2,2);
INSERT INTO possede
	VALUES (3,3);
INSERT INTO possede
	VALUES (4,4);
INSERT INTO possede
	VALUES (5,5);
INSERT INTO possede
	VALUES (6,6);

INSERT INTO genere
	VALUES (1,1);
INSERT INTO genere
	VALUES (2,2);
INSERT INTO genere
	VALUES (3,3);
INSERT INTO genere
	VALUES (4,4);
INSERT INTO genere
	VALUES (5,5);
INSERT INTO genere
	VALUES (6,6);

INSERT INTO reactionMedicamenteuse
	VALUES (1,1,2,3);
INSERT INTO reactionMedicamenteuse
	VALUES (2,2,3,4);
INSERT INTO reactionMedicamenteuse
	VALUES (3,3,4,5);
INSERT INTO reactionMedicamenteuse
	VALUES (4,4,5,6);
INSERT INTO reactionMedicamenteuse
	VALUES (5,5,6,1);
INSERT INTO reactionMedicamenteuse
	VALUES (6,6,1,2);


