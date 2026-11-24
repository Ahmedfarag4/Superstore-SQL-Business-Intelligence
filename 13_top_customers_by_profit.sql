go

with CustomerProfit as
(
    select
        c.Customer_Name,
        sum(f.Profit) as Total_Profit
    from FactSales f
    join DimCustomer c
        on f.Customer_ID = c.Customer_ID
    group by c.Customer_Name
)

select top 10
    Customer_Name,
    Total_Profit
from CustomerProfit
order by Total_Profit desc