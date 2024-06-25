-- Función que calcula el impuesto de un empleado
-- Se pueden usar out y in out en funciones pero no es lo más adecuado, usar dichos parámetros en procedures
-- Ya que funciones con out no podrán usarse en SQL pero sí en PL.

create or replace function calc_tax_F
    (empl in employees.employee_id%type,
    t1 in number)
return number -- especifíco el tipo de returno,no como los procedimientos que especificabamos el tipo de salida, dentro de los paramátros
is
    tax number:=0;
    sal number:=0;
begin
    if t1<0 or t1>60 then
        raise_application_error(-20000,'El porcentaje de impuesto debe estar entre 0 y 60');
    end if;
    select salary into sal from employees where employee_id=empl;
    
    tax:=sal*t1/100;
    return tax;
    
    Exception
        when no_data_found then
            dbms_output.put_line('No existe empleado');
end;

/

-- Llamando la función
set serveroutput on
declare
    A number;
    B number;
    C number;
begin
    A:=120;
    B:=10;
    C:=Calc_tax_f(A,B); -- debemos en algún lado almacenar el return de la función
    dbms_output.put_line('C= '||c);
end;