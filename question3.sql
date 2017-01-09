SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION effets_indesirables
(
	lib IN medicament.libelle%TYPE
) Return NUMBER 
IS
	nbEffet number;
BEGIN
	SELECT COUNT(ei.id_effet) Into nbEffet FROM medicament m, possede p, substanceActive sa, genere g, effetIndesirable ei
	WHERE m.id_medicament = p.id_medicament	
	AND p.id_substance = sa.id_substance
	AND sa.id_substance = g.id_substance
	AND g.id_effet = ei.id_effet
	AND m.libelle = lib;

	return nbEffet;
END;
/


