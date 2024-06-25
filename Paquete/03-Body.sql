Create or replace package Pack1
-- Cabecera
is
    Procedure convert (name varchar2, conversion_type char);
end;
/
-- cuerpo
-- Generalmente el cuerpo debe crearse aparte, es decir, otro fichero, sin embarho se encuentra aquí por temas de simplicidad
create or replace package body pack1
is
    --Declaramos objetos privado dentros de nuestro paquete, es decir objetos que sólo se pueden ser llamados dentro del paquete
    -- En este caso se tratan de dos funciones que posteriormente serán llamadas
function up(name varchar2) -- tranforma a mayúsculas una string
return varchar2
is begin 
    Return upper(name);
end up;

function do(name varchar2) -- transforma a minúsculas una string
return varchar2
is
begin
    return lower(name);
end do;
    -- Lo que realizará el paquete
procedure convert (name varchar2,conversion_type char)
is 
begin
    if conversion_type='U' then 
        dbms_output.put_line(up(name));
    elsif conversion_type='L' then
        dbms_output.put_line(do(name));
    else
        dbms_output.put_line('Parámatro mal debe ser U o L');
    end if;
end convert;

end pack1;
/
-- Checamos el funcionamiento-
set SERVEROUTPUT on;
begin
    pack1.convert('minúsculas','U');
end;