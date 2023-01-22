-- create new database toko
CREATE DATABASE toko;

-- create new table hakAkses
CREATE TABLE hakAkses (
    idAkses INT NOT NULL AUTO_INCREMENT,
    namaAkses VARCHAR(100) NOT NULL,
    keterangan TEXT,
    PRIMARY KEY (idAkses)
);

-- create new table pengguna
CREATE TABLE pengguna (
    idPengguna INT NOT NULL AUTO_INCREMENT,
    namaPengguna VARCHAR(100) NOT NULL,
    password VARCHAR(50) NOT NULL,
    namaDepan VARCHAR(100) NOT NULL,
    namaBelakang VARCHAR(100) NOT NULL,
    noHp VARCHAR(20) NOT NULL,
    alamat VARCHAR(255) NOT NULL,
    idAkses INT,
    PRIMARY KEY (idPengguna),
    CONSTRAINT fk_akses_pengguna FOREIGN KEY (idAkses)
    REFERENCES hakAkses(idAkses) ON UPDATE CASCADE ON DELETE CASCADE
);

-- create new table barang
CREATE TABLE barang (
    idBarang INT NOT NULL AUTO_INCREMENT,
    namaBarang VARCHAR(255) NOT NULL,
    keterangan TEXT,
    satuan VARCHAR(50),
    idPengguna INT,
    PRIMARY KEY (idBarang),
    CONSTRAINT fk_pengguna_barang FOREIGN KEY (idPengguna)
    REFERENCES pengguna(idPengguna) ON UPDATE CASCADE ON DELETE CASCADE
);

-- create new table pembelian
CREATE TABLE pembelian (
    idPembelian INT NOT NULL AUTO_INCREMENT,
    jumlahPembelian INT NOT NULL,
    hargaBeli DOUBLE NOT NULL,
    idPengguna INT,
    idBarang INT,
    PRIMARY KEY (idPembelian),
    CONSTRAINT fk_barang_pembelian FOREIGN KEY (idBarang)
    REFERENCES barang(idBarang) ON UPDATE CASCADE ON DELETE CASCADE
);

-- create new table penjualan
CREATE TABLE penjualan (
    idPenjualan INT NOT NULL AUTO_INCREMENT,
    jumlahPenjualan INT NOT NULL,
    hargaJual DOUBLE NOT NULL,
    idPengguna INT,
    idBarang INT,
    PRIMARY KEY (idPenjualan),
    CONSTRAINT fk_barang_penjualan FOREIGN KEY (idBarang)
    REFERENCES barang(idBarang) ON UPDATE CASCADE ON DELETE CASCADE
);

-- create index idPengguna for table pembelian
CREATE INDEX idx_pengguna_pembelian
ON pembelian (idPengguna);

-- create index idPengguna for table penjualan
CREATE INDEX idx_pengguna_penjualan
ON penjualan (idPengguna);

-- insert into table hakAkses
INSERT INTO hakAkses (namaAkses, keterangan)
VALUES
('Superadmin', 'All access to menu'),
('Manager', 'Access to view all data'),
('Admin Inventory', 'Manage Data Barang, Keluar Masuk Barang'),
('Admin Purchase', 'Manage pembelian dan pengadaan barang'),
('Admin Finance', 'Manage pembayaran pembelian barang'),
('Admin Akuntan', 'Manage cash flow, kredit debit, dan penjurnalan'),
('Cashier', 'Input data penjualan'),
('Supplier', 'Supply dan distribusi barang produk'),
('Customer', 'Pembeli dan pengguna barang'),
('Reseller', 'Partnership penjualan barang produk')

