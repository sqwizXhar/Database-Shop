CREATE OR REPLACE FUNCTION update_stock() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.count_of_purchases > (SELECT stock FROM products WHERE product_id = NEW.product_id) THEN
        RAISE EXCEPTION 'Недостаточно товара на складе';
    END IF;

    UPDATE products
    SET stock = stock - NEW.count_of_purchases
    WHERE product_id = NEW.product_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_stock_trigger
AFTER INSERT ON purchases
FOR EACH ROW
EXECUTE FUNCTION update_stock();
