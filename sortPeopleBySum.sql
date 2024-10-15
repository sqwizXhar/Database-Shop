SELECT c.name, c.surname, SUM(p.count_of_purchases * pr.price) AS sum
FROM customers c
JOIN purchases p ON c.id = p.customer_id
JOIN products pr ON p.product_id = pr.id
GROUP BY c.id
ORDER BY sum DESC;
