-- constantes
-- siempre que se crean constantes deben inicializarse
set SERVEROUTPUT on

DECLARE
    x CONSTANT NUMBER := 10;
BEGIN
    dbms_output.put_line(x);
END;
    
-- las constantes no pueden modificarse
set SERVEROUTPUT on

DECLARE
    x CONSTANT NUMBER := 10;
BEGIN
    x := 20; -- ERRROR
    dbms_output.put_line(x);
END;

-- not null, para modificar la variable
set SERVEROUTPUT on

DECLARE
    x CONSTANT NUMBER := 10;
    z NUMBER NOT NULL := 20;
BEGIN
    dbms_output.put_line(x);   
    dbms_output.put_line(z);
    z:=30;
    dbms_output.put_line(z);
END;