-- insert into table pengguna
INSERT INTO pengguna (namaPengguna, namaDepan, namaBelakang, noHp, alamat, password, idAkses)
VALUES
('administrator', 'Makmur Jaya', 'Dev', '081334457150', 'Jalan Raya No.1 Jakarta 10000', '12345678', 1),
('mngfinance', 'Finance', 'Manager', '082678558765', 'Jalan Raya No.1 Jakarta 10000', 'mngf123', 2),
('mngoperasional', 'Operational', 'Manager', '085876736445', 'Jalan Raya No.1 Jakarta 10000', 'mngo123', 2),
('mngpenjualan', 'Sales', 'Manager', '082368768789', 'Jalan Raya No.1 Jakarta 10000', 'mngp123', 2),
('mnginventory', 'Inventory', 'Manager', '083476687687', 'Jalan Raya No.1 Jakarta 10000', 'mngi123', 2),
('adminv1', 'Inventory', 'Admin 1', '087582687697', 'Jalan Raya No.1 Jakarta 10000', 'admv@114', 3),
('adminv2', 'Inventory', 'Admin 2', '081286373434', 'Jalan Raya No.1 Jakarta 10000', 'admv@115', 3),
('adminv3', 'Inventory', 'Admin 3', '083746211243', 'Jalan Raya No.1 Jakarta 10000', 'admv@116', 3),
('admfin1', 'Finance', 'Admin 1', '081889909234', 'Jalan Raya No.1 Jakarta 10000', 'adfin@113', 5),
('admfin2', 'Finance', 'Admin 2', '081223345656', 'Jalan Raya No.1 Jakarta 10000', 'adfin@114', 5),
('admpcs1', 'Purchase', 'Admin 1', '085135132688', 'Jalan Raya No.1 Jakarta 10000', 'admp@112', 4),
('admpcs2', 'Purchase', 'Admin 2', '085547568783', 'Jalan Raya No.1 Jakarta 10000', 'admp@113', 4),
('admacc1', 'Accountant', 'Admin', '081545389777', 'Jalan Raya No.1 Jakarta 10000', 'admac@111', 6),
('cashier001', 'Cashier', 'Shop 1', '081233436766', 'Jalan Raya No.1 Jakarta 10000', 'cashp111', 7),
('cashier002', 'Cashier', 'Shop 2', '081233436767', 'Jalan Raya No.1 Jakarta 10000', 'cashp112', 7),
('cashier003', 'Cashier', 'Shop 3', '081233436768', 'Jalan Raya No.1 Jakarta 10000', 'cashp113', 7),
('cashier004', 'Cashier', 'Shop 4', '081233436769', 'Jalan Raya No.1 Jakarta 10000', 'cashp114', 7),
('berkahjayasup01', 'PT Berkah Jaya', 'Supplier', '085878635237', 'Jl. Pasundan No.76, Balonggede, Kec. Regol, Kota Bandung, Jawa Barat 40251', 'suplier01123', 8),
('indahabadisup02', 'PT Indah Abadi', 'Supplier', '081135342564', 'Jl. Raya Jagakarsa No.6, RT.5/RW.2, Jagakarsa, Kec. Jagakarsa, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12610', 'suplier02123', 8),
('jayaabadisup03', 'PT Jaya Abadi', 'Supplier', '082726856672', 'Jl. Pluit Karang Indah Timur No.20, RT.7/RW.16, Pluit, Penjaringan, North Jakarta City, Jakarta 14450', 'suplier03123', 8),
('makmurabadi04', 'PT Makmur Abadi', 'Supplier', '083326556565', 'JL. Daan Mogot, Komplek Rasa Sayang Blok E-36, Pesing, Jakarta, 11460, RT.1/RW.8, Wijaya Kusuma, Grogol petamburan, West Jakarta City, Jakarta 11460', 'suplier04123', 8),
('sinarjayasup05', 'PT Sinar Jaya Abadi', 'Supplier', '081236738566', 'Ruko Permata, Jl. Raya Kby. Lama, RT.10/RW.1, Grogol Sel., Kec. Kby. Lama, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12220', 'suplier05123', 8),
('sarahmar', 'Sarah', 'Maria', '023 1669 5473', 'Gg. Honggowongso No. 89, Pangkal Pinang 16425, SumBar', 'Hqtlbn1i', 9),
('jefri09', 'Jefri', 'Dimas', '(+62) 255 3984 3256', 'Jr. Bacang No. 629, Jambi 63142, KepR', 'S94bzrXR', 9),
('wiraadevi_', 'Wira', 'Devi', '0371 0745 961', 'Psr. Pahlawan No. 947, Samarinda 49345, KalBar', 'VcF0wbfS', 9),
('fitriaajat01', 'Fitria', 'Jatmiko', '(+62) 826 1206 238', 'Gg. Sutami No. 522, Pariaman 91717, SumBar', 'n2akfZhc', 9),
('ridwanhh', 'Ridwan', 'Harjo', '(+62) 928 3607 458', 'Gg. Bahagia No. 291, Bandar Lampung 74370, Lampung', 'eqve8HBI', 10),
('hamzahdah2', 'Hamzah', 'Eman', '(+62) 858 8780 4612', 'Gg. Flora No. 553, Batam 19459, KalTim', 'jnkj878bhv', 9),
('ginadan', 'Gina', 'Damu', '0383 0100 636', 'Kpg. Madrasah No. 996, Denpasar 76675, Gorontalo', 'nRliCHHQ', 9),
('yahyaairiana', 'Iriana', 'Yahya','(+62) 819 2144 000', 'Jr. Sunaryo No. 876, Banjar 36927, Lampung', 'zugcXP2w', 10),
('julia34', 'Julia', 'Caraka', '0351 9216 895', 'Psr. Cikutra Barat No. 113, Cilegon 34466, SulBar', 'aJrTYMm8', 9),
('jessicamaria', 'Jessica', 'Mariadi', '0924 3123 207', 'Jln. Achmad Yani No. 262, Banjar 84190, DKI', 'KaUQ27uF', 9)

