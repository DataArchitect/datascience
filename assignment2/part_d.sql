select count(distinct docid) from frequency where term in ('law','legal')
order by docid
go
