------------ EXAMEN DE PL/SQL

--------- REPONDRE AUX QUESTIONS

----  Exécutez les tables suivantes


CREATE TABLE employes (
    id_employe NUMBER PRIMARY KEY,
    nom VARCHAR2(50),
    poste VARCHAR2(50),
    salaire NUMBER
);

CREATE TABLE produits (
    id_produit NUMBER PRIMARY KEY,
    nom_produit VARCHAR2(50),
    prix NUMBER,
    stock NUMBER
);

CREATE TABLE clients (
    id_client NUMBER PRIMARY KEY,
    nom_client VARCHAR2(50),
    ville VARCHAR2(50)
);

-- 2) Insérez les données dans chaque table

INSERT INTO employes VALUES (1, 'Alice', 'Manager', 4500);
INSERT INTO employes VALUES (2, 'Bob', 'Vendeur', 3000);
INSERT INTO employes VALUES (3, 'Charlie', 'Technicien', 3500);

INSERT INTO produits VALUES (101, 'Laptop', 700, 20);
INSERT INTO produits VALUES (102, 'Imprimante', 150, 50);
INSERT INTO produits VALUES (103, 'Scanner', 100, 15);

INSERT INTO clients VALUES (1001, 'Société X', 'Dakar');
INSERT INTO clients VALUES (1002, 'Entreprise Y', 'Thiès');
INSERT INTO clients VALUES (1003, 'Client Z', 'Kaolack');

COMMIT;

select * FROM CLIENTS;
select * from EMPLOYES;
SELECT * FROM PRODUITS;

--- EXERCICE 1 : Créer une fonction `salaire_annuel` qui prend un id_employé et retourne son salaire annuel.

CREATE OR REPLACE FUNCTION salaire_annuel(p_id NUMBER) RETURN NUMBER IS
p_salaire NUMBER;
p_salaire_annuel NUMBER;
BEGIN
    SELECT salaire INTO  p_salaire FROM EMPLOYES WHERE id_employe = p_id;
    p_salaire_annuel := p_salaire * 12;
   RETURN p_salaire_annuel;
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('Le salaire annuel est de ' ||SALAIRE_ANNUEL(1));
END;
/
--SELECT SALAIRE_ANNUEL(3)as salaireAnnuel FROM dual;



--- Exercice 2 : Créer une fonction `produit_en_rupture` qui retourne le nombre total de produits avec un stock inférieur à 10.
 
 CREATE OR REPLACE FUNCTION produit_en_rupture RETURN NUMBER is
 nbre_produit NUMBER;
BEGIN
    SELECT COUNT(*) INTO nbre_produit FROM PRODUITS WHERE STOCK < 10;
    RETURN nbre_produit;
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('Le nombre totale de produits avec un stocks inferieur a 10 est de ' ||PRODUIT_EN_RUPTURE);
END;
/



--- Exercice 3 : Créer une fonction `nombre_clients_par_ville` qui prend une ville en paramètre et retourne le nombre de clients dans cette ville.

CREATE OR REPLACE FUNCTION nombre_clients_par_ville(p_ville VARCHAR2) RETURN NUMBER IS
nbre_client_ville NUMBER;
BEGIN
    SELECT COUNT(*) INTO nbre_client_ville FROM CLIENTS WHERE ville = p_ville;
RETURN nbre_client_ville;
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('Le nombre de clients habitant dans la ville de est de ' ||NOMBRE_CLIENTS_PAR_VILLE('Dakar'));
END;
/

