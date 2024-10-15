CREATE OR REPLACE FUNCTION check_and_update_stock() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.count_of_purchases > (SELECT stock FROM products WHERE id = NEW.product_id FOR UPDATE) THEN
        RAISE EXCEPTION 'Недостаточно товара на складе';
    END IF;
    UPDATE products
    SET stock = stock - NEW.count_of_purchases
    WHERE id = NEW.product_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_and_update_stock_trigger
BEFORE INSERT ON purchases
FOR EACH ROW
EXECUTE FUNCTION check_and_update_stock();
