/*
1- Crear un bloque que inserte un nuevo departamento en la tabla
DEPARTMENTS. Para saber el DEPARTMENT_ID que debemos asignar al
nuevo departamento primero debemos averiguar el valor mayor que hay en la
tabla DEPARTMENTS y sumarle uno para la nueva clave.
• Location_id debe ser 1000
• Manager_id debe ser 100
• Department_name debe ser “INFORMATICA”
• NOTA: en PL/SQL debemos usar COMMIT y ROLLBACK de la misma
forma que lo hacemos en SQL. Por tanto, para validar definitivamente un
cambio debemos usar COMMIT.

*/
declare 
    departamento_id Departments.Department_id%type;
begin
    select
    max(department_id) into departamento_id
    from Departments;
    insert into Departments (department_id,department_name,manager_id,location_id)
    values (departamento_id+1,'INFORMATICA',100,1000); 
end;
/

/*
2- Crear un bloque PL/SQL que modifique la LOCATION_ID del nuevo
departamento a 1700. En este caso usemos el COMMIT dentro del bloque
PL/SQL
*/
declare 
    departamento_id Departments.Department_id%type;
begin
    select
    max(department_id) into departamento_id
    from Departments;
    update Departments set location_id=1700 where department_id=departamento_id; 
    commit;
end;
/*
3- Por último, hacer otro bloque PL/SQL que elimine ese departamento nuevo.
*/

declare 
    departamento_id Departments.Department_id%type;
begin
    select
    max(department_id) into departamento_id
    from Departments;
    delete from Departments where department_id=departamento_id; 
    commit;
end;