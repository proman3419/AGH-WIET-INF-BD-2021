use Northwind

-- 1
-- nie ma rekordów dla zamówienia 1025, wybrałem inne
select (select round(sum([O D].UnitPrice * Quantity * (1 - Discount)), 2)
        from Orders O
            inner join [Order Details] [O D]
                on O.OrderID = [O D].OrderID
        where O.OrderID = 11077) - Freight as OrderValue
from Orders
where OrderID = 11077

-- 2
select O2.OrderID, round(OrderValueWithFreight - Freight, 2) as OrderValue
from (select O.OrderID, sum([O D].UnitPrice * Quantity * (1 - Discount)) as OrderValueWithFreight
        from Orders O
            inner join [Order Details] [O D]
                on O.OrderID = [O D].OrderID
        group by O.OrderID) as sub
inner join Orders O2
    on O2.OrderID = sub.OrderID
order by 2 desc

-- 3
select CustomerID, Address, City, Region, PostalCode, Country
from Customers
where CustomerID not in (select C.CustomerID
                            from Customers C
                                inner join Orders O
                                    on C.CustomerID = O.CustomerID
                            where year(OrderDate) = 1997)

-- 4
select ProductID, count(*) as DistinctCustomersCount
from (select distinct ProductID, CustomerID
        from Orders O
            inner join [Order Details] [O D]
                on O.OrderID = [O D].OrderID
        group by ProductID, CustomerID) as sub
group by ProductID
having count(*) > 1
