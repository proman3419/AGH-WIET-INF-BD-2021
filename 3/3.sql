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
select top 1 FirstName, LastName
from Employees E
    left join Orders O
        on E.EmployeeID = O.EmployeeID
where year(OrderDate) = 1997
group by E.EmployeeID, FirstName, LastName
order by count(*) desc
