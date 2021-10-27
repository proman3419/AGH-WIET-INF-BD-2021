use Northwind

-- 1
select EmployeeID, year(OrderDate) as Year, month(OrderDate) as Month, count(*) as OrdersHandled
from Orders
group by EmployeeID, year(OrderDate), month(OrderDate)

-- 2
select CategoryID, min(UnitPrice) as MinUnitPrice, max(UnitPrice) as MaxUnitPrice
from Products
group by CategoryID
