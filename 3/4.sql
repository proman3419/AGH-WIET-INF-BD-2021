use Northwind

-- 1a
select distinct Employer.FirstName, Employer.LastName, sum(OD.UnitPrice * Quantity * (1 - Discount)) as OrdersValue
from Employees Employer
    inner join Orders O
        on Employer.EmployeeID = O.EmployeeID
    inner join [Order Details] OD
        on O.OrderID = OD.OrderID
    left join Employees Employee
        on Employer.EmployeeID = Employee.ReportsTo
where Employee.ReportsTo is not null
group by Employer.EmployeeID, Employer.FirstName, Employer.LastName, Employee.EmployeeID

-- 1b
select Employer.FirstName, Employer.LastName, sum(OD.UnitPrice * Quantity * (1 - Discount)) as OrdersValue
from Employees Employer
    inner join Orders O
        on Employer.EmployeeID = O.EmployeeID
    inner join [Order Details] OD
        on O.OrderID = OD.OrderID
    left join Employees Employee
        on Employer.EmployeeID = Employee.ReportsTo
where Employee.ReportsTo is null
group by Employer.EmployeeID, Employer.FirstName, Employer.LastName
