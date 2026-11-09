INSERT INTO mahasiswa (nim, nama, email, id_prodi)
VALUES 
    ('H071241001', 'Apel', 'apel@mail.com', (SELECT id_prodi FROM prodi LIMIT 1)),
    ('H071241002', 'Mangga', NULL, (SELECT id_prodi FROM prodi LIMIT 1)),
    ('H071241003', 'Jeruk', 'jeruk@mail.com', (SELECT id_prodi FROM prodi LIMIT 1))
RETURNING *;

UPDATE mahasiswa
SET ipk = 3.75
WHERE ipk = 3.50
RETURNING *;

DELETE FROM mahasiswa
WHERE email IS NULL
RETURNING *;

SELECT 
    customerNumber AS "Nomor Pelanggan",
    customerName AS "Nama Pelanggan",
    phone AS "Telepon",
    country AS "Negara"
FROM customers;

SELECT 
    productCode,
    productName,
    buyPrice
FROM products
WHERE buyPrice > 50
ORDER BY buyPrice DESC
LIMIT 7;

SELECT DISTINCT 
    country AS "Negara Pelanggan"
FROM customers
ORDER BY "Negara Pelanggan" ASC
LIMIT 5 OFFSET 5;