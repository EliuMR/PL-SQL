--                  Práctica De Funciones
/*
1. Crear una función que tenga como parámetro un número de
departamento y que devuelve la suma de los salarios de dicho
departamento. La imprimimos por pantalla.
    • Si el departamento no existe debemos generar una excepción
    con dicho mensaje
    • Si el departamento existe, pero no hay empleados dentro,
    también debemos generar una excepción para indicarlo
*/
Create Or Replace Function Suma_Salarios_Depto_F
                            (
                            depto in Employees.Department_id%TYPE 
                            )
return number
as
    cursor cursor_empleados is select * from Employees where Department_id=depto;
    suma_salario number;
    depart Departments.department_id%type;
    numero_depts number;
begin
    suma_salario:=0;
    
    select department_id into depart from Departments where department_id=depto; -- para ver si existe departamentos
    
    
    select count(*) into numero_depts from Employees where department_id=depto;
    
    if numero_depts>0 then
            for i in cursor_empleados loop
                suma_salario:=suma_salario + i.salary;
            end loop;
    else
        raise_application_error(-20000,'No hay empleados con ese departamento');    
    end if;
    return suma_salario;
    
    Exception
        when no_data_found then 
            DBMS_OUTPUT.PUT_LINE('No existe ese departamento');
    
end;

/
set serveroutput on;
declare
    depto number;
    suma number;
begin
    depto:=0;
    suma:=Suma_Salarios_Depto_F(depto);
    dbms_output.put_line('La suma de los salarios es '||suma);
end;


/*
2. Modificar el programa anterior para incluir un parámetro de tipo OUT por
el que vaya el número de empleados afectados por la query. Debe ser
visualizada en el programa que llama a la función. De esta forma vemos
que se puede usar este tipo de parámetros también en una función
*/

Create Or Replace Function Suma_Salarios_Depto_F
                            (
                            depto in Employees.Department_id%TYPE, 
                            salida_suma out number
                            )
return number
as
    cursor cursor_empleados is select * from Employees where Department_id=depto;
    suma_salario number;
    depart Departments.department_id%type;
    numero_depts number;
begin
    suma_salario:=0;
    
    select department_id into depart from Departments where department_id=depto; -- para ver si existe departamentos
    
    
    select count(*) into numero_depts from Employees where department_id=depto;
    
    if numero_depts>0 then
            for i in cursor_empleados loop
                suma_salario:=suma_salario + i.salary;
            end loop;
    else
        raise_application_error(-20000,'No hay empleados con ese departamento');    
    end if;
    salida_suma:=suma_salario;
    return suma_salario;
    
    Exception
        when no_data_found then 
            DBMS_OUTPUT.PUT_LINE('No existe ese departamento');
    
end;

/
set serveroutput on;
declare
    depto number;
    suma number;
    suma_out number;
begin
    depto:=10;
    suma:=Suma_Salarios_Depto_F(depto,suma_out);
    dbms_output.put_line('La suma de los salarios es '||suma);
    dbms_output.put_line('La suma de los salarios es '||suma_out);
end;

/*
3. Crear una función llamada CREAR_REGION,
    • A la función se le debe pasar como parámetro un nombre de
    región y debe devolver un número, que es el código de región
    que calculamos dentro de la función
    • Se debe crear una nueva fila con el nombre de esa REGION
    • El código de la región se debe calcular de forma automática.
    Para ello se debe averiguar cual es el código de región más
    alto que tenemos en la tabla en ese momento, le sumamos 1 y
    el resultado lo ponemos como el código para la nueva región
    que estamos creando.
    • Si tenemos algún problema debemos generar un error
    • La función debe devolver el número que ha asignado a la región
*/
create or REPLACE function Crear_Region
                            (nombre_region in Regiones.region_name%type)
return Regiones.Region_name%type
as
    cantidad number;

begin
    select count(*) into cantidad from Regiones;
    insert into Regiones (Region_ID,Region_name) values(cantidad+1,nombre_region);
    return cantidad+1;
end;
/
set serveroutput on;
declare
    nombre Regiones.region_name%type;
    cantidad number;
begin
    nombre:='México';
    cantidad:=Crear_Region(nombre);
    dbms_output.put_line(cantidad);
end;