select sql_text from v$sql where sql_text like '%Query%';
exec dbms_sqltune.drop_sqlset('MY_STS_WORKLOAD');
/
DECLARE
   sqlsetname      varchar2(30);
   sqlsetcur       dbms_sqltune.sqlset_cursor;
BEGIN
   sqlsetname := 'MY_STS_WORKLOAD';

   dbms_sqltune.create_sqlset(sqlsetname,'Access Advisor data');

   OPEN sqlsetcur FOR
       select value(P)
       from table
        (dbms_sqltune.select_cursor_cache(
           'sql_text like ''SELECT /* Query%''',
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            null)
         ) P

     dbms_sqltune.load_sqlset(sqlsetname,sqlsetcur);
end;
/