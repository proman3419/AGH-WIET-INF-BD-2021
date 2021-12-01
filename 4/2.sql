use Northwind

-- 1
select sub.ProductID, sub.MaxQuantity
from (select ProductID, max(Quantity) as MaxQuantity
        from [Order Details]
        group by ProductID) as sub
order by sub.MaxQuantity desc

-- 2
select ProductID
from Products
where UnitPrice < (select avg(UnitPrice)
                    from Products)

-- 3
select ProductID
from Products P
where UnitPrice < (select avg(UnitPrice)
                    from Products P2
                    where P.CategoryID = P2.CategoryID)
order by ProductID

select P.ProductID
from Products P
    inner join Categories C
        on P.CategoryID = C.CategoryID
    inner join (select C.CategoryID, avg(UnitPrice) as AvgUnitPriceByCategory
                from Products P
                    inner join Categories C
                        on P.CategoryID = C.CategoryID
                    group by C.CategoryID) as sub
    on P.CategoryID = sub.CategoryID
where P.UnitPrice < sub.AvgUnitPriceByCategory
