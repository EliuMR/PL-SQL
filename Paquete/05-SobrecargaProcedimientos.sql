-- Sobrecarga de procedimientos
-- Usar dos funciones con el mismo nombre, pero con argumentos diferentes


-- Dar la cantidad de departamento

CREATE OR REPLACE 
PACKAGE CONTAREMPLEADOS AS 

  /* TODO enter package declarations (types, exceptions, methods etc) here */ 
    function count_employees(id number) return number; -- usando la id del depto regresar la cantidad
    function count_employees(id varchar2) return number; -- usando el nombre del depto
END CONTAREMPLEADOS;
/
CREATE OR REPLACE
PACKAGE BODY CONTAREMPLEADOS AS

  function count_employees(id number) return number AS
  x number;
  BEGIN
    -- TAREA: Se necesita implantación para function CONTAREMPLEADOS.count_employees
    select count(*) into x from Employees where department_id=id;
    RETURN x;
  END count_employees;

  function count_employees(id varchar2) return number AS
  x number;
  BEGIN
    -- TAREA: Se necesita implantación para function CONTAREMPLEADOS.count_employees
    
    select count(*) into x from Employees A, Departments B -- join
        where department_name=id
        and A.department_id=b.department_id;
    RETURN x;
  END;

END CONTAREMPLEADOS;
/

set SERVEROUTPUT on;
begin
    dbms_output.put_line(ContarEmpleados.count_employees(50));
    dbms_output.put_line(ContarEmpleados.count_employees('Shipping'));
end;