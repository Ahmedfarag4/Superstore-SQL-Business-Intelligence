select Category, sum(Sales) as Total_Sales
from FactSales f
join DimProduct p
    on f.Product_Key = p.Product_Key
group by Category