SET search_path TO classicmodels, public;

--1
SELECT customernumber, 
SUM(amount) AS total_akumulasi_dana,
COUNT(DISTINCT checknumber) AS frekuensi_setoran,
MAX(amount) AS setoran_terbesar
FROM payments
GROUP BY customernumber
HAVING COUNT(DISTINCT checknumber) > 4
AND AVG(amount) > 20000;

--2
SELECT customernumber,
SUM(amount) AS total_setoran
FROM payments
GROUP BY customernumber
HAVING SUM(amount) > 80000
ORDER BY total_setoran DESC;

--3
SELECT productline,
COUNT(DISTINCT productcode) AS jumlah_produk,
ROUND(AVG(msrp), 2) AS ratarata_msrp,
STRING_AGG(productname, ', ' ORDER BY productname) AS daftar_produk FROM products
GROUP BY productline
HAVING COUNT(DISTINCT productcode) > 10;

--4
SELECT DISTINCT reportsto AS employeenumber FROM employees
WHERE reportsto IS NOT NULL
EXCEPT
SELECT employeenumber FROM employees
WHERE jobtitle LIKE '%VP'
OR jobtitle LIKE '%President%';

--5
SELECT productcode,
SUM(quantityordered) AS total_unit_terjual,
ROUND(AVG(priceeach), 2) AS ratarata_harga FROM orderdetails
WHERE priceeach > 100
GROUP BY productcode
HAVING SUM(quantityordered) > 50
ORDER BY total_unit_terjual DESC;

--6
SELECT productcode,
SUM(quantityordered) AS total_unit,
SUM(quantityordered * priceeach) AS pendapatan_kotor,
ROUND(AVG(priceeach), 2) AS ratarata_harga,
MAX(priceeach) - MIN(priceeach) AS rentang_harga FROM orderdetails
WHERE quantityordered > 20
GROUP BY productcode
HAVING SUM(quantityordered * priceeach) > 50000
ORDER BY pendapatan_kotor DESC;

--7
SELECT customernumber FROM customers
WHERE creditlimit > 80000
INTERSECT
SELECT customernumber FROM orders
WHERE status IN ('Cancelled', 'On Hold')
EXCEPT
SELECT customernumber FROM payments
GROUP BY customernumber
HAVING SUM(amount) >= 100000;