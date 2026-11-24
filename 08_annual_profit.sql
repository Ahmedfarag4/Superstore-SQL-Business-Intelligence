select d.Year, sum(f.Profit) as Total_Profit
from FactSales f
join DimDate d
    on f.Order_Date = d.Full_Date
group by d.Year
order by d.Year