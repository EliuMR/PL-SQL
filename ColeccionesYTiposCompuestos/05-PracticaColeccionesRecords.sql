            --- Práctica de COLECCIONES y RECORDS
/*
• Creamos un TYPE RECORD que tenga las siguientes columnas
        NAME VARCHAR2(100),
        SAL EMPLOYEES.SALARY%TYPE,
        COD_DEPT EMPLOYEES.DEPARTMENT_ID%TYPE);
• Creamos un TYPE TABLE basado en el RECORD anterior
• Mediante un bucle cargamos en la colección los empleados. El campo NAME
debe contener FIRST_NAME y LAST_NAME concatenado.
• Para cargar las filas y siguiendo un ejemplo parecido que hemos visto en el
vídeo usamos el EMPLOYEE_ID que va de 100 a 206
• A partir de este momento y ya con la colección cargada, hacemos las siguientes
operaciones, usando métodos de la colección.
• Visualizamos toda la colección
• Visualizamos el primer empleado
• Visualizamos el último empleado
• Visualizamos el número de empleados
• Borramos los empleados que ganan menos de 7000 y visualizamos de
nuevo la colección
• Volvemos a visualizar el número de empleados para ver cuantos se han
borrado
*/
set SERVEROUTPUT on;
declare 
    -- Nuesto record declarado
    type empleado is record
    (NAME VARCHAR2(100),
    SAL EMPLOYEES.SALARY%TYPE,
    COD_DEPT EMPLOYEES.DEPARTMENT_ID%TYPE);
    -- usando nuestro record
    
    TYPE empl_table IS TABLE OF empleado INDEX BY PLS_INTEGER;
    table1 empl_table;
begin
    for i in 100..206 loop
        select first_name||' '||last_name, salary, department_id into table1(i)
        from Employees where department_id=i*10;
    end loop;
    
    FOR i IN table1.FIRST..table1.LAST LOOP
        IF table1.EXISTS(i) THEN
            dbms_output.put_line(table1(i).NAME);
        END IF;
    END LOOP;
    dbms_output.put_line(table1.first.name);
    dbms_output.put_line(table1.last.name);
end;