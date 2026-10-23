INSERT INTO prodi (nama_prodi)
VALUES ('Sistem Informasi')
RETURNING *;

SELECT * FROM prodi;
-- nomor 1
INSERT INTO mahasiswa
    (nim, nama, email, id_prodi)
VALUES
    ('MHS001', 'Amel', 'amelia@gmail.com', 1),
    ('MHS002', 'Dylan', 'lan@gmail.com', 1),
    ('MHS003', 'Karis', NULL, 1)
RETURNING *;

UPDATE mahasiswa
SET ipk = 3.50
WHERE ipk = 5.5;

SELECT * FROM mahasiswa;
-- nomor 2
UPDATE mahasiswa
SET ipk = 3.75
WHERE ipk = 3.50
RETURNING *;

DELETE FROM mahasiswa
WHERE email IS NULL
RETURNING *;

SELECT * FROM mahasiswa;