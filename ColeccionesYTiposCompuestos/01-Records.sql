-- Colecciones y tipos compuestos
-- Son componentes que pueden albergar mmúltiples valores a diferencia de los escalares que sólo pueden tener 1
-- Don de dos tipos
        -- Records: Muy similares a una tabla, pueden agregar una fila de datos de distintos tipos
                -- Aparte de rowtype% podemos crear nuestros propios tipos
                    -- type nombre is record (campo1,campo2,...)
                    -- podemos crear variables de ese tipo: variable tipo
                    -- type empleado is record
                    --  (nombre varchar2(100,
                    --   salario number,
                    --   gecha employees.data%type))
        -- Colecciones o collections
                -- Arrays asociativos
                -- Nested tables
                -- Varrays

set SERVEROUTPUT on;
declare 
    -- Nuesto record declarado
    type empleado is record
    (nombre varchar2(200),
    salario number,
    fecha employees.hire_date%type,
    datos employees%rowtype);
    -- usando nuestro record
    emple1 empleado;
begin
    select * into emple1.datos
    from employees where employee_id=100;
    
    emple1.nombre:=emple1.datos.first_name||' '||emple1.datos.last_name;
    emple1.salario:=emple1.datos.salary*0.80;
    emple1.fecha:=emple1.datos.hire_date;
    
    dbms_output.put_line(emple1.nombre);
    dbms_output.put_line(emple1.salario);
    dbms_output.put_line(emple1.fecha);
    dbms_output.put_line(emple1.datos.first_name);
end;