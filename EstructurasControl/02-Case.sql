-- Case
-- forma más simple de construir condiciones multiples en comparación a elsif
set SERVEROUTPUT on

DECLARE
    v1 CHAR(1);
BEGIN
    v1 := 'B';
    CASE v1
        WHEN 'A' THEN
            dbms_output.put_line('Excellent');
        WHEN 'B' THEN
            dbms_output.put_line('Very good');
        WHEN 'C' THEN
            dbms_output.put_line('Good');
        WHEN 'D' THEN
            dbms_output.put_line('Fair');
        WHEN 'E' THEN
            dbms_output.put_line('Poor');
        ELSE
            dbms_output.put_line('Nosuch value');
    END CASE;

END;

-- seacher case
-- hacer operaciones más complejas al hacer operaciones
set SERVEROUTPUT on

DECLARE
    bonus NUMBER;
BEGIN
    bonus := 100;
    CASE
        WHEN bonus > 500 THEN
            dbms_output.put_line('Excellent');
        WHEN bonus <= 500 THEN
            dbms_output.put_line('Excellent');
        ELSE
            dbms_output.put_line('Nosuch value');
    END CASE;

END;

/*
Práctica
*/

set SERVEROUTPUT on
declare
    nombre VARCHAR2(20);
begin
    nombre:=user;
    case
    when nombre='SYS' then
        dbms_output.put_line('Super Admin');
    when nombre='SYSTEM' then
        dbms_output.put_line('Administrador normal');
    when nombre='HR' then
        dbms_output.put_line('Recursos Humanos');
    else
        dbms_output.put_line('Usuario no autorizado');
    end case;
end;