-- insert into table barang
INSERT INTO barang (namaBarang, keterangan, satuan, idPengguna)
VALUES
('Cat Tembok Avian Indoor',	'Warna Cat Putih 5 kg',	'kilogram (kg)', 18),
('Cat Tembok Avian Outdoor', 'Warna Cat Biru 1 kg', 'kilogram (kg)', 18),
('Cat Besi Avian', 'Warna Cat Hitam 1 kg', 'kilogram (kg)', 18),
('Semen Indonesia Semen Gresik', '50 kg', 'kilogram (kg)', 21),
('Semen Indonesia Semen Gresik', '40 kg', 'kilogram (kg)', 21),
('Asia Tile Ceramics', 'Space Gray 20 x 20 cm',	'centimeters (cm)',	22),
('Asia Tile Ceramics', 'Space Creamy 20 x 20 cm', 'centimeters (cm)', 22),
('Platinum Ceramics', 'White 60 x 60 cm', 'centimeters (cm)', 22),
('Platinum Ceramics', 'Lite Gray 60 x 60 cm', 'centimeters (cm)', 22),
('Mulia Ceramics', 'Creamy 40 x 40 cm',	'centimeters (cm)',	22),
('Pipa PVC Wavin', 'D 1.50″', 'inches (in)', 19),
('Pipa PVC Wavin', 'Aw 2.50″', 'inches (in)', 19),
('Pipa PVC Rucika',	'VU 1.50″',	'inches (in)', 19),
('Pipa PVC Pacivic', 'D 2″ 60mm', 'inches (in)', 19),
('Jabesmen gelombang', '150 x 105 cm', 'centimeters (cm)', 20),
('Asbes Harvlex', '210 x 80 x 0.35', 'centimeters (cm)', 20),
('Asbes Harvlex', '240 x 80 x 0.35', 'centimeters (cm)', 20)

-- insert into table pembelian
INSERT INTO pembelian (jumlahPembelian, hargaBeli, idPengguna, idBarang)
VALUES
(5, 125000, 11, 1),
(7, 230000, 11, 2),
(13, 70000, 11, 3),
(7, 125000, 11, 1),
(6, 70000, 12, 4),
(3, 70000, 12, 4),
(10, 55000, 12, 5),
(4, 55000, 12, 5),
(200, 50000, 12, 6),
(100, 50000, 12, 7),
(70, 70000, 11, 8),
(80, 70000, 11, 9),
(100, 65000, 12, 10),
(10, 40000, 11, 11),
(15, 80000, 11, 12),
(5, 40000, 11, 11),
(5, 100000, 12, 13),
(7, 100000, 12, 13),
(12, 50000, 11, 14),
(4, 100000, 11, 15),
(5, 100000, 11, 15),
(5, 75000, 12, 16),
(8, 75000, 12, 16),
(9, 85000, 11, 17),
(7, 85000, 11, 17)

