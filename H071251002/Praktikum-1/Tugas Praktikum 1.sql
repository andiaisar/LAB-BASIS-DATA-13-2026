-- NOMOR 1
CREATE TABLE poliklinik(
	id_poli SERIAL PRIMARY KEY,
	nama_poli VARCHAR (50) NOT NULL UNIQUE,
	gedung VARCHAR (50) NOT NULL
);

-- SELECT column_name, data_type
-- FROM information_schema.columns
-- WHERE table_name = 'poliklinik';

CREATE TABLE pasien(
	id_pasien SERIAL PRIMARY KEY,
	nik VARCHAR (16) NOT NULL UNIQUE,
	nama_pasien VARCHAR (150) NOT NULL,
	jenis_kelamin CHAR (1) CHECK (jenis_kelamin ='P' or jenis_kelamin='L')
);

CREATE TABLE doktor(
	id_dokter SERIAL PRIMARY KEY,
	nama_dokter VARCHAR(150) NOT NULL,
	no_izin_praktek VARCHAR(30) UNIQUE,
	pengalaman_tahun INT CHECK (pengalaman_tahun>=0) DEFAULT 0,
	id_poli SERIAL,
	
	CONSTRAINT fk_doktor_poliklinik
		FOREIGN KEY (id_poli)
		REFERENCES poliklinik (id_poli)
);

CREATE TABLE rekam_medis(
	id_rm SERIAL PRIMARY KEY,
	keluhan TEXT NOT NULL,
	biaya_pemeriksaan DOUBLE PRECISION DEFAULT 150000,
	id_pasien INT,
	id_dokter INT,
	
	CONSTRAINT fk_rekam_medis_pasien
		FOREIGN KEY (id_pasien)
		REFERENCES pasien (id_pasien),
	CONSTRAINT fk_rekam_medis_dokter
		FOREIGN KEY (id_dokter)
		REFERENCES doktor (id_dokter)
);

CREATE TABLE resep_obat(
	id_resep SERIAL PRIMARY KEY,
	nama_obat VARCHAR (100) NOT NULL,
	jumlah INT CHECK (jumlah >0),
	id_rm INT,
	
	CONSTRAINT fk_resep_obat_rekam_medis
		FOREIGN KEY (id_rm)
		REFERENCES rekam_medis (id_rm)
);

-- NOMOR 2

ALTER TABLE pasien 
ADD COLUMN gol_darah VARCHAR (2);

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'pasien';

ALTER TABLE resep_obat
ALTER COLUMN nama_obat TYPE TEXT;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'resep_obat';

ALTER TABLE poliklinik
DROP COLUMN gedung;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'poliklinik';

-- NOMOR 3
DROP TABLE resep_obat;
DROP TABLE rekam_medis;



