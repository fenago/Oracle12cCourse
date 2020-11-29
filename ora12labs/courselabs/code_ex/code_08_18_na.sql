SET DOC OFF
SET FEEDBACK OFF
SET ECHO OFF

CREATE OR REPLACE PROCEDURE P0 IS
  e_01476 EXCEPTION; 
  pragma exception_init ( e_01476, -1476 );
BEGIN
  RAISE e_01476;  -- this is a zero divide error
END P0;
/
CREATE OR REPLACE PROCEDURE P1 IS
BEGIN
  P0();
END P1;
/
CREATE OR REPLACE PROCEDURE P2 IS
BEGIN
  P1();
END P2;
/
CREATE OR REPLACE PROCEDURE P3 IS
BEGIN
  P2();
END P3;
/
CREATE OR REPLACE PROCEDURE P4 IS
  BEGIN P3(); 
END P4;
/
CREATE OR REPLACE PROCEDURE P5 IS
  BEGIN P4(); 
END P5;
/
CREATE OR REPLACE PROCEDURE top IS
BEGIN
  P5(); -- this procedure is used to show the results
        -- without using the TOP_WITH_LOGGING routine.
END top;
/
SET FEEDBACK ON