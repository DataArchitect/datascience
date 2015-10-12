/*
select * from A
go
select * from B
go
*/

--pragma table_info( 'A' )
--go

select A.row_num, B.col_num, SUM(A.value * B.value) as mult
from A,B
where A.col_num=B.row_num
group by A.row_num,B.col_num
go