-- insert into table penjualan
INSERT INTO penjualan (jumlahPenjualan, hargaJual, idPengguna, idBarang)
VALUES
(2, 150000, 27, 1),
(25, 59000, 27, 7),
(1, 75000, 27, 4),
(10, 70000, 24, 10),
(3, 92000, 24, 17),
(2, 83000, 25, 12),
(2, 60000, 31, 5),
(4, 104000, 29, 13),
(10, 75000, 28, 8),
(3, 81000, 30, 16),
(1, 60000, 29, 5),
(20, 55000, 23, 6),
(10, 70000, 23, 10),
(1, 75000, 23, 4),
(1, 55000, 25, 14),
(1, 235500, 24, 2),
(3, 81000, 32, 16),
(4, 74000, 32, 3),
(2, 60000, 28, 5),
(20, 55000, 28, 6),
(10, 75000, 29, 9),
(1, 150000, 31, 1),
(1, 235500, 26, 2),
(2, 92000, 24, 17),
(1, 104000, 30, 13)

-- get data penjualan each product
SELECT b.namaBarang as barang, b.keterangan as keterangan, GROUP_CONCAT(DISTINCT pj.hargaJual) as harga_jual_satuan, SUM(pj.jumlahPenjualan) as jumlah_penjualan, SUM(pj.jumlahPenjualan * pj.hargaJual) as total_penjualan
FROM penjualan as pj
JOIN barang as b
ON pj.idBarang = b.idBarang
GROUP BY pj.idBarang
ORDER BY jumlah_penjualan DESC;

-- get data pembelian each product
SELECT b.namaBarang as barang, b.keterangan as keterangan, GROUP_CONCAT(DISTINCT pb.hargaBeli) as harga_beli_satuan, SUM(pb.jumlahPembelian) as jumlah_pembelian, SUM(pb.jumlahPembelian * pb.hargaBeli) as total_pembelian
FROM pembelian as pb
JOIN barang as b
ON pb.idBarang = b.idBarang
GROUP BY pb.idBarang
ORDER BY jumlah_pembelian DESC;

-- get data rekap penjualan, pembelian, stok, dan keuntungan
SELECT 
b.idBarang, b.namaBarang as barang, b.keterangan as keterangan, 
pb.harga_beli_satuan, pb.jumlah_pembelian, pb.total_pembelian, 
pj.harga_jual_satuan, pj.jumlah_penjualan, pj.total_penjualan,
(pb.jumlah_pembelian - pj.jumlah_penjualan) as stok,
((pj.harga_jual_satuan - pb.harga_beli_satuan) * pj.jumlah_penjualan) as keuntungan
FROM barang as b
JOIN 
(
    SELECT idBarang, 
    GROUP_CONCAT(DISTINCT hargaJual) as harga_jual_satuan, 
    SUM(jumlahPenjualan) as jumlah_penjualan, 
    SUM(jumlahPenjualan * hargaJual) as total_penjualan 
    FROM penjualan 
    GROUP BY idBarang
) as pj
ON b.idBarang = pj.idBarang
JOIN 
(
    SELECT idBarang, 
    GROUP_CONCAT(DISTINCT hargaBeli) as harga_beli_satuan, 
    SUM(jumlahPembelian) as jumlah_pembelian, 
    SUM(jumlahPembelian * hargaBeli) as total_pembelian 
    FROM pembelian 
    GROUP BY idBarang
) as pb
ON b.idBarang = pb.idBarang
ORDER BY pb.jumlah_pembelian DESC, pj.jumlah_penjualan DESC;
