/*
1. PRÁCTICA 1
• Crear un bloque PL/SQL que devuelva al salario máximo del
departamento 100 y lo deje en una variable denominada salario_maximo
y la visualice
*/
set SERVEROUTPUT on;
declare salario_max employees.salary%type;
begin
    select 
    max(salary) into salario_max
    from 
    Employees
    where Department_id=100;
    dbms_output.put_line(salario_max);
end;

/*
2. PRÁCTICA2
• Visualizar el tipo de trabajo del empleado número 100
*/
set SERVEROUTPUT on;
declare trabajo employees.job_id%type;
begin
    select job_id into trabajo
    from Employees
    where employee_id=100;
    dbms_output.put_line(trabajo);
end;

/*
3. PRÁCTICA 3
• Crear una variable de tipo DEPARTMENT_ID y ponerla algún valor, por
ejemplo 10.
• Visualizar el nombre de ese departamento y el número de empleados
que tiene, poniendo. Crear dos variables para albergar los valores.
*/
Set Serveroutput On;

Declare 
    Cantidad Number;
    Valor_Departamento Employees.Department_Id%Type := 10;
Begin 
    Select Count(*) Into Cantidad
    From Employees    
    Where Department_Id = Valor_Departamento;

    Dbms_Output.Put_Line('Cantidad de empleados en el departamento ' || Valor_Departamento || ': ' || Cantidad);
End;

/*
4. PRÁCTICA 4
• Mediante dos consultas recuperar el salario máximo y el salario mínimo 
de la empresa e indicar su diferencia
*/
Set Serveroutput On
Declare
    Maximo Employees.Salary%Type;
    Minimo Employees.Salary%Type;
Begin
    Select
    Max(Salary),
    Min(Salary)
    Into
    Maximo,
    Minimo
    From Employees;
    Dbms_Output.Put_Line(Maximo-Minimo);
End;