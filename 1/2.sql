use library

-- 1
select title
from title
order by title

-- 2
select distinct member_no, isbn, fine_assessed, fine_assessed * 2 as 'double fine'
from loanhist
where isnull(fine_assessed, 0) != 0

-- 3
select firstname + middleinitial + lastname as 'email_name'
from member
where lastname = 'Anderson'

select lower(firstname + middleinitial + substring(lastname, 1, 2)) as 'proposed_email_name'
from member

-- 4
select 'The title is: ' + title + ', title number ' + convert(varchar, title_no)
from title
