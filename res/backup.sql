CREATE USER IF NOT EXISTS ROOT SALT '2af49c32db0eda41' HASH '737fae86d8c96f1b6776bc68264de35e4faf8f5eb3ce0bd150f7cf6d351acf6b' ADMIN;
CREATE CACHED TABLE PUBLIC.HOMESTAY(
ID VARCHAR(20) NOT NULL,
PEMILIK VARCHAR(20) DEFAULT NULL,
LOKASI VARCHAR(4) DEFAULT NULL,
JML_KAMAR INT DEFAULT NULL,
JML_BED INT DEFAULT NULL,
JML_WC INT DEFAULT NULL,
STATUS VARCHAR(15) DEFAULT NULL
);
ALTER TABLE PUBLIC.HOMESTAY ADD CONSTRAINT PUBLIC.CONSTRAINT_1 PRIMARY KEY(ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.HOMESTAY;
CREATE CACHED TABLE PUBLIC.EVENT(
ID VARCHAR(10) NOT NULL,
NAMA_EVENT VARCHAR(45) DEFAULT NULL,
PENYELENGGARA VARCHAR(45) DEFAULT NULL,
MULAI_EVENT DATE DEFAULT NULL,
SELESAI_EVENT DATE DEFAULT NULL
);
ALTER TABLE PUBLIC.EVENT ADD CONSTRAINT PUBLIC.CONSTRAINT_3 PRIMARY KEY(ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.EVENT;
CREATE CACHED TABLE PUBLIC.PENGGUNA(
USERNAME VARCHAR(50) NOT NULL,
PASSWORD VARCHAR(20) DEFAULT NULL,
ROLE VARCHAR(1) DEFAULT NULL
);
ALTER TABLE PUBLIC.PENGGUNA ADD CONSTRAINT PUBLIC.CONSTRAINT_4 PRIMARY KEY(USERNAME);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.PENGGUNA;
CREATE CACHED TABLE PUBLIC.PENYEWA(
ID VARCHAR(20) NOT NULL,
NAMA VARCHAR(45) DEFAULT NULL,
JNS_KELAMIN VARCHAR(1) DEFAULT NULL,
ALAMAT VARCHAR(50) DEFAULT NULL,
NO_TELP VARCHAR(20) DEFAULT NULL,
JNS_MAKANAN VARCHAR(10) DEFAULT NULL,
KETERANGAN VARCHAR(20) DEFAULT NULL
);
ALTER TABLE PUBLIC.PENYEWA ADD CONSTRAINT PUBLIC.CONSTRAINT_2 PRIMARY KEY(ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.PENYEWA;
CREATE CACHED TABLE PUBLIC.TRANSAKSI(
ID_PENYEWA VARCHAR(20) NOT NULL,
ID_HS VARCHAR(20) DEFAULT NULL,
ID_EVENT VARCHAR(10) NOT NULL
);
ALTER TABLE PUBLIC.TRANSAKSI ADD CONSTRAINT PUBLIC.CONSTRAINT_E PRIMARY KEY(ID_PENYEWA, ID_EVENT);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TRANSAKSI;
ALTER TABLE PUBLIC.TRANSAKSI ADD CONSTRAINT PUBLIC.FK_ID_EVENT FOREIGN KEY(ID_EVENT) REFERENCES PUBLIC.EVENT(ID) ON DELETE CASCADE ON UPDATE CASCADE NOCHECK;
ALTER TABLE PUBLIC.TRANSAKSI ADD CONSTRAINT PUBLIC.FK_ID_HS FOREIGN KEY(ID_HS) REFERENCES PUBLIC.HOMESTAY(ID) ON DELETE CASCADE ON UPDATE CASCADE NOCHECK;
ALTER TABLE PUBLIC.TRANSAKSI ADD CONSTRAINT PUBLIC.FK_ID_PENYEWA FOREIGN KEY(ID_PENYEWA) REFERENCES PUBLIC.PENYEWA(ID) ON DELETE CASCADE ON UPDATE CASCADE NOCHECK;
