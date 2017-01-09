SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE prescription
(
	id_patient patient.id_patient%TYPE
) IS
	
BEGIN
	SELECT nom_maladie FROM maladie m, souffre s, patient p
	where 
	DBMS_OUTPUT.PUT_LINE("Valeurs sauvegardées");
END;
/
