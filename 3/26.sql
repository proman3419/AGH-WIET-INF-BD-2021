use library

-- 3
select distinct street, city, state, zip
from adult a
    inner join juvenile j
        on a.member_no = j.adult_member_no
where birth_date < '1996-1-1'

-- 4
select distinct street, city, state, zip
from adult a
    inner join juvenile j
        on a.member_no = j.adult_member_no
    left join loan l
        on a.member_no = l.member_no
where birth_date < '1996-1-1' and (l.member_no is null or l.due_date > getdate())
