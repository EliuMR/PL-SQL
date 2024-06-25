-- INSERTS
-- Tabla de ejemplo:
CREATE TABLE TEST 
(
  C1 NUMBER 
, C2 VARCHAR2(20) 
);

-- grabamos unos datos
declare
    col1 test.c1%type;
    col2 test.c2%type;
begin
    col1:=10;
    insert into test (c1,c2) values (col1,'aaa');
end;