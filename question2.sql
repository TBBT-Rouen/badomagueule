SHOW ERRORS;
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE getTraitements(idPatient number) IS 
BEGIN
	FOR ligne
	IN (SELECT * FROM patient INNER JOIN souffre ON patient.id_patient=souffre.id_patient INNER JOIN 
maladie ON souffre.id_maladie=maladie.id_maladie INNER JOIN necessite ON maladie.id_maladie=necessite.id_maladie
INNER JOIN traitement ON necessite.id_traitement=traitement.id_traitement INNER JOIN constitue ON traitement.id_traitement=constitue.id_traitement INNER JOIN medicament ON constitue.id_medicament=medicament.id_medicament where patient.id_patient=idPatient)
	LOOP
		dbms_output.put_line(ligne.libelle);	
	END LOOP;
END; 
/
