select top 10
    p.Product_Name,
    sum(f.Profit) as Total_Profit
from FactSales f
join DimProduct p
    on f.Product_Key = p.Product_Key
group by p.Product_Name
order by Total_Profit desc