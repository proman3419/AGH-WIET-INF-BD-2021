use Northwind

-- 1
select ProductID, ProductName, UnitPrice,
        (select avg(UnitPrice) from Products) as Avg,
        (select avg(UnitPrice) from Products) - UnitPrice as Diff
from Products

-- 2
select ProductID, CategoryName, ProductName, UnitPrice,
       sub.AvgUnitPriceByCategory,
       UnitPrice - AvgUnitPriceByCategory as UnitPriceAvgUnitPriceByCategoryDiff
from Products P
    inner join (select C.CategoryID, CategoryName, avg(UnitPrice) as AvgUnitPriceByCategory
                from Categories C
                    inner join Products P2
                        on C.CategoryID = P2.CategoryID
                group by C.CategoryID, CategoryName) as sub
    on P.CategoryID = sub.CategoryID
