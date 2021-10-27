use Northwind

-- 1
select ProductID, sum(Quantity) as OrderQuantity
from [Order Details]
where ProductID < 3
group by ProductID

-- 2
select ProductID, sum(Quantity) as OrderQuantity
from [Order Details]
group by ProductID

-- 3
select OrderID, sum(UnitPrice * Quantity * (1 - Discount)) as OrderValue
from [Order Details]
group by OrderID
having sum(Quantity) > 250
