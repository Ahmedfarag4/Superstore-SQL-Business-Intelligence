create table DimCustomer
(
    Customer_ID nvarchar(50) primary key,
    Customer_Name nvarchar(100),
    Segment nvarchar(50)
)


insert into DimCustomer
(
    Customer_ID,
    Customer_Name,
    Segment
)
select distinct
    Customer_ID,
    Customer_Name,
    Segment
from Central_Superstore


select count(*) as Total_Customers
from DimCustomer


select Product_ID, count(distinct Product_Name) as Product_Count
from Central_Superstore
group by Product_ID
having count(distinct Product_Name) > 1



create table DimProduct
(
    Product_Key int identity(1,1) primary key,
    Product_ID nvarchar(50),
    Product_Name nvarchar(255),
    Category nvarchar(50),
    Sub_Category nvarchar(50)
)



insert into DimProduct
(
    Product_ID,
    Product_Name,
    Category,
    Sub_Category
)
select distinct
    Product_ID,
    Product_Name,
    Category,
    Sub_Category
from Central_Superstore



create table DimLocation
(
    Location_Key int identity(1,1) primary key,
    Country nvarchar(50),
    City nvarchar(100),
    State nvarchar(50),
    Postal_Code nvarchar(20),
    Region nvarchar(50)
)


insert into DimLocation
(
    Country,
    City,
    State,
    Postal_Code,
    Region
)
select distinct
    Country,
    City,
    State,
    Postal_Code,
    Region
from Central_Superstore



select count(*) as Total_Locations
from DimLocation



create table DimDate
(
    Full_Date date primary key,
    Year int,
    Month int,
    Day int
)



insert into DimDate
(
    Full_Date,
    Year,
    Month,
    Day
)
select
    Order_Date,
    year(Order_Date),
    month(Order_Date),
    day(Order_Date)
from Central_Superstore

union

select
    Ship_Date,
    year(Ship_Date),
    month(Ship_Date),
    day(Ship_Date)
from Central_Superstore


select count(*) as Total_Dates
from DimDate



create table FactSales
(
    Row_ID int primary key,
    Order_ID nvarchar(50),
    Customer_ID nvarchar(50),
    Product_Key int,
    Location_Key int,
    Order_Date date,
    Ship_Date date,
    Ship_Mode nvarchar(50),
    Sales decimal(18,3),
    Quantity int,
    Discount decimal(5,2),
    Profit decimal(18,4),

    foreign key (Customer_ID) references DimCustomer(Customer_ID),
    foreign key (Product_Key) references DimProduct(Product_Key),
    foreign key (Location_Key) references DimLocation(Location_Key),
    foreign key (Order_Date) references DimDate(Full_Date),
    foreign key (Ship_Date) references DimDate(Full_Date)
)

------------------------------------------------

insert into FactSales
(
    Row_ID,
    Order_ID,
    Customer_ID,
    Product_Key,
    Location_Key,
    Order_Date,
    Ship_Date,
    Ship_Mode,
    Sales,
    Quantity,
    Discount,
    Profit
)
select
    Central_Superstore.Row_ID,
    Central_Superstore.Order_ID,
    Central_Superstore.Customer_ID,
    p.Product_Key,
    l.Location_Key,
    Central_Superstore.Order_Date,
    Central_Superstore.Ship_Date,
    Central_Superstore.Ship_Mode,
    cast(replace(Central_Superstore.Sales, nchar(1643), '.') as decimal(18,3)),
    Central_Superstore.Quantity,
    cast(replace(Central_Superstore.Discount, nchar(1643), '.') as decimal(5,2)),
    cast(replace(Central_Superstore.Profit, nchar(1643), '.') as decimal(18,4))
from Central_Superstore 
join DimProduct p
    on Central_Superstore.Product_ID = p.Product_ID
    and Central_Superstore.Product_Name = p.Product_Name
join DimLocation l
    on Central_Superstore.Country = l.Country
    and Central_Superstore.City = l.City
    and Central_Superstore.State = l.State
    and Central_Superstore.Postal_Code = l.Postal_Code
    and Central_Superstore.Region = l.Region