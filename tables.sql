CREATE TABLE products (
	product_id SERIAL NOT NULL PRIMARY KEY, 
	product_name VARCHAR(100) NOT NULL, 
	price DECIMAL(10, 2) NOT NULL,
	stock INT NOT NUll
);

CREATE TABLE customers (
	customer_id SERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(20) NOT NULL, 
	surname VARCHAR(50) NOT NULL,
	phone_number VARCHAR(18) NOT NULL
);

CREATE TABLE purchases (
	purchase_id SERIAL NOT NULL PRIMARY KEY,	
	customer_id BIGINT REFERENCES customers(customer_id), 
	product_id BIGINT REFERENCES products(product_id),
	purchase_date TIMESTAMP NOT NULL,
	count_of_purchases INT NOT NULL
);

INSERT INTO products (product_name, price, stock) 
VALUES
	('Milk', 60, 100), 
	('Coca-Cola', 100.99, 200),
	('Keybord ARDOR GAMING Guardian', 8000, 10),
	('Bread', 30, 50),
	('Laptop', 10000.99, 50),
	('Headphones', 6000, 200),
	('Camera', 30000, 30);

INSERT INTO customers (name, surname, phone_number)
VALUES
	('Dmitry', 'Smirnov', '+7 (920) 012-23-21'),
	('Sofia', 'Belyaeva', '+7 (940) 890-12-50'),
	('Nikita', 'Petrov', '+7 (980) 602-33-11'),
	('Polina', 'Kozlova', '+7 (920) 102-40-02'),
	('Ulyana', 'Yakovlevna', '+7 (890) 222-39-01');

INSERT INTO purchases (customer_id, product_id, purchase_date, count_of_purchases)
VALUES
	(1, 1, '2024-01-15 10:00:00', 2),
	(1, 2, '2024-01-16 11:30:00', 10),
	(2, 3, '2024-01-17 14:45:00', 1),
	(2, 4, '2024-01-18 09:15:00', 2),
	(3, 6, '2024-01-19 16:00:00', 1),
	(3, 7, '2024-01-20 12:30:00', 1),
	(4, 5, '2024-01-21 15:20:00', 3),
	(4, 1, '2024-01-22 08:50:00', 2),
	(4, 2, '2024-01-23 14:10:00', 100),
	(5, 5, '2024-01-24 19:55:00', 2);
	
