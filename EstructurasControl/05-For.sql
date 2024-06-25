-- Bucle for
-- especificamos de donde a dónde querremos el loop separado por dos puntos
-- la variable será pls integer usa menos memoria que number
-- la variable de for no se declara, y sólo puede usarse en el for, no fuera de él
-- funciona como dos bloques anidados
set SERVEROUTPUT on
begin
    for i in 1..10 loop -- pls integer
        dbms_output.put_line(i);
    end loop;
end;

-- reverse 
set SERVEROUTPUT on
begin
    for i in reverse 5..14 loop -- pls integer
        dbms_output.put_line(i);
    end loop;
end;

-- exit
set SERVEROUTPUT on
begin
    for i in reverse 5..14 loop -- pls integer
        dbms_output.put_line(i);
        exit when i=10;
    end loop;
end;

