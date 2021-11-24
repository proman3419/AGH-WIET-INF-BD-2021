use Northwind

-- 1
select ProductID, ProductName, UnitPrice, sub.AvgUnitPrice,
       UnitPrice - sub.AvgUnitPrice as UnitPriceAvgUnitPriceDiff
from (select ProductID, ProductName, UnitPrice, (select avg(UnitPrice) from Products) as AvgUnitPrice
        from Products) as sub

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
