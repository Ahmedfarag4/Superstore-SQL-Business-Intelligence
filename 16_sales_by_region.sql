select
    l.Region,
    sum(f.Sales) as Total_Sales
from FactSales f
join DimLocation l
    on f.Location_Key = l.Location_Key
group by l.Region
order by Total_Sales desc