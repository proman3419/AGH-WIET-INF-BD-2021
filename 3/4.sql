use Northwind

-- 1
select FirstName, LastName, sum(OD.UnitPrice * Quantity * (1 - Discount)) as OrdersValue
from Employees E
    left join Orders O
        on E.EmployeeID = O.EmployeeID
    inner join [Order Details] OD
        on O.OrderID = OD.OrderID
group by E.EmployeeID, FirstName, LastName

-- 2
select top 1 FirstName, LastName, sum(OD.UnitPrice * Quantity * (1 - Discount)) as OrdersValue
from Employees E
    left join Orders O
        on E.EmployeeID = O.EmployeeID
    inner join [Order Details] OD
        on O.OrderID = OD.OrderID
where year(OrderDate) = 1997
group by E.EmployeeID, FirstName, LastName
