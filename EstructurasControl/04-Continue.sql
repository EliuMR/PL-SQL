-- continue, retorne al inicio hasta que se termine una condición dentro de un bucle
-- tener control del bucle
set SERVEROUTPUT on
declare
    x number:=0;
begin
    loop -- con continue saltamos aquí
        dbms_output.put_line('Loop: x= '||to_char(x));
        x:=x+1;
        -- if x<3 then
        --     continue;
        -- end if;
        continue when x<3; -- otra forma más sencilla de continue
        
        dbms_output.put_line ('Después de continue x = '||to_char(x));
        exit when x=5;
        end loop;
        dbms_output.put_line('Después del loop x= '||to_char(x));
end;        