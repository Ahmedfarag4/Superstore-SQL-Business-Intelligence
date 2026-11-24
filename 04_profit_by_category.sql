select p.Category, sum(f.Profit) as Total_Profit
from FactSales f
join DimProduct p
    on f.Product_Key = p.Product_Key
group by p.Category
order by Total_Profit desc