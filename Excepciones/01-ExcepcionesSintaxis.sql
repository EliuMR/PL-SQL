-- Excepciones analogo a errores
-- En pl siempre debe tener codigo de errores
-- Excepciones tipos:
    -- Oracle
    -- Usuario
-- Syntaxis; Para controlar las excepciones
/*
begin
...
EXCEPTION -- bloque de excepciones
    when exception1 then Clausula1
    when exception2 then Clausula2
    when other then null; --  cuando hay error pero no está gestionada anteriormente
end;
*/

-- Excepciones predefinidas por oracle más habituales con su nombre y no es necesario saber el error de oracle
-- too_many_rows
-- zero_divide
-- dup_val_on_index

--Ejemplo:
set SERVEROUTPUT on;
declare
    empl Employees%rowtype;
begin 
    select * into empl
    from Employees
    where Employee_id=1000;
    dbms_output.put_line(empl.first_name);
    
    exception
    when no_data_found then
        dbms_output.put_line('Error, empleado no existe');
    when others then 
        null;
end;

/

set SERVEROUTPUT on;
declare
    empl Employees%rowtype;
begin 
    select * into empl
    from Employees
    where Employee_id>1;
    dbms_output.put_line(empl.first_name);
    
    exception
    when no_data_found then
        dbms_output.put_line('Error, empleado no existe');
    when too_many_rows then
        dbms_output.put_line('Error, demasiadas filas de empleados');
    when others then 
         dbms_output.put_line('Error indefinidos');
end;