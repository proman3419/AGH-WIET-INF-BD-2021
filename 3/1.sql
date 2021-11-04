use Northwind

-- 1
select O.OrderID, sum(Quantity) as QuantitySum, CompanyName
from Orders O
    inner join [Order Details] OD
        on O.OrderID = OD.OrderID
    inner join Customers C
        on O.CustomerID = C.CustomerID
group by O.OrderID, C.CustomerID, CompanyName
having sum(Quantity) > 250 -- 2

-- 3
select O.OrderID, sum(UnitPrice * Quantity * (1 - Discount)) as OrderValue, CompanyName
from Orders O
    inner join [Order Details] OD
        on O.OrderID = OD.OrderID
    inner join Customers C
        on O.CustomerID = C.CustomerID
group by O.OrderID, C.CustomerID, CompanyName
having sum(Quantity) > 250 -- 4

-- 5
select O.OrderID, sum(UnitPrice * Quantity * (1 - Discount)) as OrderValue, CompanyName, FirstName, LastName
from Orders O
    inner join [Order Details] OD
        on O.OrderID = OD.OrderID
    inner join Customers C
        on O.CustomerID = C.CustomerID
    inner join Employees E
        on O.EmployeeID = E.EmployeeID
group by O.OrderID, C.CustomerID, CompanyName, E.EmployeeID, FirstName, LastName
having sum(Quantity) > 250
