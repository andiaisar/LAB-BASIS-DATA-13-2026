SET search_path TO classicmodels;

SELECT c.contactFirstName, c.customerName, o.city, CONCAT(e.firstName, ' ', e.lastName) AS sales_rep_name
FROM customers c
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices o ON e.officeCode = o.officeCode
WHERE c.contactFirstName ILIKE 'A%' AND o.city <> 'NYC'
ORDER BY c.customerName ASC;

SELECT c.customerName, SUM(p.amount) AS total_payment, MAX(p.amount) AS max_single_payment
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber, c.customerName
HAVING SUM(p.amount) > 50000
ORDER BY total_payment DESC;

SELECT c.customerName, COUNT(DISTINCT o.orderNumber) AS total_order, ROUND(CAST(AVG(od.quantityOrdered) AS numeric), 2) AS avg_quantity_per_order
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY c.customerNumber, c.customerName
HAVING COUNT(DISTINCT o.orderNumber) > 3 AND AVG(od.quantityOrdered) > 35
ORDER BY total_order DESC, avg_quantity_per_order DESC;

SELECT p.productLine, SUM(od.quantityOrdered) AS total_terjual, ROUND(CAST(AVG(od.priceEach) AS numeric), 2) AS rata_rata_harga, ROUND(CAST(AVG(((p.MSRP - od.priceEach) / p.MSRP) * 100) AS numeric), 2) AS avg_discount_percentage
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productLine
HAVING SUM(od.quantityOrdered) > 3000 AND AVG(od.priceEach) > 80
ORDER BY total_terjual DESC;

SELECT c.customerName, SUM(od.quantityOrdered * od.priceEach) AS total_transaksi, COUNT(DISTINCT CASE WHEN o.status = 'Shipped' THEN o.orderNumber END) AS total_shipped_orders, ROUND(CAST(SUM(od.quantityOrdered * od.priceEach) / COUNT(DISTINCT o.orderNumber) AS numeric), 2) AS avg_transaction_per_order
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY c.customerNumber, c.customerName
HAVING COUNT(DISTINCT EXTRACT(YEAR FROM o.orderDate)) > 1
ORDER BY total_transaksi DESC
LIMIT 5;

SELECT c.customerName, c.city AS customer_city, ofc.city AS office_city, SUM(od.quantityOrdered) AS total_unit_terjual, ROUND(CAST(SUM(od.quantityOrdered * od.priceEach) / COUNT(DISTINCT o.orderNumber) AS numeric), 2) AS avg_nilai_per_order
FROM customers c
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices ofc ON e.officeCode = ofc.officeCode
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
WHERE ofc.territory = 'EMEA'
GROUP BY c.customerNumber, c.customerName, c.city, ofc.city
HAVING COUNT(DISTINCT EXTRACT(YEAR FROM o.orderDate)) > 2 AND SUM(od.quantityOrdered) > 1000 AND (SUM(od.quantityOrdered * od.priceEach) / COUNT(DISTINCT o.orderNumber)) > 10000
ORDER BY avg_nilai_per_order DESC;