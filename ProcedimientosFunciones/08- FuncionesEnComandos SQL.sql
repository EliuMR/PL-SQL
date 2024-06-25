-- Funciones en comandos SQL
-- Las funciones pueden colocarse en código SQL como select:
    -- REstricciones para usar funciones en SQL
        -- Sólo parámetros IN
        -- Debe estar en la base de datos
        -- Devolver tipos de datos SQL
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
    
    exception
        when no_data_found then
            DBMS_OUTPUT.PUT_LINE('No existe empleado');
end;

/
----
select first_name, salary from employees;
-- Usando la función
select first_name, salary,calc_tax_f(employee_id,16) as Impuesto from employees;
