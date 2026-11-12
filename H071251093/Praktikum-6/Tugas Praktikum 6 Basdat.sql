set search_path to classicmodels;

--1
SELECT productCode AS kode_produk,
productName AS nama_produk,
MSRP AS harga_jual,
quantityInStock AS jumlah_stok,
CASE
WHEN msrp < 50 AND quantityinStock > 500 THEN 'Ekonomis Stok Tinggi'
WHEN msrp < 50 AND quantityinStock <= 500 THEN 'Ekonomis Stok Rendah'
WHEN msrp BETWEEN 50 AND 100 THEN 'Harga Menengah'
WHEN msrp > 10 THEN 'Harga Premium'
END AS kategori
FROM products
ORDER BY MSRP DESC;

-- 2
SELECT productCode AS kode_produk,
SUM(quantityOrdered) AS total_unit_terjual,
COUNT(DISTINCT orderNumber) AS jumlah_pesanan_berbeda
FROM orderdetails
GROUP BY productCode
HAVING
    SUM(quantityOrdered) > (
        SELECT AVG(quantityOrdered)
        FROM orderdetails
    )
    AND COUNT(DISTINCT orderNumber) > 10
ORDER BY total_unit_terjual DESC;

--3
SELECT productCode AS kode_produk,
productName AS nama_produk,
quantityInStock AS jumlah_stok,
msrp AS harga_jual
FROM products
WHERE
    quantityInStock > (
        SELECT AVG(quantityInStock)
        FROM products
    )
    AND msrp > (
        SELECT AVG(msrp)
        FROM products
    )
ORDER BY quantityInStock DESC;

--4
BEGIN;
UPDATE classicmodels.orders
SET status = 'Pengiriman'
WHERE orderNumber = 10100;
SAVEPOINT status_pengiriman;
UPDATE classicmodels.orders
SET status = 'Batal'
WHERE orderNumber = 10100;
ROLLBACK TO SAVEPOINT status_pengiriman;
COMMIT;


-- nomor 5
-- tabel anggota
CREATE TABLE anggota (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nama_anggota VARCHAR(50) NOT NULL,
    kota_domisili VARCHAR(20) NOT NULL
);

-- tabel buku
CREATE TABLE buku (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    judul_buku VARCHAR(100) NOT NULL,
    genre VARCHAR(20) NOT NULL,
    stok INT DEFAULT 1
);

-- tabel peminjaman
CREATE TABLE peminjaman (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_anggota INT REFERENCES anggota(id),
    id_buku INT REFERENCES buku(id),
    tanggal_pinjam DATE NOT NULL,
    tanggal_kembali DATE,
    denda INT DEFAULT 0
);

-- membuat index pada kolom genre tabel buku
CREATE INDEX idx_buku_genre
ON buku(genre);

-- kota domisili tabel anggota
CREATE INDEX idx_anggota_kota_domisili
ON anggota(kota_domisili);