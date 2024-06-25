-- %Rowtype
-- Para no declarar cada campo
-- si se modifica la variable no modifica la tabla
-- asociar a una fila
SET SERVEROUTPUT ON
DECLARE 
    salario NUMBER;
    empleado employees%rowtype; -- para almacenar todas las columnas de una tabla y no declarar cada una
BEGIN 
    SELECT -- SÓLO PUEDE DEVOLVER UNA FILA
       * INTO empleado       
    FROM
        employees
    WHERE 
        employee_id=100;
    dbms_output.put_line(empleado.salary); -- imprimimos el campo de la variable que contiene los campos
    dbms_output.put_line(empleado.first_name);
END;