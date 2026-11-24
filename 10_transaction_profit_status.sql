select top 20
    Row_ID,
    Sales,
    Profit,
    case
        when Profit > 0 then 'Profit'
        when Profit < 0 then 'Loss'
        else 'No Profit No Loss'
    end as Profit_Status
from FactSales