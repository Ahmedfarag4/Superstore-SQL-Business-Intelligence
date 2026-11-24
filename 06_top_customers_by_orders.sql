select top 10
    c.Customer_Name,
    count(distinct f.Order_ID) as Total_Orders
from FactSales f
join DimCustomer c
    on f.Customer_ID = c.Customer_ID
group by c.Customer_Name
order by Total_Orders desc