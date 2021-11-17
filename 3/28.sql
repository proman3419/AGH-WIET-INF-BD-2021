use library

-- 1
select firstname + ' ' + lastname as name, street + ' ' + city + ' ' + state + ' ' + zip as address
from member m
    inner join adult a
        on m.member_no = a.member_no

-- 2
select i.isbn, copy_no, on_loan, title, translation, cover
from item i
    inner join copy c
        on i.isbn = c.isbn
    inner join title t
        on c.title_no = t.title_no
where c.isbn in (1, 500, 1000)
order by isbn

-- 3
select m.member_no, firstname, lastname, isbn, log_date
from member m
    inner join reservation r2
        on m.member_no = r2.member_no
where m.member_no in (250, 342, 1675)
