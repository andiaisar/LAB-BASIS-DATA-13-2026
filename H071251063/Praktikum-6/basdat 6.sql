SET SEARCH_PATH to classicmodels;

--NOMOR 1
SELECT productcode, productname, MSRP, quantityinstock,
	CASE
		WHEN MSRP < 50 AND quantityinstock > 500 THEN 'Ekonomis - Stock Tinggi'
		WHEN MSRP < 50 AND quantityinstock <= 500 THEN 'Ekonomis - Stock Rendah'
		WHEN MSRP BETWEEN 50 AND 100 THEN 'Harga Menengah'
		ELSE 'Harga Premium'
	END AS kategori
FROM products
ORDER BY MSRP DESC;

--NOMOR 2
SELECT SUM(quantityordered) AS "Total Unit Terjual", COUNT(DISTINCT ordernumber) AS "Jumlah Pesanan"
FROM orderdetails
GROUP BY productcode
HAVING SUM(quantityordered) > (SELECT AVG(quantityordered) FROM orderdetails) AND COUNT(DISTINCT ordernumber) > 10
ORDER BY "Total Unit Terjual" DESC;

--NOMOR 3
SELECT productcode, productname, quantityinstock, MSRP
FROM products
WHERE quantityinstock > (SELECT AVG(quantityinstock) FROM products) AND MSRP > (SELECT AVG(MSRP) FROM products)
ORDER BY quantityinstock DESC;

--NOMOR 4
BEGIN;

UPDATE orders
SET status = 'Pengiriman'
WHERE ordernumber = 10100;

SAVEPOINT "Status Pengiriman";

UPDATE orders
SET status = 'Batal'
WHERE ordernumber = 10100;

ROLLBACK TO SAVEPOINT "Status Pengiriman";

COMMIT;

--NOMOR 5
CREATE TABLE anggota (
	id SERIAL PRIMARY KEY,
	nama_anggota VARCHAR(50) NOT NULL,
	kota_domisili VARCHAR(20) NOT NULL
);

CREATE TABLE buku (
	id SERIAL PRIMARY KEY,
	judul_buku VARCHAR(100) NOT NULL,
	genre VARCHAR(20) NOT NULL,
	stok INTEGER DEFAULT 1
);

CREATE TABLE peminjaman (
	id SERIAL PRIMARY KEY,
	id_anggota INTEGER REFERENCES anggota(id),
	id_buku INTEGER REFERENCES buku(id),
	tanggal_pinjam DATE NOT NULL,
	tanggal_kembali DATE,
	denda INTEGER DEFAULT 0
);

CREATE INDEX idx_buku_genre ON buku(genre);
CREATE INDEX idx_anggota_kota_domisili ON anggota(kota_domisili);
