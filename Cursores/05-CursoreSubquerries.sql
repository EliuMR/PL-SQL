-- Bucles con subconsultas

set SERVEROUTPUT on;

begin
    ---------------------------
    ---Bucle For
    dbms_output.put_line('Bucle for:');
    for i in (select * from Regions) loop -- abrimos un cursor directamente en el for, no es necesario declarar el cursor explicitamente
        dbms_output.put_line(i.region_name);
    end loop;
end;
-- No es posible usar ese cursor fuera de, pero cuando es una sóla vez puede ser suficiente