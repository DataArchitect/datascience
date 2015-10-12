select count(distinct docid) 
from frequency where term in ('transactions')
and docid in (
    select docid
    from frequency where term in ('world')
)
order by docid
go
