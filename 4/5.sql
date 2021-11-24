use Northwind

-- 1
select E.FirstName, E.LastName, round(sum(sub2.OrderValue), 2) as OrderValue
from (select E.EmployeeID, sum(OrderValueWithFreight) - Freight as OrderValue
        from (select O.OrderID, sum([O D].UnitPrice * Quantity * (1 - Discount)) as OrderValueWithFreight
                from Orders O
                    inner join [Order Details] [O D]
                        on O.OrderID = [O D].OrderID
                group by O.OrderID) as sub
        inner join Orders O2
            on O2.OrderID = sub.OrderID
        inner join Employees E
            on O2.EmployeeID = E.EmployeeID
        group by E.EmployeeID, Freight) as sub2
inner join Employees E
    on E.EmployeeID = sub2.EmployeeID
group by E.EmployeeID, E.FirstName, E.LastName
order by 3 desc

-- 2
select E.FirstName, E.LastName, sub.OrderID, sub.OrderValue
from (select top 1 O.EmployeeID, O.OrderID, sum([O D].UnitPrice * Quantity * (1 - Discount)) as OrderValue
        from Orders O
            inner join [Order Details] [O D]
                on O.OrderID = [O D].OrderID
        where year(OrderDate) = 1997
        group by O.EmployeeID, O.OrderID
        order by 3 desc) as sub
inner join Employees E
    on sub.EmployeeID = E.EmployeeID

-- 3a
select E.FirstName, E.LastName, round(sum(sub2.OrderValue), 2) as OrderValue
from (select E.EmployeeID, sum(OrderValueWithFreight) - Freight as OrderValue
        from (select O.OrderID, sum([O D].UnitPrice * Quantity * (1 - Discount)) as OrderValueWithFreight
                from Orders O
                    inner join [Order Details] [O D]
                        on O.OrderID = [O D].OrderID
                group by O.OrderID) as sub
        inner join Orders O2
            on O2.OrderID = sub.OrderID
        inner join Employees E
            on O2.EmployeeID = E.EmployeeID
        group by E.EmployeeID, Freight) as sub2
inner join Employees E
    on E.EmployeeID = sub2.EmployeeID
where E.EmployeeID in (select distinct ReportsTo
                        from Employees
                        where ReportsTo is not null)
group by E.EmployeeID, E.FirstName, E.LastName
order by 3 desc

-- 3b
select E.FirstName, E.LastName, round(sum(sub2.OrderValue), 2) as OrderValue
from (select E.EmployeeID, sum(OrderValueWithFreight) - Freight as OrderValue
        from (select O.OrderID, sum([O D].UnitPrice * Quantity * (1 - Discount)) as OrderValueWithFreight
                from Orders O
                    inner join [Order Details] [O D]
                        on O.OrderID = [O D].OrderID
                group by O.OrderID) as sub
        inner join Orders O2
            on O2.OrderID = sub.OrderID
        inner join Employees E
            on O2.EmployeeID = E.EmployeeID
        group by E.EmployeeID, Freight) as sub2
inner join Employees E
    on E.EmployeeID = sub2.EmployeeID
where E.EmployeeID not in (select distinct ReportsTo
                            from Employees
                            where ReportsTo is not null)
group by E.EmployeeID, E.FirstName, E.LastName
order by 3 desc

-- 4a
select E.FirstName, E.LastName, sub3.OrderValue, sub4.LatestOrderDate
from (select E.EmployeeID, round(sum(sub2.OrderValue), 2) as OrderValue
        from (select E.EmployeeID, sum(OrderValueWithFreight) - Freight as OrderValue
                from (select O.OrderID, sum([O D].UnitPrice * Quantity * (1 - Discount)) as OrderValueWithFreight
                        from Orders O
                            inner join [Order Details] [O D]
                                on O.OrderID = [O D].OrderID
                        group by O.OrderID) as sub
                inner join Orders O2
                    on O2.OrderID = sub.OrderID
                inner join Employees E
                    on O2.EmployeeID = E.EmployeeID
                group by E.EmployeeID, Freight) as sub2
        inner join Employees E
            on E.EmployeeID = sub2.EmployeeID
        where E.EmployeeID in (select distinct ReportsTo
                                from Employees
                                where ReportsTo is not null)
        group by E.EmployeeID) as sub3
    inner join (select E.EmployeeID, max(OrderDate) as LatestOrderDate
                from Employees E
                    inner join Orders O3 on E.EmployeeID = O3.EmployeeID
                group by E.EmployeeID) as sub4
        on sub3.EmployeeID = sub4.EmployeeID
inner join Employees E
    on sub3.EmployeeID = E.EmployeeID
group by E.EmployeeID, E.FirstName, E.LastName, sub3.OrderValue, sub4.LatestOrderDate

-- 4b
select E.FirstName, E.LastName, sub3.OrderValue, sub4.LatestOrderDate
from (select E.EmployeeID, round(sum(sub2.OrderValue), 2) as OrderValue
        from (select E.EmployeeID, sum(OrderValueWithFreight) - Freight as OrderValue
                from (select O.OrderID, sum([O D].UnitPrice * Quantity * (1 - Discount)) as OrderValueWithFreight
                        from Orders O
                            inner join [Order Details] [O D]
                                on O.OrderID = [O D].OrderID
                        group by O.OrderID) as sub
                inner join Orders O2
                    on O2.OrderID = sub.OrderID
                inner join Employees E
                    on O2.EmployeeID = E.EmployeeID
                group by E.EmployeeID, Freight) as sub2
        inner join Employees E
            on E.EmployeeID = sub2.EmployeeID
        where E.EmployeeID not in (select distinct ReportsTo
                                    from Employees
                                    where ReportsTo is not null)
        group by E.EmployeeID) as sub3
    inner join (select E.EmployeeID, max(OrderDate) as LatestOrderDate
                from Employees E
                    inner join Orders O3 on E.EmployeeID = O3.EmployeeID
                group by E.EmployeeID) as sub4
        on sub3.EmployeeID = sub4.EmployeeID
inner join Employees E
    on sub3.EmployeeID = E.EmployeeID
group by E.EmployeeID, E.FirstName, E.LastName, sub3.OrderValue, sub4.LatestOrderDate
