-- Recorriendo Cursor loop

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
end;
/