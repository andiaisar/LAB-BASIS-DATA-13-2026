--ini tuprak 3

SET search_path TO classicmodels;


select orderNumber, upper(productCode) as "kode_produk", quantityOrdered, priceEach
from orderdetails
where left(productCode, 3) = 'S18' and (quantityOrdered between 20 and 50 or priceEach < 30)
order by quantityOrdered desc;

select customerNumber, CustomerName, country, contactFirstName || ' ' || contactLastName, creditLimit,
creditLimit - 10000 as "selisih_kredit"
from customers
where country in ('USA', 'Canada', 'France')
order by creditLimit desc;

select productCode, productName, buyPrice, MSRP,
greatest(buyPrice, MSRP), least(buyPrice, MSRP)
from products where productName ilike '%car%';

select orderNumber, orderDate, shippedDate, 
extract (year from orderdate) as "tahun",
extract (month from orderdate) as "bulan",
shippedDate::date - orderdate::date as "lama pengiriman",
shippedDate - orderDate as "interval pengiriman",
current_date as "tanggal laporan",
current_time as "waktu laporan"
from orders
where shippedDate is not null;

select orderNumber, orderDate, shippedDate, orderDate + interval '10 days' as "estimasi kirim",
coalesce(shippedDate, orderDate + interval '10 days') as "tanggal aktual",
shippedDate - orderDate as "selisih waktu"
from orders
where comments ilike '%customer%' and extract(month from orderDate) between 10 and 12 
and orderNumber % 2 != 0
order by orderDate desc;