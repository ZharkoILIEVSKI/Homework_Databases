
--select * from dbo.Products

use SEDC

--● Change Products table always to insert value 1 in price
--column if no price is provided on insert

alter table dbo.Products
add constraint
DF_Product_Price
default 1 for [Price]

--● Change Products table to prevent inserting Price that will
--more than 2x bigger then the cost price

alter table dbo.Products
with check
add constraint
CHK_Product_Price
check (Price > 2 * Cost) 

--● Change Products table to guarantee unique names across
--the products

alter table dbo.Products 
with check
add constraint UNQ_Products_Name
unique ([Name])

