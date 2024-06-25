                        -- Práctica de Triggers
/*
1. Crear un TRIGGER BEFORE DELETE sobre la tabla EMPLOYEES que
impida borrar un registro si su JOB_ID es algo relacionado con CLERK
*/
create or replace trigger NoDeleteClerk
before
    delete
on Employees
for each row
when (Old.Job_id like '%CLERK%')
begin
    raise_application_error(-20000,'No se pueden borrar JOB_ID es algo relacionado con CLERK');
end; 
/
delete employees where Job_id like '%CLERK%';
/

-- 2. Crear una tabla denominada AUDITORIA con las siguientes columnas:
CREATE TABLE AUDITORIA (
    USUARIO VARCHAR(50),
    FECHA DATE,
    SALARIO_ANTIGUO NUMBER,
    SALARIO_NUEVO NUMBER);
/
/*
3. Crear un TRIGGER BEFORE INSERT de tipo STATEMENT, de forma que
cada vez que se haga un INSERT en la tabla REGIONS guarde una fila
en la tabla AUDITORIA con el usuario y la fecha en la que se ha hecho el
INSERT
*/
create or replace trigger Mod_Regions
before
    insert
on Regions
begin
    insert into auditoria values (user,sysdate,null,null);
end;
/
-- Probando
insert into Regions values (400,'España' );
select * from auditoria;


/*
4. Realizar otro trigger BEFORE UPDATE de la columna SALARY de tipo
EACH ROW.
    • Si la modificación supone rebajar el salario el TRIGGER debe
    disparar un RAISE_APPLICATION_FAILURE “no se puede bajar
    un salario”.
    • Si el salario es mayor debemos dejar el salario antiguo y el salario
    nuevo en la tabla AUDITORIA.
*/
create or replace trigger Up_Salario
before
    update
on Employees
for each row
begin
    if :New.Salary< :Old.Salary then
        raise_application_error(-20000,'No se pueden poner un salario menor');
    else 
        insert into auditoria values (user,sysdate,:Old.Salary,:New.Salary);
    end if;
end;
/
-- Probando
update Employees set salary=100000 where employee_id=205;
select * from auditoria;


/*
5. Crear un TRIGGER BEFORE INSERT en la tabla DEPARTMENTS que al
insertar un departamento compruebe que el código no esté repetido y
luego que si el LOCATION_ID es NULL le ponga 1700 y si el
MANAGER_ID es NULL le ponga 200
*/
create or replace TRIGGER nuevoDepartamento
before insert
on Departments
for each row
declare
    duplicado Departments.Department_id%type;
begin
    select department_id into duplicado from Departments where department_id = :New.department_id;
    raise_application_error(-20000,'Ya existe este id');
    
    Exception
    when no_data_found then
        if :new.location_id is null then
            :new.location_id:= 1700;
        end if;
        
        if :new.manager_id is null then
            :new.manager_id:=200;
        end if;
end;

/
insert into departments (department_id,department_name) values (280,'Maths');