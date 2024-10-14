SELECT c.name, c.surname, SUM(p.count_of_purchases * pr.price) AS sum
FROM customers c
JOIN purchases p ON c.customer_id = p.customer_id
JOIN products pr ON p.product_id = pr.product_id
GROUP BY c.customer_id, c.name, c.surname
ORDER BY sum DESC;
