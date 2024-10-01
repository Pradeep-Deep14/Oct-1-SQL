CREATE TABLE npv (
    id INT,
    year INT,
    npv DECIMAL(10, 2)
);

INSERT INTO npv (id, year, npv)
VALUES 
(1, 2018, 100),
(7, 2020, 30),
(13, 2019, 40),
(1, 2019, 113),
(2, 2008, 121),
(3, 2009, 12),
(11, 2020, 99),
(7, 2019, 0); 

CREATE TABLE queries (
    id INT,
    year INT
);

INSERT INTO queries (id, year) VALUES
(1, 2019),
(2, 2008),
(3, 2009),
(7, 2018),
(7, 2019),
(7, 2020),
(13, 2019);


SELECT * FROM NPV
SELECT * FROM QUERIES


--APPROACH 1

SELECT q.*, COALESCE(NULLIF(n.npv, 0),0) AS NPV
FROM QUERIES q
LEFT JOIN NPV n
ON q.id=n.id
AND q.year=n.year


--APPROACH 2

SELECT A.id,
	   A.year,
       CASE 
         WHEN npv1 IS NOT NULL THEN npv1
         ELSE 0
       END AS npv
FROM (
    SELECT q.*, n.npv AS npv1
    FROM QUERIES AS q
    LEFT JOIN NPV AS n
    ON q.id = n.id
    AND q.year = n.year
) AS A;




