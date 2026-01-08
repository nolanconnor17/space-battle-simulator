-- 1. Add a product named "chair"
INSERT INTO products (name, price, can_be_returned)
VALUES ('chair', 44.00, false);

-- 2. Add a product named "stool"
INSERT INTO products (name, price, can_be_returned)
VALUES ('stool', 25.99, true);

-- 3. Add a product named "table"
INSERT INTO products (name, price, can_be_returned)
VALUES ('table', 124.00, false);

-- 4. Display all rows and columns
SELECT * FROM products;

-- 5. Display all product names
SELECT name
FROM products;

-- 6. Display all product names and prices
SELECT name, price
FROM products;

-- 7. Add a new product (my choice)
INSERT INTO products (name, price, can_be_returned)
VALUES ('lamp', 19.99, true);

-- 8. Display only products that can be returned
SELECT *
FROM products
WHERE can_be_returned = true;

-- 9. Display products with a price less than 44.00
SELECT *
FROM products
WHERE price < 44.00;

-- 10. Display products priced between 22.50 and 99.99
SELECT *
FROM products
WHERE price BETWEEN 22.50 AND 99.99;

-- 11. Sale: take $20 off everything
UPDATE products
SET price = price - 20;

-- 12. Remove products that now cost less than $25
DELETE FROM products
WHERE price < 25;

-- 13. Sale over: add $20 back to remaining products
UPDATE products
SET price = price + 20;

-- 14. New policy: everything is returnable
UPDATE products
SET can_be_returned = true;