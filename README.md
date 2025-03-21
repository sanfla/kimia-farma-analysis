# Kimia Farma Business Performance Analysis (2020-2023)

## 📌 Overview
Analisis kinerja bisnis **Kimia Farma** berdasarkan data transaksi dari tahun 2020 hingga 2023.
Proyek ini mencakup pembuatan dashboard menggunakan **Power BI** untuk memberikan wawasan mendalam tentang transaksi, pendapatan, laba bersih, dan performa cabang berdasarkan berbagai dimensi.

## 📊 Dashboard Highlights
Dashboard ini mencakup berbagai visualisasi dan metrik utama:
- **Total Category Product**: Jumlah kategori produk yang dijual.
- **Total Transaction**: Total transaksi yang terjadi.
- **Revenue**: Pendapatan yang dihasilkan.
- **Net Sales**: Total penjualan setelah diskon.
- **Net Profit**: Keuntungan bersih setelah biaya dikurangi.
- **Sum of Net Profit by Year and Month**: Grafik profit bersih berdasarkan waktu.
- **Total Transactions by Province**: Jumlah transaksi berdasarkan provinsi.
- **Sum of Actual Price by Product Name**: Harga aktual berdasarkan nama produk.
- **Total Transactions by Product Category**: Distribusi transaksi berdasarkan kategori produk.
- **Branch and Transaction Ratings**: Rating cabang dan rating transaksi berdasarkan kota.

## 📂 Project Structure
```
kimia-farma-analysis/
│── data_raw.7z                        # Dataset mentah dalam format terkompresi
│── data_ready.7z                      # Dataset yang telah diproses dalam format terkompresi
│── kimia-farma-analysis.pbit          # Template Power BI Dashboard
│── kimia-farma-analysis.sql           # Query SQL untuk analisis
│── Dashboard-Business-Performance.pdf # Dokumentasi dashboard
│── README.md                          # Dokumentasi proyek
```

## 🛠️ Tools & Technologies
- **Power BI** – Untuk visualisasi data.
- **PostgreSQL** – Untuk menyimpan dan menganalisis data transaksi.
- **DBeaver** – Untuk eksekusi query dan eksplorasi database.

## 🚀 How to Use
1. **Clone repository**
   ```bash
   git clone https://github.com/sanfla/kimia-farma-analysis.git
   ```
2. **Extract Data**
   - Ekstrak `data_raw.7z` dan `data_ready.7z` ke direktori yang diinginkan.
3. **Import Data ke PostgreSQL**
   - Gunakan `kimia-farma-analysis.sql` untuk membuat skema dan tabel yang diperlukan, lalu impor data yang telah diekstrak.
4. **Buka Dashboard di Power BI**
   - Buka file `kimia-farma-analysis.pbit` menggunakan **Power BI Desktop**.
   - Pastikan koneksi data mengarah ke database PostgreSQL yang berisi data Kimia Farma.
5. **Analisis Data**
   - Gunakan Power BI untuk memfilter data berdasarkan tahun, provinsi, atau kota.

## 📌 SQL Query Example
```sql
SELECT 
    product_category, 
    COUNT(transaction_id) AS total_transaksi 
FROM kimiafarma_analysis.analysis_data 
GROUP BY product_category 
ORDER BY total_transaksi DESC;
```

## 📈 Insights
- **Jawa Barat memiliki jumlah transaksi tertinggi**, diikuti oleh **Sumatera Utara dan Jawa Tengah**.
- **Kategori produk R06 dan M01AE memiliki kontribusi terbesar** dalam transaksi.
- **Fluktuasi net profit** terlihat pada beberapa bulan tertentu, kemungkinan karena faktor musiman atau promosi.
