use Northwind

-- 1
select EmployeeID, count(*) as OrdersHandled
from Orders
group by EmployeeID

-- 2
select ShipVia, sum(Freight) as FreightSum
from Orders
group by ShipVia

-- 3
select ShipVia, sum(Freight) as FreightSum
from Orders
where (year(OrderDate) between 1996 and 1997) or
      (year(ShippedDate) between 1996 and 1997)
group by ShipVia
