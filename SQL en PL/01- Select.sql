-- select
-- el resultado de un select debo guardarlo en una variable
SET SERVEROUTPUT ON
DECLARE 
    salario NUMBER;
    nombre employees.first_name%type; -- asignamos del tipo de dato de first name
BEGIN 
    SELECT -- SÓLO PUEDE DEVOLVER UNA FILA
        salary,first_name INTO salario,nombre        
    FROM
        employees
    WHERE 
        employee_id=100;
    dbms_output.put_line(salario);
    dbms_output.put_line(nombre);
END;