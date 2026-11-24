go

create procedure get_yearly_kpi
    @Year int
as
begin

    select
        d.Year,
        sum(f.Sales) as Total_Sales,
        sum(f.Profit) as Total_Profit,
        sum(f.Quantity) as Total_Quantity
    from FactSales f
    join DimDate d
        on f.Order_Date = d.Full_Date
    where d.Year = @Year
    group by d.Year

end

exec get_yearly_kpi 2015