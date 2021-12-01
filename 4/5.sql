use Northwind

-- 1
select E.EmployeeID, FirstName, LastName, sum(OrderValueWithFreight) as OrdersValueWithFreight
from Employees E
    inner join (select O.EmployeeID,
                    (select sum(UnitPrice * Quantity * (1 - Discount))
                        from [Order Details] OD
                        where OD.OrderID = O.OrderID) + O.Freight as OrderValueWithFreight
                from Orders O) as sub
    on E.EmployeeID = sub.EmployeeID
group by E.EmployeeID, FirstName, LastName
order by 4 desc

-- 2
select top 1 E.EmployeeID, FirstName, LastName
from Employees E
    inner join (select O.EmployeeID,
                    (select sum(UnitPrice * Quantity * (1 - Discount))
                        from [Order Details] OD
                        where OD.OrderID = O.OrderID and year(O.OrderDate) = 1997) + O.Freight as OrderValueWithFreight
                from Orders O) as sub
    on E.EmployeeID = sub.EmployeeID
group by E.EmployeeID, FirstName, LastName
order by sum(OrderValueWithFreight) desc

-- 3a
select E.EmployeeID, FirstName, LastName, sum(OrderValueWithFreight) as OrdersValueWithFreight
from Employees E
    inner join (select O.EmployeeID,
                    (select sum(UnitPrice * Quantity * (1 - Discount))
                        from [Order Details] OD
                        where OD.OrderID = O.OrderID) + O.Freight as OrderValueWithFreight
                from Orders O) as sub
    on E.EmployeeID = sub.EmployeeID
    where exists (select distinct E2.ReportsTo
                    from Employees E2
                    where E.EmployeeID = E2.ReportsTo and E2.ReportsTo is not null)
group by E.EmployeeID, FirstName, LastName
order by 4 desc

-- 3b
select E.EmployeeID, FirstName, LastName, sum(OrderValueWithFreight) as OrdersValueWithFreight
from Employees E
    inner join (select O.EmployeeID,
                    (select sum(UnitPrice * Quantity * (1 - Discount))
                        from [Order Details] OD
                        where OD.OrderID = O.OrderID) + O.Freight as OrderValueWithFreight
                from Orders O) as sub
    on E.EmployeeID = sub.EmployeeID
    where E.EmployeeID not in (select distinct E2.ReportsTo
                                from Employees E2
                                where E2.ReportsTo is not null)
group by E.EmployeeID, FirstName, LastName
order by 4 desc

-- 4a
select E.EmployeeID, FirstName, LastName, sum(OrderValueWithFreight) as OrdersValueWithFreight,
       (select max(OrderDate) from Orders O where O.EmployeeID = E.EmployeeID) as LatestOrder
from Employees E
    inner join (select O.EmployeeID,
                    (select sum(UnitPrice * Quantity * (1 - Discount))
                        from [Order Details] OD
                        where OD.OrderID = O.OrderID) + O.Freight as OrderValueWithFreight
                from Orders O) as sub
    on E.EmployeeID = sub.EmployeeID
    where exists (select distinct E2.ReportsTo
                    from Employees E2
                    where E.EmployeeID = E2.ReportsTo and E2.ReportsTo is not null)
group by E.EmployeeID, FirstName, LastName
order by 4 desc

-- 4b
select E.EmployeeID, FirstName, LastName, sum(OrderValueWithFreight) as OrdersValueWithFreight,
       (select max(OrderDate) from Orders O where O.EmployeeID = E.EmployeeID) as LatestOrder
from Employees E
    inner join (select O.EmployeeID,
                    (select sum(UnitPrice * Quantity * (1 - Discount))
                        from [Order Details] OD
                        where OD.OrderID = O.OrderID) + O.Freight as OrderValueWithFreight
                from Orders O) as sub
    on E.EmployeeID = sub.EmployeeID
    where E.EmployeeID not in (select distinct E2.ReportsTo
                                from Employees E2
                                where E2.ReportsTo is not null)
group by E.EmployeeID, FirstName, LastName
order by 4 desc
