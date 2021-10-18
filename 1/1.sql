-- 1
select title_no, title from title

-- 2
select title from title where title_no = 10

-- 3
-- jeżeli chodzi nam o przyznaną
select member_no, fine_assessed
from loanhist
where fine_assessed between 8.00 and 9.00

-- jeżeli chodzi nam o stan obecny
select member_no, fine_assessed
from loanhist
where fine_assessed  -
      (coalesce(fine_paid, 0) + coalesce(fine_waived, 0))
    between 8.00 and 9.00

-- 4
select title_no, author
from title
where author in ('Charles Dickens', 'Jane Austen')

-- 5
select title_no, title
from title
where title like '%adventures%'

-- 6
-- zał, że chodzi o niezapłaconą w pełni
select member_no, fine_assessed, coalesce(fine_paid, 0) as fine_paid
from loanhist
where fine_assessed  -
      (coalesce(fine_paid, 0) + coalesce(fine_waived, 0))
    != 0

-- 7
select distinct city, state
from adult
