SELECT product_name, pcount
FROM (
    SELECT pr.product_name, 
	SUM(p.count_of_purchases) AS pcount
	FROM products pr
	JOIN purchases p ON pr.product_id = p.product_id
	GROUP BY pr.product_id, pr.product_name
) AS pr_count
WHERE pcount = (
    SELECT MAX(pcount) FROM (
        SELECT SUM(p.count_of_purchases) AS pcount
        FROM products pr
        JOIN purchases p ON pr.product_id = p.product_id
        GROUP BY pr.product_id
    ) AS popular_product
);


