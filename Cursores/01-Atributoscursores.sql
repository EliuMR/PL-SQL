-- Cursores:
    -- Implíctios : Son generedos por ejemplo por un select, PL hace toda esa gestión
    -- Explícitos : Generados por el usuario

-- Atributos en cursores explicitos
    -- sql%isopen
    -- sql%found    : filas encontradas
    -- sql%notfound : 
    -- sql%rowcount : cuantos 
    
    -- cursor implícito ejemplo
set SERVEROUTPUT on;
begin
    update test set c2='GGGG' where c1=10;
    dbms_output.put_line(sql%rowcount); -- cuantos fueron actualizados 
    if sql%found then
        dbms_output.put_line('Encontrado');
    end if;
    if sql%notfound then
        dbms_output.put_line('No Encontrado');
    end if;
end;

    