-- Goto
--  para saltarse a cierta linea con un alías
-- no recomendable
-- sólo en caso de muchos bloques anidados

-- codigo para verificar si es primo
declare
    p VARCHAR2(30);
    n PLS_INTEGER :=4;
begin
    for j in 2..round(sqrt(n)) loop
    if n mod j=0 then
        p:= ' no es número primo'; 
        goto print_now;
    end if;
    end loop;
    
    p:=' Es primo';
    <<print_now>>
    dbms_output.put_line(to_char(n)||p);
end;