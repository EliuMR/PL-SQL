/*
1. Visualizar iniciales de un nombre
• Crea un bloque PL/SQL con tres variables VARCHAR2:
o Nombre
o apellido1
o apellido2
• Debes visualizar las iniciales separadas por puntos.
• Además siempre en mayúscula
• Por ejemplo alberto pérez García debería aparecer--> A.P.G

*/

set SERVEROUTPUT on
declare 
    nombre varchar2(20);
    apellido1 varchar2(20);
    apellido2 varchar2(20);
begin
    nombre:='Alberto';
    apellido1:='Perez';
    apellido2:='García';
    dbms_output.put_line(SUBSTR(nombre,1,1)||'.'||substr(apellido1,1,1)
    ||'.'||substr(apellido2,1,1));
end;

set SERVEROUTPUT on
declare
    fecha_nacimiento date:=to_date('1998/11/05','YYYY-MM-DD');
begin
    dbms_output.put_line(to_char(fecha_nacimiento,'Day'));
end;