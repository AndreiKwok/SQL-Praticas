SELECT lr.name, ROUND(lr.omega * 1.618, 3) AS "Fator N"
FROM life_registry lr
INNER JOIN dimensions d ON lr.dimensions_id = d.id 
WHERE d.name IN ('C875', 'C774') and lr.name like 'Richard%'
ORDER BY lr.omega ASC;