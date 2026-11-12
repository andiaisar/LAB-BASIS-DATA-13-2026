SELECT * FROM prodi;

INSERT INTO mahasiswa (nim, nama, email, id_prodi)
VALUES
  ('2024001', 'Budi Santoso', 'budi@email.com', 1),
  ('2024002', 'Siti Aminah', 'siti@email.com', 5),
  ('2024003', 'Andi Pratama', NULL, 6);

SELECT * FROM mahasiswa;

--SOAL 2
UPDATE mahasiswa
SET ipk = 3.75
WHERE ipk = 3.50;

DELETE FROM mahasiswa
WHERE email IS NULL;

SELECT * FROM mahasiswa ORDER BY nim ASC;