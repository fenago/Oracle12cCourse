update staff
set comm = (select comm from staff as of timestamp 
to_timestamp('2015-03-08 18:10:00','YYYY-MM-DD HH24:Mi:SS')
where id = 20)
where id = 20
/
