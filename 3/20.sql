use Northwind

-- 1
select Address, City, Region, PostalCode, Country
from Products P
    inner join Suppliers S
        on P.SupplierID = S.SupplierID
    inner join Categories C
        on P.CategoryID = C.CategoryID
where CategoryName = 'Meat/Poultry' and UnitPrice between 20 and 30

-- 2
select ProductName, UnitPrice, CompanyName
from Products P
    inner join Suppliers S
        on P.SupplierID = S.SupplierID
    inner join Categories C
        on P.CategoryID = C.CategoryID
where CategoryName = 'Confections'

-- 3
select distinct C.CompanyName, C.Phone
from Orders O
    inner join Customers C
        on O.CustomerID = C.CustomerID
    inner join Shippers S
        on O.ShipVia = S.ShipperID
where year(ShippedDate) = 1997 and S.CompanyName = 'United Package'

-- 4
select distinct C2.CompanyName, C2.Phone
from Orders O
    inner join [Order Details] [O D] on O.OrderID = [O D].OrderID
    inner join Products P
        on [O D].ProductID = P.ProductID
    inner join Categories C
        on P.CategoryID = C.CategoryID
    inner join Customers C2
        on C2.CustomerID = O.CustomerID
where CategoryName = 'Confections'
