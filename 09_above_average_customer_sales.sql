select
    c.Customer_Name,
    sum(f.Sales) as Total_Sales
from FactSales f
join DimCustomer c
    on f.Customer_ID = c.Customer_ID
group by c.Customer_Name
having sum(f.Sales) >
(
    select avg(Customer_Sales)
    from
    (
        select sum(Sales) as Customer_Sales
        from FactSales
        group by Customer_ID
    ) x
)
order by Total_Sales desc