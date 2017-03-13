CREATE USER IF NOT EXISTS ROOT SALT 'd07c854331313c61' HASH 'eaa2d6e0de8234ae7d6048cf6ab546a2ffc3a84a6386506101546978665fdc2a' ADMIN;
CREATE CACHED TABLE PUBLIC.HOMESTAY(
    ID VARCHAR(20) NOT NULL,
    PEMILIK VARCHAR(20) DEFAULT NULL,
    LOKASI VARCHAR(4) DEFAULT NULL,
    JML_KAMAR INT DEFAULT NULL,
    JML_BED INT DEFAULT NULL,
    JML_WC INT DEFAULT NULL
);
ALTER TABLE PUBLIC.HOMESTAY ADD CONSTRAINT PUBLIC.CONSTRAINT_1 PRIMARY KEY(ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.HOMESTAY;
CREATE CACHED TABLE PUBLIC.EVENT(
    ID VARCHAR(10) NOT NULL,
    NAMA_EVENT VARCHAR(45) DEFAULT NULL,
    PENYELENGGARA VARCHAR(45) DEFAULT NULL,
    MULAI_EVENT DATE DEFAULT 0 NOT NULL,
    SELESAI_EVENT DATE DEFAULT 0 NOT NULL
);
ALTER TABLE PUBLIC.EVENT ADD CONSTRAINT PUBLIC.CONSTRAINT_3 PRIMARY KEY(ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.EVENT;
CREATE CACHED TABLE PUBLIC.PENGGUNA(
    USERNAME VARCHAR2(50) NOT NULL,
    PASSWORD VARCHAR2(20) NOT NULL,
    ROLE VARCHAR2(1) NOT NULL
);
ALTER TABLE PUBLIC.PENGGUNA ADD CONSTRAINT PUBLIC.CONSTRAINT_4 PRIMARY KEY(USERNAME);
-- 1 +/- SELECT COUNT(*) FROM PUBLIC.PENGGUNA;
INSERT INTO PUBLIC.PENGGUNA(USERNAME, PASSWORD, ROLE) VALUES
('admin', 'admin', 'S');
CREATE CACHED TABLE PUBLIC.PENYEWA(
    ID VARCHAR(20) NOT NULL,
    NAMA VARCHAR(45) DEFAULT '' NOT NULL,
    JNS_KELAMIN VARCHAR(1) DEFAULT 'L' NOT NULL,
    ALAMAT VARCHAR(50) DEFAULT '' NOT NULL,
    NO_TELP VARCHAR(20) DEFAULT NULL,
    JNS_MAKANAN VARCHAR(10) DEFAULT 'nonvege' NOT NULL,
    KETERANGAN VARCHAR(20) DEFAULT NULL,
    ID_HS VARCHAR(20) DEFAULT NULL,
    ID_EVT VARCHAR(10) DEFAULT NULL,
    MENGINAP BOOLEAN DEFAULT FALSE NOT NULL
);
ALTER TABLE PUBLIC.PENYEWA ADD CONSTRAINT PUBLIC.CONSTRAINT_2 PRIMARY KEY(ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.PENYEWA;
ALTER TABLE PUBLIC.PENYEWA ADD CONSTRAINT PUBLIC.ID_EVT_FK FOREIGN KEY(ID_EVT) REFERENCES PUBLIC.EVENT(ID) ON DELETE CASCADE ON UPDATE SET NULL NOCHECK;
ALTER TABLE PUBLIC.PENYEWA ADD CONSTRAINT PUBLIC.ID_HS_FK FOREIGN KEY(ID_HS) REFERENCES PUBLIC.HOMESTAY(ID) ON DELETE CASCADE ON UPDATE SET NULL NOCHECK;
