SELECT name, type, sharable_mem, kept
FROM v$db_object_cache
WHERE sharable_mem > 4000
AND EXECUTIONS > 5
AND (type='FUNCTION' OR type='PROCEDURE')
/
