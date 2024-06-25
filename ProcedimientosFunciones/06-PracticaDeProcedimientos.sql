            -- Práctica de PROCEDIMIENTOS Y PARÁMETROS
/*
1- Crear un procedimiento llamado “visualizar” que visualice el nombre y
salario de todos los empleados.
*/
create or REPLACE procedure visualizar
is
    Cursor empleados is select * from Employees;
    empl Employees%rowtype;
begin 
    for i in empleados loop
        empl:=i;
        dbms_output.put_line(empl.first_name);
    end loop;
end;
/
begin
    visualizar;
end;
/

/*
2- Modificar el programa anterior para incluir un parámetro que pase el
número de departamento para que visualice solo los empleados de ese
departamento
    • Debe devolver el número de empleados en una variable de tipo OUT
*/

create or REPLACE procedure visualizar_depto
                    (
                    departamento in Employees.department_id%type,
                    cantidad out number)
is
    Cursor empleados is select * from Employees where department_id=departamento;
    empl Employees%rowtype;
begin 
    
    open empleados;
        loop
            fetch empleados into empl;
            EXIT WHEN empleados%NOTFOUND;
            dbms_output.put_line(empl.first_name);
        end loop;
        cantidad:=empleados%ROWCOUNT;
    close empleados;
end;
/
set serveroutput on;
declare
    a number;
    b number;
begin
    a:=50;
    b:=0;
    visualizar_depto(a,b);
    dbms_output.put_line('La cantidad con id department '|| a ||' son '||b);
end;
/
/*
3- Crear un bloque por el cual se de formato a un número de cuenta
suministrado por completo, por ejmplo: 11111111111111111111
    • Formateado a: 1111-1111-11-1111111111
    • Debemos usar un parámetro de tipo IN-OUT
*/
create or REPLACE procedure Formato(
                        numero in out varchar2)
is
    n1 varchar2(4);
    n2 varchar2(4);
    n3 varchar2(2);
    n4 varchar2(10);
begin 
    n1:=substr(numero,1,4);
    n2:=substr(numero,5,4);
    n3:=substr(numero,9,2);
    n4:=substr(numero,11,10);
    numero:=n1||'-'||n2||'-'||n3||'-'||n4;
end;
/
set SERVEROUTPUT on;
declare
numero varchar2(25);
begin
    numero:='11111111111111111111';
    Formato(numero);
    dbms_output.put_line(numero);
end;

