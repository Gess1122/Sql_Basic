                                    --LES BOUCLES---

---Enoncer : ecrire une boucle qui affiche les nombres de 1 a 10

-- FOR : le nombre d iteration est connue
-- WHILE : le nombre d'iteration n est pas connue

DECLARE
BEGIN
        FOR i IN 1..10 LOOP
            DBMS_OUTPUT.PUT_LINE(i);
        END LOOP;
END;
/

---Enoncer : ecrire une boucle qui affiche les nombres pair entre 1 et 20

DECLARE
i INTEGER := 2;
BEGIN
    WHILE i <= 20 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
        i:= i+2;
    END LOOP;  
END;

---Enoncer : ecrire une boucle qui affiche les nombres de 1 a 10 mais quitte la boucle si le nombre atteint 6

DECLARE
i INTEGER;
BEGIN
    FOR i IN 1..10 LOOP
        IF i = 6 THEN
         EXIT;
        END IF;
         DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

--- ecrire une fonction qui retourne la somme des entiers de 1 à N

CREATE OR REPLACE FUNCTION somme (n IN INTEGER) RETURN INTEGER  IS 
s INTEGER := 0;
BEGIN
    FOR i IN 1..n LOOP
        s := s+i;
    END LOOP;
    RETURN s;
END;

SELECT somme(2) from dual;

--dual : table virtuelle, temporelle qui existe dans oracle sql

--Enoncer : creer une fonction qui prend 2 nombre et trouver leur produit

CREATE OR REPLACE FUNCTION produit (n IN INTEGER, b IN INTEGER) RETURN INTEGER  IS 
p INTEGER := 0;
BEGIN
    p:=n*b;
    RETURN p;
END;
SELECT produit(5, 5) from dual;

-----PROCEDURE

CREATE OR REPLACE PROCEDURE bienvenue AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Bonjour je suis une etudiante a ucao');
END;

BEGIN
    bienvenue;
END;

---- procedure = permet de faire une automatisation
---- procedure = 

