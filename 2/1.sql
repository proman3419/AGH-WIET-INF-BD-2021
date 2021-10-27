use Northwind

-- 1
select OrderID, sum(UnitPrice * Quantity * (1 - Discount)) as OrderValue
from [Order Details]
group by OrderID
order by OrderValue desc

-- 2
select top 10 OrderID, sum(UnitPrice * Quantity * (1 - Discount)) as OrderValue
from [Order Details]
group by OrderID
order by OrderValue desc
