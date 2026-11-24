select
    d.Year,
    d.Month,
    sum(f.Sales) as Total_Sales
from FactSales f
join DimDate d
    on f.Order_Date = d.Full_Date
group by d.Year, d.Month
order by d.Year, d.Month