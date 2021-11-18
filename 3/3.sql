use Northwind

-- 1
select CompanyName, count(*) as ShippedCount
from Orders O
    right join Shippers S
        on O.ShipVia = S.ShipperID
where year(ShippedDate) = 1997
group by CompanyName

-- 2
select top 1 CompanyName
from Orders O
    right join Shippers S
        on O.ShipVia = S.ShipperID
where year(ShippedDate) = 1997
group by CompanyName
order by count(*) desc

-- 3
select FirstName, LastName, round(sum(OD.UnitPrice * Quantity * (1 - Discount)), 2) as OrdersValue
from Employees E
    inner join Orders O
        on E.EmployeeID = O.EmployeeID
    inner join [Order Details] OD
        on O.OrderID = OD.OrderID
group by E.EmployeeID, FirstName, LastName
order by 3 desc

-- 4
select top 1 FirstName, LastName
from Employees E
    left join Orders O
        on E.EmployeeID = O.EmployeeID
where year(OrderDate) = 1997
group by E.EmployeeID, FirstName, LastName
order by count(*) desc

-- 5
select top 1 FirstName, LastName
from Employees E
    inner join Orders O
        on E.EmployeeID = O.EmployeeID
    inner join [Order Details] OD
        on O.OrderID = OD.OrderID
where year(OrderDate) = 1997
group by E.EmployeeID, FirstName, LastName
order by sum(OD.UnitPrice * Quantity * (1 - Discount)) desc
