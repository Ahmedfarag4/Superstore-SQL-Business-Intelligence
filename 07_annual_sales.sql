select d.Year, sum(f.Sales) as Total_Sales
from FactSales f
join DimDate d
    on f.Order_Date = d.Full_Date
group by d.Year
order by d.Year