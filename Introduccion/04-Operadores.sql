-- Operadores más habiatuales
/*
+ suma
- resta
/ división
* multiplicación
** exponente
|| concatenar
*/
-- si sumo un valor nulo a uno numerico el resultado es null
set SERVEROUTPUT on
declare
    x number:=5;
    z number:=110;
    A varchar2(100):='Example';
    D date:='10-12-1990';
begin
    dbms_output.put_line(sysdate-D);    
    dbms_output.put_line(D+1);
    dbms_output.put_line(x+z/x);
end;