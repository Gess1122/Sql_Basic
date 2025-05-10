
###################################################################################################################

                                --structures conditionnelles : ensenble d'instructions qu on execute lorsqu'une structure
                                --est verifier c'est cela une structure conditionnelle
###############################################################################################################    

/* CHAPITRE 2 : STRUCTURE CONDITIONNELLE */

----- EXO 1 : ECRIRE A L'UTILISATEUR DE SAISIR UN NOMBRE PUIS LE PROGRAMME VERIFIE SI LE PROGRAMME EST PAIRE AU IMPAIR
DECLARE
V_nombre int;
BEGIN
    v_nombre := &v_nombre;
  IF MOD(v_nombre,2) = 0 THEN 
    DBMS_OUTPUT.PUT_LINE('le nombre saisie: ' ||v_nombre|| ' est pair ');
  ELSE 
    DBMS_OUTPUT.PUT_LINE('le nombre saisie: ' ||v_nombre|| ' est impair ');
  END IF; 
END;
/

--- EXO 2 : ECRIRE UN PROGRAMME QUI DEMANDE A L'UTILISATEUR DE SAISIR UN NOMBRE ET DEMANDE S'IL EST POSITIF, NEGATIF OU NULL

DECLARE
v_nombre int;
BEGIN
    v_nombre := &v_nombre;
    IF v_nombre > 0 THEN
        DBMS_OUTPUT.PUT_LINE('le nombre: ' || v_nombre|| ' est positif');
    
    
    ELSIF v_nombre < 0 THEN
        DBMS_OUTPUT.PUT_LINE('le nombre: ' || v_nombre|| 'est negatif');
    
    ELSE 
        DBMS_OUTPUT.PUT_LINE('le nombre: ' || v_nombre|| ' est null');
    END IF;
   
 END;
/

--- EXO 3 : ECRIRE UN PROGRAMME QUI DEMANDE LE PRENOM , L'AGE ET AFFICHE LES MESSAGE SUIVANT : ENFANT SI AGE < 12, ADOLESCENT SI AGE COMPRIS ENTRE 12 ET 17 ANS SINON ADULTE

DECLARE
v_age int;
v_prenom varchar(30);
BEGIN
    v_age := &v_age;
    v_prenom := '&v_prenom';

    IF v_age < 12 THEN
        DBMS_OUTPUT.PUT_LINE(v_prenom || ' a ' ||v_age|| 'ans  alors c''est un enfant ' );
    
    
    ELSIF (v_age BETWEEN 12 AND 17) THEN
         DBMS_OUTPUT.PUT_LINE(v_prenom || ' a ' ||v_age|| ' ans alors c''est un adolescent ' );
    
    ELSE 
         DBMS_OUTPUT.PUT_LINE(v_prenom || ' a ' ||v_age|| 'ans  alors c''est un adulte ' );
    END IF;
   
 END;
/

-----ECRIRE UN PROGRAMME QUI DEMANDE SI LE MONTANT D ACHAT EST SUPERIEUR A 500 APPLIQUE UNE REDUCTION DE 10% SINON APPLIQUER UNE REDUCTION DE 5%

DECLARE
v_montant int;
v_mo int;
v_reduction int;
BEGIN
    v_montant := &v_montant;
   
    IF v_montant > 500 THEN
        v_mo := v_montant * 0.1;
        v_reduction := v_montant - v_mo;
        DBMS_OUTPUT.PUT_LINE('le montant d''achat est:' ||v_montant|| ' alors 10% de reduction a ete appliquee, ce qui fait : ' ||v_mo|| ' et apres reduction il doit payer: ' ||v_reduction);
    
    ELSIF v_montant < 500 THEN 
         v_mo := v_montant * 0.05;
         v_reduction := v_montant - v_mo;
          DBMS_OUTPUT.PUT_LINE('le montant d''achat est:' ||v_montant|| ' alors 5% de reduction a ete appliquee, ce qui fait : ' ||v_mo|| ' et apres reduction il doit payer: ' ||v_reduction);
    
    END IF;
   
 END;
/

/* EXO 5: ECRIRE UN PROGRAMME QUI  FAIT LA CLASSIFICATION DES NOTES 
0-9 : inssufisant
10-13 : passable
14-16: bien
17-20 : tres bien */


DECLARE
v_notes int;

BEGIN
    v_notes := &v_notes;
    
    IF (v_notes BETWEEN 0 AND 9) THEN
        DBMS_OUTPUT.PUT_LINE('Vous avez une moyenne de: ' ||v_notes|| ' ce qui est INSUFFISSANT pour obtenir une mention');
     
    
    ELSIF (v_notes BETWEEN 10 AND 13) THEN
        DBMS_OUTPUT.PUT_LINE('Vous avez une moyenne de: ' ||v_notes|| ' vous obtenez la mention PASSABLE');
     
    
    ELSIF (v_notes BETWEEN 14 AND 16) THEN
         DBMS_OUTPUT.PUT_LINE('Vous avez une moyenne de: ' ||v_notes|| ' vous obtenez la mention BIEN');

    ELSE 
        DBMS_OUTPUT.PUT_LINE('Vous avez une moyenne de: ' ||v_notes|| ' vous obtenez la mention TRES BIEN');
    END IF;
 END;
/