-- Recorriendo Cursor For
-- En un bucle for no es necesario el open, fetch ___ into ___, exit del cursor, se hace ímplicito
-- Sólo se puede usar el cursor dentro del bucle For

set SERVEROUTPUT on;
declare
    Cursor My_cursor is select * from Regions; -- creamos el cursos y apuntamos hacia la tabla que queremos
    v1 Regions%Rowtype;
begin
    open my_cursor; -- abrirmos el cursor
    loop
        fetch my_cursor -- leemos una fila del cursor
        into v1;        -- almacenamos dicha fila en una variable
        
        exit when my_cursor%notFound; -- preguntamos si ya no hay más filas del cursor sale del bucle
        
        dbms_output.put_line(v1.region_name);
    end loop;
    close my_cursor;-- cerramos el cursor
    
    ---------------------------
    ---Bucle For
    dbms_output.put_line('Bucle for:');
    for i in my_cursor loop
        dbms_output.put_line(i.region_name);
    end loop;
end;
/