create table searchterm as
SELECT * FROM frequency
UNION
SELECT 'q' as docid, 'washington' as term, 1 as count 
UNION
SELECT 'q' as docid, 'taxes' as term, 1 as count
UNION 
SELECT 'q' as docid, 'treasury' as term, 1 as count
go

create table results as
SELECT
  Matrix.row_num as row_num,
  Transpose.col_num as col_num,
  SUM(Matrix.value*Transpose.value) as score
FROM
  (SELECT docid AS row_num, term AS col_num, COUNT AS VALUE FROM searchterm 
  ) Matrix,
  (SELECT term AS row_num, docid AS col_num, COUNT AS VALUE FROM searchterm 
  ) Transpose
WHERE 
  Matrix.col_num = Transpose.row_num AND 
  Matrix.row_num < Transpose.col_num
GROUP BY 
  Matrix.row_num,
  Transpose.col_num
go

select max(score) as max from results where col_num='q'
go
