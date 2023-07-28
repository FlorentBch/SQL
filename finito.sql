select * from ventes;
select * from ticket;
select * from article;
select * from couleur;
select * from type;
select * from pays;
select * from continent;
select * from fabricant;
select * from marque;


select numero_ticket from beer.ventes where id_article ="500";

SELECT numero_ticket, date_vente FROM beer.ticket WHERE date_vente = "2014-01-15"; 

SELECT numero_ticket, date_vente FROM beer.ticket WHERE date_vente = "2014-01-15" OR DATE_VENTE = "2014-01-17";

SELECT beer.ventes.QUANTITE, beer.article.NOM_ARTICLE from beer.ventes
INNER JOIN beer.article
ON beer.ventes.ID_ARTICLE = beer.article.ID_ARTICLE
WHERE beer.ventes.QUANTITE >= 50;

SELECT ticket.NUMERO_TICKET, DATE_VENTE from beer.ticket 
WHERE DATE_VENTE LIKE '%2014-03%';

SELECT ticket.NUMERO_TICKET, DATE_VENTE from beer.ticket 
WHERE DATE_VENTE >= '2014-03-01' and DATE_VENTE <= '2014-04-30';

SELECT ticket.NUMERO_TICKET, DATE_VENTE from beer.ticket 
WHERE DATE_VENTE LIKE '%2014-03%' OR DATE_VENTE LIKE '%2014-06%';

SELECT *
    FROM ticket
    WHERE ANNEE = 2014
    AND MONTH(DATE_VENTE) IN(3,6);

SELECT article.ID_ARTICLE, article.NOM_ARTICLE
FROM article
INNER JOIN beer.couleur
ON article.ID_COULEUR = couleur.ID_COULEUR
ORDER BY article.ID_COULEUR ASC;

SELECT article.ID_ARTICLE, article.NOM_ARTICLE
FROM article
LEFT JOIN beer.couleur
ON couleur.ID_COULEUR = article.ID_COULEUR
WHERE article.ID_Couleur is null
ORDER BY article.ID_COULEUR ASC;

SELECT SUM(ventes.QUANTITE), NUMERO_TICKET
FROM beer.ventes
GROUP BY ventes.NUMERO_TICKET;

SELECT NUMERO_TICKET, SUM(ventes.QUANTITE)
FROM beer.ventes
GROUP BY ventes.NUMERO_TICKET
HAVING SUM(ventes.QUANTITE) > 500
ORDER BY SUM(ventes.QUANTITE) asc;

SELECT NUMERO_TICKET, SUM(ventes.QUANTITE)
FROM beer.ventes
WHERE QUANTITE < 50
GROUP BY ventes.NUMERO_TICKET
HAVING SUM(ventes.QUANTITE) > 500
ORDER BY SUM(ventes.QUANTITE) asc;

SELECT article.ID_ARTICLE, article.ID_TYPE, article.VOLUME, article.NOM_ARTICLE, article.titrage
FROM article
INNER JOIN beer.type
ON article.ID_TYPE = beer.type.ID_TYPE
WHERE article.ID_TYPE = 13;

/*14*/
SELECT NOM_MARQUE 
FROM marque
INNER JOIN pays
ON marque.ID_PAYS = pays.ID_PAYS
WHERE pays.ID_CONTINENT = 1;

/*15*/
SELECT DISTINCT NOM_ARTICLE 
FROM article
INNER JOIN marque
ON marque.ID_MARQUE = article.ID_MARQUE
INNER JOIN pays
on pays.ID_PAYS = marque.ID_PAYS
WHERE pays.ID_CONTINENT = 1;

/*16*/
SELECT ANNEE, ventes.NUMERO_TICKET, SUM(ventes.QUANTITE * article.PRIX_ACHAT) *1.15 AS Montant_total_payé
FROM ventes
INNER JOIN article
ON article.ID_ARTICLE = ventes.ID_ARTICLE
GROUP BY ANNEE , ventes.NUMERO_ticket;

/*17*/
SELECT ROUND(SUM(ventes.QUANTITE*article.PRIX_ACHAT),2), ANNEE
FROM ventes
INNER JOIN article
	ON article.ID_ARTICLE = ventes.ID_ARTICLE
group by ANNEE;

/*18*/
SELECT SUM(ventes.QUANTITE) AS QT, article.NOM_ARTICLE, ARTICLE.ID_ARTICLE
FROM ventes
INNER JOIN article
	ON article.ID_ARTICLE = ventes.ID_ARTICLE
WHERE ANNEE = '2016'
GROUP BY NOM_ARTICLE, ARTICLE.ID_ARTICLE;

/*19*/
SELECT SUM(ventes.QUANTITE) AS QT, article.NOM_ARTICLE, ARTICLE.ID_ARTICLE, ANNEE
FROM ventes
INNER JOIN article
	ON article.ID_ARTICLE = ventes.ID_ARTICLE
WHERE ANNEE in (2014,2015,2016)
GROUP BY NOM_ARTICLE, ARTICLE.ID_ARTICLE, ANNEE;

/*20*/
SELECT ID_ARTICLE, NOM_ARTICLE
FROM article
WHERE (SELECT SUM(QUANTITE)
	FROM ventes
    WHERE ID_ARTICLE = article.ID_ARTICLE AND ANNEE = 2014) IS NULL;
    
/*21*/
SELECT nom_pays
FROM PAYS
WHERE ID_PAYS in  (
	SELECT ID_PAYS
    FROM marque
    WHERE ID_MARQUE in (
		SELECT ID_MARQUE
        FROM article
        WHERE ID_TYPE in (
			SELECT ID_TYPE
            FROM type
            WHERE ID_TYPE = 13)));

/*22*/
SELECT DISTINCT NUMERO_TICKET, ANNEE
FROM ventes
WHERE ID_ARTICLE IN (
	SELECT ID_ARTICLE
    FROM VENTES
    WHERE NUMERO_TICKET LIKE '856' AND ANNEE LIKE '2014');

/*23*/

/*24*/

/*25*/
SELECT ID_FABRICANT, NM_FABRICANT




