-- Cursores con parámetros
-- son cursores dinámicos, a los cuales podemos asignar ciertos valores dependiendo de alguna condición
-- siguiente ejemplo muestra un cursor que dará los empleados que ganan más que cierto parámetro asignado

set SERVEROUTPUT on;
declare
    cursor my_cursor (sal number) is select * from employees
        where salary>sal;
    empl employees%rowtype;
begin
    open my_cursor(8000); -- abrimos el cursor, dándole el parámetro o parametros requerridos
    loop
        fetch my_cursor into empl;
        exit when my_cursor%notfound;
        dbms_output.put_line(empl.first_name||' '||empl.salary);
    end loop;
        dbms_output.put_line('He encontrado'||my_cursor%rowcount||' empleados');
    close my_cursor;
end;