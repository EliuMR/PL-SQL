-- Update o Delates
-- Un cursos puede modificar al vuelo la fila de donde me encuentre en ese momento con update o delates
declare
    empl employees%rowtype;
    cursor cur is select * from employees 
    for update; -- La cláusula FOR UPDATE se utiliza en un cursor para bloquear las filas seleccionadas de modo que otras transacciones no puedan modificar esas filas mientras el cursor está abierto. 
begin 
    open cur;
    loop
        fetch cur into empl;
        if cur.commission_pct is not null then -- vamos a modificar el salario si cumple esa condición
            update employees set salary=salary*1.1 
                where current of cur; --  se utiliza en PL/SQL para referirse a la fila actual de un cursor en un bloque de PL/SQL. 
        else
            update employees set salary=salary*1.11
                where current of cur;
    end loop;

end;