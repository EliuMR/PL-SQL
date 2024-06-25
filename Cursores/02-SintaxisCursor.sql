-- Ciclo de vida de un cursor
--Base de datos Oracle --> Declarar cursor (Select) --> Abrir cursor --> Leer fila del cursor--> Fin de cursor = ? --> Sí --> cerrar el cursor
--                                                                                        ^_ _ _ _ _ _ | No     


-- En oracle no podemos ir para adelante y hacia atras, solo permiten leer hacia adelante
-- Si quisieramos eso se usan tablas o array

-- 4 pasos del cursor; declarar, abrir, leer, cerrar el cursor
set SERVEROUTPUT on;
declare
    Cursor My_cursor is select * from Regions; -- creamos el cursos y apuntamos hacia la tabla que queremos
    v1 Regions%Rowtype;
begin
    open my_cursor; -- abrirmos el cursor
    fetch my_cursor -- leemos una fila del cursor
    into v1;        -- almacenamos dicha fila en una variable
    dbms_output.put_line(v1.region_name);
    close my_cursor;-- cerramos el cursor
end;
/