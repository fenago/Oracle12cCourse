BEGIN
  FOR I IN 1..10000 LOOP
      IF I BETWEEN 1 AND 2000 THEN
         INSERT INTO child VALUES(I,I+I);
      ELSIF I BETWEEN 2001 AND 5000 THEN
         INSERT INTO child VALUES(I,I-I);
      ELSE
         INSERT INTO child VALUES(I,I-2);
      END IF;
      IF MOD(I,1000) = 0 THEN COMMIT;
      END IF;
  END LOOP;
END;
/
--CREATE  PUBLIC SYNONYM BIG FOR BIG;

