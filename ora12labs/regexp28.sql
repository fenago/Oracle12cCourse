select * from test
where regexp_like(testcol, '[[:upper:]]{3}')
/