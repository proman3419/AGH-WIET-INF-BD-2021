use Northwind

-- 1
select CompanyName, Phone
from Customers
where CustomerID in (select CustomerID
                        from Orders O
                        inner join Shippers S
                            on O.ShipVia = S.ShipperID
                        where year(ShippedDate) = 1997 and S.CompanyName = 'United Package')

-- 2
select CompanyName, Phone
from Customers
where CustomerId in (select CustomerID
                        from Orders O
                        inner join [Order Details] [O D]
                            on O.OrderID = [O D].OrderID
                        inner join Products P
                            on [O D].ProductID = P.ProductID
                        inner join Categories C
                            on P.CategoryID = C.CategoryID
                        where CategoryName = 'Confections')

-- 3
select CompanyName, Phone
from Customers
where CustomerId not in (select CustomerID
                            from Orders O
                            inner join [Order Details] [O D]
                                on O.OrderID = [O D].OrderID
                            inner join Products P
                                on [O D].ProductID = P.ProductID
                            inner join Categories C
                                on P.CategoryID = C.CategoryID
                            where CategoryName = 'Confections')
