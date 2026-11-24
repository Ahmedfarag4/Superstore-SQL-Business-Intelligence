create index idx_product
on FactSales(Product_Key)

create index idx_customer
on FactSales(Customer_ID)

create index idx_location
on FactSales(Location_Key)

create index idx_order_date
on FactSales(Order_Date)