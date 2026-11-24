select
    p.Product_Name,
    sum(f.Sales) as Total_Sales
from FactSales f
join DimProduct p
    on f.Product_Key = p.Product_Key
group by p.Product_Name
having sum(f.Sales) >
(
    select avg(Product_Sales)
    from
    (
        select sum(f2.Sales) as Product_Sales
        from FactSales f2
        group by f2.Product_Key
    ) x
)
order by Total_Sales desc