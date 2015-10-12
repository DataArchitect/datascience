create temp table bigdoc
as select distinct (docid) 
from frequency 
where 1=1
group by docid
having sum(count)>300
order by docid
go

select count(*) from bigdoc
go

--select * from frequency where docid='5167_txt_crude'
--go
