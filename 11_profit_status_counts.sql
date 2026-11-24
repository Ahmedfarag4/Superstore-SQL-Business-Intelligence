select
    sum(case when Profit > 0 then 1 else 0 end) as Profit_Count,
    sum(case when Profit < 0 then 1 else 0 end) as Loss_Count,
    sum(case when Profit = 0 then 1 else 0 end) as Zero_Profit_Count
from FactSales