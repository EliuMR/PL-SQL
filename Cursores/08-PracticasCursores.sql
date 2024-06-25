                    -- PRÁCTICAS CON CURSORES
                    
/*                    
• 1-Hacer un programa que tenga un cursor que vaya visualizando los salarios de
los empleados. Si en el cursor aparece el jefe (Steven King) se debe generar un
RAISE_APPLICATION_ERROR indicando que el sueldo del jefe no se puede
ver.
*/
set serveroutput on;
declare
    Cursor mi_cur is select * from employees;
    emple Employees%rowtype;
    jefe varchar2(30);
    
    exception_jefe Exception;
begin
    jefe:='Steven King';
    open mi_cur;
    loop
        fetch mi_cur into emple;
        exit when mi_cur%notfound;
        
        if emple.first_name||' '||emple.last_name=jefe then
            raise exception_jefe;
        end if;
        dbms_output.put_line(emple.first_name||' '||emple.last_name);
        dbms_output.put_line(emple.salary);
    end loop;
    
    Exception
    when exception_jefe then 
        raise_application_error (-20000,'No se puede mostrar el sueldo del jefe');
    when others then
        dbms_output.put_line(SQLcode);
        dbms_output.put_line(SQLERRM);
end;
/


/*
 2- Vamos averiguar cuales son los JEFES (MANAGER_ID) de cada
departamento. En la tabla DEPARTMENTS figura el MANAGER_ID de cada
departamento, que a su vez es también un empleado. Hacemos un bloque con
dos cursores. (Esto se puede hacer fácilmente con una sola SELECT pero vamos
a hacerlo de esta manera para probar parámetros en cursores).
    o El primero de todos los empleados
    o El segundo de departamentos, buscando el MANAGER_ID con el
    parámetro que se le pasa.
    o Por cada fila del primero, abrimos el segundo cursor pasando el
    EMPLOYEE_ID
    o Si el empleado es MANAGER_ID en algún departamento debemos
    pintar el Nombre del departamento y el nombre del MANAGER_ID
    diciendo que es el jefe.
    o Si el empleado no es MANAGER de ningún departamento debemos
    poner “No es jefe de nada”
*/

SET SERVEROUTPUT ON;
DECLARE
    -- Definición de cursores
    CURSOR cursor_empleado IS
        SELECT * FROM Employees;
    
    CURSOR cursor_departamento (buscado NUMBER) IS
        SELECT * FROM Departments WHERE buscado = Manager_id;

    v_employee_id NUMBER;
    v_dept_record Departments%ROWTYPE;
BEGIN
    FOR i IN cursor_empleado LOOP
        v_employee_id := i.employee_id;

        OPEN cursor_departamento(v_employee_id);
        FETCH cursor_departamento INTO v_dept_record;
        
        IF cursor_departamento%FOUND THEN
            DBMS_OUTPUT.put_line('Departamento: ' || v_dept_record.department_name
            ||' Manager id: '||i.MANAGER_ID||' es jefe.');
        ELSE
            DBMS_OUTPUT.put_line('No es jefe Employee ID: ' || v_employee_id);
        END IF;
        
        CLOSE cursor_departamento;
    END LOOP;
END;
/


/*
• 3-Crear un cursor con parámetros que pasando el número de departamento
visualice el número de empleados de ese departamento
*/
set serveroutput on;
declare
    cursor mi_cursor (id_dep number) is select * from Employees where department_id=id_dep;
    v_rec mi_cursor%ROWTYPE;
begin
     -- Realizar el primer fetch para poder usar %ROWCOUN
    open mi_cursor(110);
     FETCH mi_cursor INTO v_rec;
     -- Continuar iterando si se desean procesar más filas
    WHILE mi_cursor%FOUND LOOP
        FETCH mi_cursor INTO v_rec;
    END LOOP;
     dbms_output.put_line(mi_cursor%rowcount);
    close mi_cursor;
end;

/*
• 4-Crear un bucle FOR donde declaramos una subconsulta que nos devuelva el
nombre de los empleados que sean ST_CLERK. Es decir, no declaramos el
cursor sino que lo indicamos directamente en el FOR.*/

set serveroutput on;
begin
    for i in (select * from Employees where job_id='ST_CLERK') loop
        dbms_output.put_line(i.first_name);
    end loop;
end;

/*
• 5-Creamos un bloque que tenga un cursor para empleados. Debemos crearlo con
FOR UPDATE.
    o Por cada fila recuperada, si el salario es mayor de 8000 incrementamos el
    salario un 2%
    o Si es menor de 8000 lo hacemos en un 3%
    o Debemos modificarlo con la cláusula CURRENT OF
    o Comprobar que los salarios se han modificado correctamente.
*/
SET SERVEROUTPUT ON;
DECLARE
    CURSOR mi_cursor IS
        SELECT * FROM Employees FOR UPDATE; -- La cláusula FOR UPDATE se utiliza en un cursor para bloquear las filas seleccionadas de modo que otras transacciones no puedan modificar esas filas mientras el cursor está abierto.
    empl Employees%ROWTYPE;
BEGIN
    OPEN mi_cursor;
    LOOP
        FETCH mi_cursor INTO empl;
        EXIT WHEN mi_cursor%NOTFOUND;
        
        IF empl.salary > 8000 THEN
            UPDATE Employees
            SET salary = salary * 1.02
            WHERE CURRENT OF mi_cursor;
            DBMS_OUTPUT.put_line('Empleado ' || empl.employee_id || ' actualizado con 2% de aumento.');
        ELSE
            UPDATE Employees
            SET salary = salary * 1.03
            WHERE CURRENT OF mi_cursor;
            DBMS_OUTPUT.put_line('Empleado ' || empl.employee_id || ' actualizado con 3% de aumento.');
        END IF;
    END LOOP;
    CLOSE mi_cursor;
END;
/

