select top 10
    c.Customer_Name,
    sum(f.Sales) as Total_Sales
from FactSales f
join DimCustomer c
    on f.Customer_ID = c.Customer_ID
group by c.Customer_Name
order by Total_Sales desc