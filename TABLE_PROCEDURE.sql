--- Table Client

CREATE TABLE Clients (
    id_client NUMBER PRIMARY KEY,
    nom VARCHAR (100),
    email VARCHAR (100) UNIQUE,
    telephone VARCHAR (20),
    total_achat NUMBER DEFAULT 0,
    niveau_fidelite VARCHAR (20)
);

--- Inserer les valeurs

INSERT INTO Clients(id_client, nom, email, telephone, total_achat)
VALUES (1, 'Aliou Ba', 'aliou.ba@gmail.com', '770000001', 1200000);

INSERT INTO Clients(id_client, nom, email, telephone, total_achat)
VALUES (2, 'Mariam Diop', 'mariam.diop@gmail.com', '770000002', 600000);

INSERT INTO Clients(id_client, nom, email, telephone, total_achat)
VALUES (3, 'Jean Dupont', 'jean.dupont@gmail.com', '770000003', 1500000);


--- verification

SELECT * FROM Clients;

--- creer une procedure qui va inserer un nouveau mail dans la table Clients

CREATE OR REPLACE PROCEDURE ajout_mail(
    p_idclient NUMBER,
    p_nom VARCHAR2,
    p_email VARCHAR2,
    p_telephone VARCHAR2,
    p_total_achat NUMBER DEFAULT 0
) AS V_COUNT_MAIL INTEGER;

BEGIN

    SELECT COUNT(*) INTO V_COUNT_MAIL FROM Clients WHERE email = p_email;

    IF V_COUNT_MAIL = 0 THEN
    INSERT INTO Clients(id_client, nom, email, telephone, total_achat)
    VALUES (p_idclient, p_nom, p_email, p_telephone, p_total_achat);
    COMMIT;
    ELSE
         RAISE_APPLICATION_ERROR(-20001, 'Mail existe deja');
    END IF;
END;


-- Execution de la procedure

EXECUTE AJOUT_MAIL(4, 'Gessy Gadiaga', 'gessy.gadiaga@gmail.com', '780000003', 2300000);

--- Verifions l'insertion 
SELECT * FROM CLIENTS;


/*  EXERCICE 2: Mise a jours des niveau de fidelite des clients : mettre a jour la fidelite des clients en fonction 
de leur achats cumuler. 
Si total_achat > 1000000 : OR,
Si 500000 <= total_achat <= 1000000 : ARGENT,
Si total_achat < 500000 : BRONZE */

CREATE OR REPLACE PROCEDURE mis_a_jour AS
BEGIN
    UPDATE CLIENTS 
    SET NIVEAU_FIDELITE = CASE
    WHEN TOTAL_ACHAT > 1000000 THEN 'OR'
    WHEN TOTAL_ACHAT BETWEEN 500000 AND 1000000 THEN 'ARGENT'
     WHEN TOTAL_ACHAT > 500000 THEN 'BRONZE'
    END;
    COMMIT;
END;
/

--- Verification

EXECUTE MIS_A_JOUR;
SELECT * FROM CLIENTS;

--- Table employer

CREATE TABLE Employes (
    id_employe NUMBER PRIMARY KEY,
    nom VARCHAR(100),
    date_embauche date,
    salaire_brut NUMBER,
    salaire_net NUMBER
);

--- Insertion

INSERT INTO EMPLOYES(ID_EMPLOYE, NOM, DATE_EMBAUCHE, SALAIRE_BRUT)
VALUES(1, 'Seydou Sow', TO_DATE('2015-06-10', 'YYYY-MM-DD'), 1500000);

INSERT INTO EMPLOYES(ID_EMPLOYE, NOM, DATE_EMBAUCHE, SALAIRE_BRUT)
VALUES(2, 'Fatou Ndiaye', TO_DATE('2018-09-15', 'YYYY-MM-DD'), 1000000);

INSERT INTO EMPLOYES(ID_EMPLOYE, NOM, DATE_EMBAUCHE, SALAIRE_BRUT)
VALUES(3, 'Ibrahima Kane', TO_DATE('2020-01-05', 'YYYY-MM-DD'), 800000);

--- Verification

SELECT * FROM EMPLOYES;

--- Procedure Calculer le salaire Net apres deduction d'impot

CREATE OR REPLACE PROCEDURE salaireNet AS
BEGIN
    UPDATE EMPLOYES SET
    SALAIRE_NET = SALAIRE_BRUT - (SALAIRE_BRUT * 0.2);
COMMIT;
END;
/

EXECUTE SALAIRENET;

SELECT * FROM EMPLOYES;

---------OU-------
CREATE OR REPLACE PROCEDURE SALAIRE_NET(
   p_id_employe NUMBER 
   )AS
        m_salaire_brut NUMBER;
        m_salaire_net NUMBER;
        taux_impot NUMBER := 0.20;
    BEGIN
        SELECT salaire_brut INTO m_salaire_brut FROM EMPLOYES WHERE id_employe = p_id_employe;
        m_salaire_net := m_salaire_brut * (1 - taux_impot);
        UPDATE EMPLOYES 
        SET salaire_net = m_salaire_net
        WHERE id_employe = p_id_employe;
        COMMIT;
    END;
    /

    SELECT * FROM EMPLOYES;

BEGIN
    SALAIRE_NET(3);
END;
/

---- Créer une procédure qui vérifie l'ancienneté d'un employé et affiche un message: la fonction SYSDATE

CREATE OR REPLACE PROCEDURE ancienneté(
    p_id_employe NUMBER
    
) AS
    t_nom_emp VARCHAR2 (20);
    t_anciennete NUMBER;
    BEGIN
        SELECT nom, extract(year from SYSDATE) - extract(year FROM DATE_EMBAUCHE) INTO t_nom_emp, t_anciennete 
        FROM EMPLOYES WHERE id_employe = p_id_employe;
        DBMS_OUTPUT.PUT_LINE(t_nom_emp || ' a ' ||t_anciennete|| ' ans d''anciennete');
    END;
    /

BEGIN
    ancienneté(3);
END;



