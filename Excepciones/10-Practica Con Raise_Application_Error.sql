--          Práctica Con Raise_Application_Error
/*
1. Modificar la practica anterior para disparar un error con RAISE_APPLICATION
en vez de con PUT_LINE.
a. Esto permite que la aplicación pueda capturar y gestionar el error que
devuelve el PL/SQL
*/
set SERVEROUTPUT on;
declare
    my_excp Exception;
    regn number;
    regt varchar2(200);
begin
    regn:=101;
    regt:='Asia';
    if regn >100 then
        raise my_excp;
    else
    insert into regions values (regn,regt);
        commit;
    end if;
    
    EXCEPTION
    when my_excp then
        raise_application_error (-20000,'La id no puede ser mayor a 100');
    when others then
        dbms_output.put_line(SQLcode);
        dbms_output.put_line(SQLERRM);
end;