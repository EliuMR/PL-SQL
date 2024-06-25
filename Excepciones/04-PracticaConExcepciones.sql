--              PRÁCTICA CON EXCEPCIONES

/*
1- Crear una SELECT (no un cursor explícito) que devuelva el nombre de un
empleado pasándole el EMPLOYEE_ID en el WHERE,
• Comprobar en primer lugar que funciona pasando un empleado
existente
• Pasar un empleado inexistente y comprobar que genera un error
• Crear una zona de EXCEPTION controlando el NO_DATA_FOUND
para que pinte un mensaje como “Empleado inexistente”
*/
set SERVEROUTPUT on ;
declare
    empleado_nombre employees.first_name%type;
begin
    select first_name into empleado_nombre
    from Employees
    where employee_id=1;
    
    dbms_output.put_line(empleado_nombre);
exception
    when no_data_found then
        dbms_output.put_line('Empleado inexistente');
    when others then 
        dbms_output.put_line('Error no definido');
end;
/

/*
2- Modificar la SELECT para que devuelva más de un empleado, por ejemplo
poniendo EMPLOYEE_ID> 100. Debe generar un error. Controlar la
excepción para que genere un mensaje como “Demasiados empleados
en la consulta”
*/
set SERVEROUTPUT on ;
declare
    empleado_nombre employees.first_name%type;
begin
    select first_name into empleado_nombre
    from Employees
    where employee_id>1;
    
    dbms_output.put_line(empleado_nombre);
exception
    when no_data_found then
        dbms_output.put_line('Empleado inexistente');
    when too_many_rows then
        dbms_output.put_line('Demasiados empleados en la consulta');
    when others then 
        dbms_output.put_line('Error no definido');
end;
/

/*
3- Modificar la consulta para que devuelva un error de división por CERO,
por ejemplo, vamos a devolver el salario en vez del nombre y lo dividimos
por 0. En este caso, en vez de controlar la excepción directamente,
creamos una sección WHEN OTHERS y pintamos el error con SQLCODE
y SQLERR
*/
set SERVEROUTPUT on ;
declare
    salario employees.salary%type;
begin
    select salary/0 into salario
    from Employees
    where employee_id=100;
    
    dbms_output.put_line(salario);
exception
    when no_data_found then
        dbms_output.put_line('Empleado inexistente');
    when too_many_rows then
        dbms_output.put_line('Demasiados empleados en la consulta');
    when others then
        dbms_output.put_line(SQLCODE); -- retorna el codigo error
        dbms_output.put_line(SQLERRM); -- mensaje de error
end;
/

/*
4- El error -00001 es clave primaria duplicada.
a. Aunque ya existe una predefinida (DUP_VAL_ON_INDEX) vamos
a crear una excepción no -predefinida que haga lo mismo.
b. Vamos a usar la tabla REGIONS para hacerlo más fácil
c. Usamos PRAGMA EXCEPTION_INIT y creamos una excepción
denominada “duplicado”.
d. Cuando se genere ese error debemos pintar “Clave duplicada,
intente otra”. 
*/
set SERVEROUTPUT on ;
declare
    mi_excep EXCEPTION; -- objeto tip exception
    pragma Exception_init(mi_excep,-00001); -- asocia ese error con mi objeto
   
begin
    insert into Regions (Region_id,region_name) values (1,'América');
exception
    when mi_excep then
        dbms_output.put_line('Clave duplicada,
intente otra');
    when others then
        dbms_output.put_line(SQLCODE); -- retorna el codigo error
        dbms_output.put_line(SQLERRM); -- mensaje de error
end;
/