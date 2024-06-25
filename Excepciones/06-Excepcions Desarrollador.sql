-- Excepcions Desarrollador

set SERVEROUTPUT on;
declare
    reg_max exception;
    regn number;
    regt varchar2(200);
begin 
    regn:=101;
    regt:='Asia';
    if regn > 100 then
        -- disparar la excepción
        raise reg_max; -- lanzamos nuestra excepcion (desarrollador) cuando el valor sea mayor a 100
    else 
        insert into regions values (regn,regt); -- como no pasa, inserta el valor
        commit;    
    end if;
exception
    when reg_max then
        dbms_output.put_line('La región no puede ser mayor a 100');
    when others then
        dbms_output.put_line('Error indefinido');

end;