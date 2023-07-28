use data_scientist;

INSERT INTO eleve 
VALUES (1, 'David', 'Bowie', '1947-01-08', 6);

SELECT nom,prenom FROM data_scientist.eleve;

INSERT INTO eleve (nom, prenom, date_naissance, classe_id)
VALUES ('Elton', 'John', '1947-03-25', 6),
('Cartman', 'Eric', '1989-07-01', 7),
('Norton', 'Edward', '1959-08-18',5),
('Nicks', 'Stevie', '1948-05-26', 4),
('Kilmister', 'Lemmy', '1945-12-24',3);

ALTER TABLE eleve 
CHANGE date_Naissance date_naissance DATE NOT NULL;

DESCRIBE eleve;

UPDATE eleve
SET nom= 'Bowie', prenom= 'David'
WHERE nom like 'David';

SELECT nom, prenom, date_naissance FROM data_scientist.eleve ORDER BY date_naissance ASC;

UPDATE eleve
SET nom = 'John', prenom='Elton'
WHERE nom like 'Elton';