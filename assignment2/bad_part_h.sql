create temp table doc1
as select term, docid, count
from frequency f
where 1=1
and f.docid in ('10080_txt_crude' )
go

create temp table doc2
as select term, docid, count
from frequency f
where 1=1
and f.docid in ('17035_txt_earn' )
go

create temp table doc1_t
as select term, docid, count
from doc1 f
where 1=1
go

create temp table doc2_t
as select term, docid, count
from doc2 f
where 1=1
go

--select * from trans
--go

create temp table d1_x as 
select f.docid as docid, t.term as term, SUM(f.count * t.count) as count
from doc1 f, doc1_t t
where f.term=t.term
--and f.docid in ('10080_txt_crude' , '17035_txt_earn')
--and f.docid= '10080_txt_crude' and t.docid= '17035_txt_earn'
group by f.docid,t.term
go

create temp table d2_x as 
select f.docid as docid, t.term as term, SUM(f.count * t.count) as count
from doc2 f, doc2_t t
where f.term=t.term
group by f.docid,t.term
go

--.schema

-- Final product
select f.docid, t.term, SUM(f.count * t.count) as mult
from d1_x f, d2_x t
where f.term=t.term
group by f.docid,t.term
go

