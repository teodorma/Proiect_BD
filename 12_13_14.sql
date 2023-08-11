/*   12   */
/*Subcereri sincronizate în care intervin cel puțin 3 tabele
Sa se afișeze toate informațiile despre produsele care au fost într o comanda cu plata peste 100.*/

SELECT *
FROM Produse
WHERE produs_id IN (
    SELECT produs_id
    FROM Obiecte_livrare
    WHERE comanda_id IN (
        SELECT comanda_id
        FROM Comanda
        WHERE comanda_id in(
    		SELECT comanda_id
    		FROM Plata
    		WHERE suma > 100
        )
    )
);


/*Ordonări și utilizarea funcțiilor NVL și DECODE
Sa se afișeze numele produsului, produs_id, magazin_id și cantitatea pentru toate produsele din toate magazinele și sa se afiseze dacă acestea sunt disponibile sau nu.*/

SELECT p.numele_produsului, p.produs_id, magazin_id, NVL(s.cantitate, 0) AS cantitate_stoc,
       DECODE(s.cantitate, NULL, 'Indisponibil', 'Disponibil') AS status_stoc
FROM Produse p
LEFT JOIN Stocuri s ON p.produs_id = s.produs_id
ORDER BY cantitate_stoc DESC;


/*Subcereri nesincronizate în clauza FROM și grupări de date cu funcții de grup și filtrare la nivel de grupuri
Sa se afișeze numele și prenumele, numărul de plăți și suma totală a plăților pentru clienții cu suma totală a plăților peste 300.*/

SELECT concat(concat(ic.nume, ' '), ic.prenume) as nume_client, COUNT(p.suma) AS numar_plati, SUM(p.suma) suma_totala 
FROM Cont c
LEFT JOIN Info_cont ic ON c.client_id = ic.client_id
LEFT JOIN Comanda co ON c.cont_id = co.cont_id
LEFT JOIN Plata p ON co.comanda_id = p.comanda_id
GROUP BY ic.nume, ic.prenume
HAVING COUNT(p.suma) >= 2 AND SUM(p.suma) > 300;



/*Utilizarea a cel puțin 2 funcții pe șiruri de caractere, 2 funcții pe date calendaristice, a cel puțin unei expresii CASE
Pentru fiecare comanda sa se afiseze adresa clientului, inițialele acestuia, data în care a fost efectuata plata, vârsta clientului și statusul acesteia.*/


SELECT
  SUBSTR(ic.adresa_client, 1, 10) AS adresa_client,
  UPPER(SUBSTR(ic.nume, 1, 1) || '.' || SUBSTR(ic.prenume, 1, 1)) AS initiale_client,
  CONCAT('Data plata: ', TO_CHAR(p.data_plata, 'DD-MON-YYYY')) AS data_plata_formatata,
  CONCAT('Total plata: ', p.suma) AS total_plata,
  CASE
    WHEN co.status = 'In procesare' THEN 'Comanda in procesare'
    WHEN co.status = 'Finalizata' THEN 'Comanda finalizata'
    ELSE 'Status necunoscut'
  END AS status_comanda
FROM
  Cont c
  JOIN Info_cont ic ON ic.client_id = c.client_id
  JOIN Comanda co ON co.cont_id = c.cont_id
  JOIN Plata p ON co.comanda_id = p.comanda_id;




/*Utilizarea blocului de cerere (clauza WITH):
Sa se afișeze numele produsului și cantitatea pentru toate livrările efectuate.*/


WITH Produse_Livrare AS (
  SELECT ol.produs_id, SUM(ol.cantitate) AS Cantitate_Totala
  FROM Obiecte_livrare ol
  GROUP BY ol.produs_id
)
SELECT pr.numele_produsului, pl.Cantitate_Totala
FROM Produse pr
JOIN Produse_Livrare pl ON pr.produs_id = pl.produs_id
WHERE pl.Cantitate_Totala > (SELECT AVG(Cantitate_Totala) FROM Produse_Livrare);



/*   13.  */
/*Să se crească cu 1234 maximul salariilor care încep cu “S” și “G”.*/
 
update jobs 
set max_salariu = max_salariu + 100 
where nume_job in (select nume_job
            	from jobs
            	where nume_job like 'S%' or nume_job like 'G%');


	
/*Să se ștearga din tabela Furnizor furnizorii care au o adresa care începe cu numărul 1 2 sau 3 și numele cu ‘B’.*/

delete from Furnizor
where adresa_furnizor in(select adresa_furnizor from Furnizor
	where adresa_furnizor like '1%' or adresa_furnizor like '2%' or adresa_furnizor like '3%')
and nume_furnizor in (select nume_furnizor from Furnizor
	where nume_furnizor like 'B%');




/*Să se transforme adresa de email a angajatilor într-o adresa de muncă pentru angajații născuți înainte de anul 1992(se va înlocui ‘example’ cu ‘storemail’)*/


update Angajat 
set email = replace(email,'@example','@storemail')
where angajat_id  in (select angajat_id 
    			from Angajat 
    			where data_nasterii < '1-jan-1992'); 



/*    14   */
/*Sa se afișeze numele produsului, furnizorul, categoria, și review-ul acestuia.*/


select Produse.numele_produsului, Furnizor.nume_furnizor, Categories.nume_categorie, Review_produs.descriere
FROM Produse, Furnizor,Categories, Review_produs
where  Produse.produs_id(+) = Review_produs.produs_id and 
Categories.categorii_id(+) = Produse.categorii_id and 
Furnizor.furnizor_id(+) =  Produse.furnizor_id; 



/*Sa se afișeze id-ul comenzilor care sunt livrate de companii care încep cu litera ‘R’.*/

SELECT DISTINCT comanda_id
FROM Livrare a
WHERE NOT EXISTS(SELECT 1
    			FROM Curierat p
    			WHERE numele_companiei like 'R%'
    			AND NOT EXISTS
    				(SELECT'x'Comanda
    				FROM Livrare b 
    				WHERE p.curierat_id = b.curierat_id
    				AND b.comanda_id = a.comanda_id));



/*Să se selecteze numele, prenumele, id-ul angajatului, adresa de email și data nașterii ai primilor 3 angajați ordonați după data_nasterii.*/

SELECT ROWNUM as RANK, nume, prenume, angajat_id, email, data_nasterii
FROM (SELECT nume, prenume, angajat_id, email, data_nasterii
      FROM Angajat
      ORDER BY data_nasterii)
WHERE ROWNUM <= 3;
