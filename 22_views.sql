go

create view vw_KPI_Summary
as

select
    sum(Sales) as Total_Sales,
    sum(Profit) as Total_Profit,
    sum(Quantity) as Total_Quantity,
    avg(Discount) as Average_Discount
from FactSales

select *
from vw_KPI_Summary

go

create view vw_Category_Performance
as

select
    p.Category,
    sum(f.Sales) as Total_Sales,
    sum(f.Profit) as Total_Profit,
    sum(f.Quantity) as Total_Quantity
from FactSales f
join DimProduct p
    on f.Product_Key = p.Product_Key
group by p.Category