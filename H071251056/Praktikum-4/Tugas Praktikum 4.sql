SET search_path TO classicmodels;

select customerNumber,
sum(amount) as "Total Akumulasi Dana",
count(distinct checkNumber) as "Frekuensi Setoran",
max(amount) as "Nilai Setoran Terbesar"
from Payments
group by customerNumber 
having count(distinct checkNumber) > 4 and avg(amount) > 20000;


select customerNumber, sum(amount) as "total setoran"
from Payments
group by customerNumber 
having sum(amount) > 80000 
order by "total setoran" desc;

select productLine, count(productCode) as "jumlah ragam produk",
Round(avg(MSRP), 2) as "rata rata msrp",
string_agg(productName, ', ' order by productName) as "daftar nama produk"
from Products group by productLine having count(productCode) > 10;

select reportsTO as employeeNumber
from Employees where reportsTo is not null
except
select employeeNumber
from employees where jobTitle ilike '%VP%' or jobtitle ilike '%President%';

select productCode, sum(quantityOrdered) as "total unit terjual", 
round(avg(priceEach), 2) as "rata rata harga jual"
from OrderDetails where priceEach > 100
group by productCode
having sum(quantityOrdered) > 50
order by "total unit terjual"  desc;


select productCode, 
sum(quantityOrdered) as "total unit",
sum(quantityOrdered * priceEach) as "pendapatan kotor",
round(avg(priceEach), 2) as "rata rata harga",
(max(priceEach) - min(priceEach)) as "rentang volatilitas"
from OrderDetails where quantityOrdered > 20
group by productCode
having sum(quantityOrdered * priceEach) > 50000
order by "pendapatan kotor" desc;


select customerNumber
from Customers
where creditLimit > 80000

intersect 

select customerNumber
from Orders
where status in('Cancelled', 'On Hold')

except

select customerNumber
from Payments
group by customerNumber
having sum(amount) > 100000;