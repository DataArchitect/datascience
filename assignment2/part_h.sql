create table vector as
SELECT
  Matrix.row_num,
  Transpose.col_num,
  SUM(Matrix.value*Transpose.value)
FROM
  (SELECT docid AS row_num, term AS col_num, COUNT AS VALUE FROM frequency 
  ) Matrix,
  (SELECT term AS row_num, docid AS col_num, COUNT AS VALUE FROM frequency
  ) Transpose
WHERE 
  Matrix.col_num = Transpose.row_num AND 
  Matrix.row_num < Transpose.col_num
GROUP BY 
  Matrix.row_num,
  Transpose.col_num
go

select * from vector where "Matrix.row_num"='10080_txt_crude' and "Transpose.col_num"='17035_txt_earn'
go
