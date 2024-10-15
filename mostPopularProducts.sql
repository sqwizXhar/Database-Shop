SELECT product_name, prcount
FROM (
	SELECT product_name, SUM(p.count_of_purchases) as prcount
	FROM products pr
	JOIN purchases p ON pr.id = p.product_id
	GROUP BY product_name	
) AS prod_count
ORDER BY prcount DESC
LIMIT 3;


