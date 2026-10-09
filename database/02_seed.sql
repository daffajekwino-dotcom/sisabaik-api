BEGIN;
INSERT INTO pengguna (nama_lengkap, email, peran) VALUES
 ('Rina Putri', 'rina.penyedia@example.test', 'penyedia'),
 ('Budi Santoso', 'budi.penyedia@example.test', 'penyedia'),
 ('Siti Rahma', 'siti.pembeli@example.test', 'pembeli'),
 ('Andi Saputra', 'andi.pembeli@example.test', 'pembeli');
INSERT INTO penyedia (
    pengguna_id, nama_usaha, alamat, nomor_telepon, status_verifikasi
) VALUES
(
    (SELECT id FROM pengguna WHERE email = 'rina.penyedia@example.test'),
    'Lapau Uni Rina',
    'Jl. Merpati No. 10, Padang',
    '081200000001',
    'terverifikasi'
),
(
    (SELECT id FROM pengguna WHERE email = 'budi.penyedia@example.test'),
    'Roti Minang',
    'Jl. Sudirman No. 21, Padang',
    '081200000002',
    'terverifikasi'
);
INSERT INTO pesanan (
 pembeli_id, penyedia_id, status, total_transaksi,
 nilai_stok_terselamatkan
) VALUES
 (3, 1, 'siap-diambil', 12000, 25000);
INSERT INTO detail_pesanan (
 pesanan_id, penawaran_id, penyedia_id, kuantitas,
 harga_normal_satuan, harga_penawaran_satuan
) VALUES
 (1, 2, 1, 1, 25000, 12000);
INSERT INTO pengambilan (
 pesanan_id, kode, jadwal_pada, status
) VALUES
 (1, 'AMBIL-0001', CURRENT_TIMESTAMP + INTERVAL '2 hours', 'terjadwal');
COMMIT;