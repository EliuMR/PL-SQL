-- Bloques anónimos
SET SERVEROUTPUT ON
BEGIN
DBMS_OUTPUT.put_line(100);
DBMS_OUTPUT.PUT_LINE('CADENA'||' CONCATENADA');
END;

SET SERVEROUTPUT ON
BEGIN
DBMS_OUTPUT.PUT_LINE('NOMBRE'||' APELLIDO');
END;