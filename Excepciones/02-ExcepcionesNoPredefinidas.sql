-- Excepciones no predifinidas
-- Estas son excepciones de Oracle no son definidas por el usuario, no confundir
-- Es una manera de gestionarlas
set SERVEROUTPUT on;
declare
    mi_excep EXCEPTION; -- objeto tip exception
    pragma Exception_init(mi_excep,-937); -- asocia ese error con mi objeto
    v1 number;
    v2 number;
begin 
    -- creamos un select para probar my_excep
    select employee_id,sum(salary) into v1,v2 from employees;
    dbms_output.put_line(v1);
exception
    when mi_excep then
        dbms_output.put_line('Función de grupo incorrecta');
    when others then
        dbms_output.put_line('Error indefinido');

end;