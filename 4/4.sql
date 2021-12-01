use Northwind

-- 1
select O.OrderID, (select sum(UnitPrice * Quantity * (1 - Discount))
                    from [Order Details] OD
                        where O.OrderID = OD.OrderID) + O.Freight as OrderValue
from Orders O
where O.OrderID = 10250

-- 2
select O.OrderID, (select sum(UnitPrice * Quantity * (1 - Discount))
                    from [Order Details] OD
                        where O.OrderID = OD.OrderID) + O.Freight as OrderValue
from Orders O
order by OrderValue desc

-- 3
select CustomerID, Address, City, Region, PostalCode, Country
from Customers C
where not exists (select *
                    from Orders O
                    where C.CustomerID = O.CustomerID and year(OrderDate) = 1997)

-- 4
select ProductID, count(*) as DistinctCustomersCount
from (select distinct ProductID, CustomerID
        from Orders O
            inner join [Order Details] [O D]
                on O.OrderID = [O D].OrderID
        group by ProductID, CustomerID) as sub
group by ProductID
having count(*) > 1
