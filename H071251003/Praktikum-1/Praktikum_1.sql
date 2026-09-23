--SOAL 1
CREATE DATABASE db_rs_sejahtera;

CREATE TABLE poliklinik (
	id_poli SERIAL PRIMARY KEY,
	nama_poli VARCHAR(50) NOT NULL UNIQUE,
	gedung VARCHAR (50) NOT NULL
);

CREATE TABLE pasien (
	id_pasien SERIAL PRIMARY KEY,
	nik VARCHAR(16) NOT NULL UNIQUE,
	nama_pasien VARCHAR(150) NOT NULL,
	jenis_kelamin VARCHAR(1) CHECK (jenis_kelamin IN ('L', 'P'))
);

--INCASE SOMETHING'S WRONG
DROP TABLE poliklinik;
DROP TABLE pasien;
DROP TABLE dokter;
DROP TABLE rekam_medis;
DROP TABLE resep_obat;

CREATE TABLE dokter (
	id_dokter SERIAL PRIMARY KEY,
	nama_dokter VARCHAR(150) NOT NULL,
	no_izin_praktek VARCHAR(30) UNIQUE,
	pengalaman_tahun INT DEFAULT 0 CHECK (pengalaman_tahun >= 0),
	id_poli INT,
	CONSTRAINT fk_poli
		FOREIGN KEY (id_poli)
		REFERENCES poliklinik(id_poli)
);

CREATE TABLE rekam_medis (
	id_rm SERIAL PRIMARY KEY,
	keluhan TEXT NOT NULL,
	biaya_pemeriksaan DOUBLE PRECISION DEFAULT 150000,
	id_pasien INT,
	id_dokter INT,
	CONSTRAINT fk_pasien
		FOREIGN KEY (id_pasien)
		REFERENCES pasien(id_pasien),
	CONSTRAINT fk_dokter
		FOREIGN KEY (id_dokter)
		REFERENCES dokter(id_dokter)
);

CREATE TABLE resep_obat (
	id_resep SERIAL PRIMARY KEY,
	nama_obat VARCHAR(100) NOT NULL,
	jumlah INT CHECK (jumlah >= 0),
	id_rm INT,
	CONSTRAINT fk_rm
		FOREIGN KEY (id_rm)
		REFERENCES rekam_medis(id_rm)
);
--show poliklinik
SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_name= 'poliklinik';
--show pasien
SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_name= 'pasien';
--show dokter
SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_name= 'dokter';
--show rekam_medis
SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_name= 'rekam_medis';
--show resep_obat
SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_name= 'resep_obat';


--SOAL 2
ALTER TABLE pasien
ADD COLUMN gol_darah VARCHAR(2);

ALTER TABLE resep_obat
ALTER COLUMN nama_obat TYPE TEXT;

ALTER TABLE poliklinik
DROP COLUMN gedung;

--SOAL 3
DROP TABLE resep_obat;
DROP TABLE rekam_medis;

DROP DATABASE db_rs_sejahtera;