-- Raise Application Error
-- Para asignar codigo de error y mensajes propios
-- errores graves
-- El código de error debe estar entre -20000 y -20999
set SERVEROUTPUT on;
declare
    regn number;
    regt varchar2(200);
begin
    regn:=101;
    regt:='Asia';
    if regn >100 then
        raise_application_error (-20000,'La id no puede ser mayor a 100');
    else
    insert into regions values (regn,regt);
        commit;
    end if;
end;