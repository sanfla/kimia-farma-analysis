CREATE SCHEMA IF NOT EXISTS kimiafarma_analysis;

CREATE TABLE kimiafarma_analysis.analysis_kimiafarma AS
SELECT 
  t.transaction_id,
  t.date::DATE as date,
  t.customer_name,
  b.branch_id,
  b.kota,
  b.provinsi,
  b.rating::REAL AS rating_cabang,
  p.product_id,
  p.product_name,
  p.product_category,
  p.price::INT4 AS actual_price,

  -- Menghitung Persentase Laba Kotor
  (CASE
    WHEN p.price <= 50000 THEN 0.10
    WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
    WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
    WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
    WHEN p.price > 500000 THEN 0.30
  END)::REAL AS percentage_gross_laba,  
  
  t.discount_percentage::REAL as discount,

  -- Menghitung Net Sales (Pendapatan Bersih setelah diskon)
  p.price - (p.price * t.discount_percentage)::INT4 AS nett_sales,

  -- Menghitung Net Profit
  ((p.price * 
        CASE
            WHEN p.price <= 50000 THEN 0.10
            WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
            WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
            WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
            WHEN p.price > 500000 THEN 0.30
        END
    ) - (p.price - (p.price - (p.price * t.discount_percentage))))::INT4 AS nett_profit,
  
  t.rating::REAL AS rating_transaction

FROM kimiafarma_analysis.kf_final_transaction AS t
INNER JOIN kimiafarma_analysis.kf_kantor_cabang AS b
  ON t.branch_id = b.branch_id
INNER JOIN kimiafarma_analysis.kf_product AS p
  ON t.product_id = p.product_id;
