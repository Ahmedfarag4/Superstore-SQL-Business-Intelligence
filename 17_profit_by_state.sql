select
    l.State,
    sum(f.Profit) as Total_Profit
from FactSales f
join DimLocation l
    on f.Location_Key = l.Location_Key
group by l.State
order by Total_Profit desc