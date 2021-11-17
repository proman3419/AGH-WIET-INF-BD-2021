use Northwind

-- 1
select CategoryName, sum(Quantity) as QuantitySum
from Products P
    left join [Order Details] OD
        on P.ProductID = OD.ProductID
    inner join Categories C
        on P.CategoryID = C.CategoryID
group by C.CategoryID, CategoryName
order by sum(Quantity) -- 3b

-- 2
select CategoryName, sum(OD.UnitPrice * Quantity * (1 - Discount)) as OrdersValue
from Products P
    left join [Order Details] OD
        on P.ProductID = OD.ProductID
    inner join Categories C
        on P.CategoryID = C.CategoryID
group by C.CategoryID, CategoryName
order by sum(OD.UnitPrice * Quantity * (1 - Discount)) desc -- 3a

-- 4
select O.OrderID, sum(OD.UnitPrice * Quantity * (1 - Discount) + O.Freight) as OrdersValue
from Orders O
    inner join [Order Details] OD
        on O.OrderID = OD.OrderID
group by O.OrderID
