SHOW ERRORS;
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE getTraitements(idPatient number) IS 
BEGIN
	FOR ligne
	IN (SELECT * FROM patient INNER JOIN souffre ON patient.id_patient=souffre.id_patient INNER JOIN 
maladie ON souffre.id_maladie=maladie.id_maladie INNER JOIN necessite ON maladie.id_maladie=necessite.id_maladie
INNER JOIN traitement ON necessite.id_traitement=traitement.id_traitement where patient.id_patient=idPatient)
	LOOP
		dbms_output.put_line(ligne,ligne);	
	END LOOP;
END; 
/