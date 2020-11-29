CREATE TABLE STAFF_EXTERNAL (
 ID  NUMBER(4),
 NAME  CHAR(11),
 DEPT  NUMBER(4),
 JOB  CHAR(5),
 SALARY NUMBER(7,2)
)
ORGANIZATION EXTERNAL (
type oracle_loader
DEFAULT DIRECTORY STAFF_LOAD
ACCESS PARAMETERS (
    RECORDS FIXED 50
    badfile staff_load: 'staff_ext.bad'
    logfile staff_load:'staff_ext.log'
    FIELDS
(
  id  integer external(4),
  name char(11),
  dept    integer external(4),
  job  char(5),
  salary char(7)
)
)
location ('staff.dat','staff2.dat')
)
PARALLEL 4
reject  limit unlimited
/


