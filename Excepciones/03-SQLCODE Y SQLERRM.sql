-- SQLCODE Y SQLERRM
-- Estas sentencias de sqlcode y sqlerrm son de PL-SQL, no podemos usarlas con SQL
-- como por ejemplo crear un tabla e insertar directamente esas sentencias en una tabla
-- insert into error values(SQLCode,SQLerrm), es incorrecto, si quisieramos guardar dichos
-- valores deberíamos almacenar esos errores en variables y luego guardarlos en la tabla
set SERVEROUTPUT on;
declare
    empl employees%rowtype;
begin 
    -- creamos un select para probar my_excep
    select * into empl from employees;
    dbms_output.put_line(empl.salary);
exception
    when others then
        dbms_output.put_line(SQLCODE); -- retorna el codigo error
        dbms_output.put_line(SQLERRM); -- mensaje de error
end;