use library

-- 1
select firstname, lastname, birth_date, street, city, state, zip
from member m
    inner join juvenile j
        on j.member_no = m.member_no
    inner join adult a
        on j.adult_member_no = a.member_no
where j.member_no is not null

-- 2
select m.firstname, m.lastname, am.firstname, am.lastname, birth_date, street, city, state, zip
from member m
    inner join juvenile j
        on j.member_no = m.member_no
    inner join adult a
        on a.member_no = j.adult_member_no
    inner join member am
        on am.member_no = a.member_no
