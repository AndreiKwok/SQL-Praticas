SELECT cat.name AS name, SUM(prod.amount) AS sum
FROM products prod
INNER JOIN categories cat ON prod.id_categories = cat.id
GROUP BY cat.name;