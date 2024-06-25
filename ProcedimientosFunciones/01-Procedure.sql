-- Procedimientos
-- se guarda cada procedimiento dentro de nuestra base de datos
create procedure Procedure1 -- create o replace Procedure 1 -- se crea o si ya existe lo elimina y remplaza
is -- analogo a declare
 x number:=10;
begin
    dbms_output.put_line(x);
end;
/
--- Usando Procedure1
set SERVEROUTPUT on;
begin
    Procedure1;
end;
-- también puede ejecutarse: con execute Procedure1;