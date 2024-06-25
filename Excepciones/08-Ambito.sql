-- Ambito de las excepciones
-- cuando declaro excepciones debe usarse en el ámbito que se quiere usar
declare
    reg_max exception;
    regn number;
    regt varchar2(200);
begin
    reg:=101;
    regt:='Asia';
    -- sub bloque
    begin
    -- declare reg_max exception; -- Si declaro la exception dentro de hijo no podrá verse la excepción fuera de dicho bloque, 
        if regn >100 then
            raise reg_max; -- como la variable de exception es global puede dispararse en bloques hijo
        else
            insert into regions values (regb,regt);
            commit;
        end if;
    /*Exception -- Excepción dentro del hijo
    when reg_max then
        dbms_output.put_line('La región no puede ser mayor a 100');*/
    end;
Exception
    when reg_max then
        dbms_output.put_line('La región no puede ser mayor a 100');
    when others then
        dbms_output.put_line('Error indefinido');
    
end;