SET search_path TO classicmodels;
-- nomor 3
SELECT
  customerNumber AS "Nomor Pelanggan",
  customerName   AS "Nama Pelanggan",
  phone          AS "Telepon",
  country        AS "Negara"
FROM customers;
-- nomor 4
SELECT productCode, productName, buyPrice
FROM products
WHERE buyPrice > 50
ORDER BY buyPrice DESC
LIMIT 7;
-- nomor 5
SELECT DISTINCT country AS "Negara Pelanggan"
FROM customers
ORDER BY country ASC
LIMIT 5 OFFSET 5;


SELECT customername, contactlastname, contactfirstname, phone
FROM customers
WHERE country = 'USA'
ORDER BY customername ASC;