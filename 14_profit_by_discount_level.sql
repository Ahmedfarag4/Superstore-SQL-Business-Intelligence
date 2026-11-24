select
    case
        when Discount = 0 then 'No Discount'
        when Discount <= 0.2 then 'Low Discount'
        when Discount <= 0.5 then 'Medium Discount'
        else 'High Discount'
    end as Discount_Level,
    sum(Profit) as Total_Profit
from FactSales
group by
    case
        when Discount = 0 then 'No Discount'
        when Discount <= 0.2 then 'Low Discount'
        when Discount <= 0.5 then 'Medium Discount'
        else 'High Discount'
    end
order by Total_Profit desc