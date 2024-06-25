/*
        3.3. TRIGGERS
    Triggers de tipo sentencia
        • Creamos 2 triggers de tipo SENTENCIA, uno para la tabla FACTURAS y otro para la tabla LINEAS_FACTURA
        • Cada cambio en alguna de las tablas (Insert, update, delete), debe generar una entrada en la tabla
        CONTROL_LOG con los datos siguientes:
            o Tabla (FACTURAS O LONEAS_FACTURA)
            o Fecha → usamos la función SYSDATE
            o Usuario que lo ha realizado → función USER
            o Operación realizada (I-U-D)
*/
create table log_Facturas   (
                            tabla varchar2(20),
                            fecha date,
                            usuario varchar2(20),
                            operacion_realizada char(1)
                            );
/

create or replace trigger facturas_trigger
before 
    insert or update or delete
    on Facturas
begin 
    if inserting then 
        insert into log_Facturas values ('Facturas',sysdate,user, 'I');
    end if;    
    if updating then 
        insert into log_Facturas values ('Facturas',sysdate,user, 'U');
    end if; 
    if deleting then 
        insert into log_Facturas values ('Facturas',sysdate,user, 'D');
    end if; 
end;
/
set serveroutput on;
begin
    Alta_factura(1,'26/06/2024','Venta');
end;
select * from log_Facturas;
set serveroutput on;
begin
    Mod_descri(0,'Compra');
end;
/

create or replace trigger Lineas_Facturas_trigger
before 
    insert or update or delete
    on Lineas_Factura
begin 
    if inserting then 
        insert into log_Facturas values ('Lineas facturas',sysdate,user, 'I');
    end if;    
    if updating then 
        insert into log_Facturas values ('Lineas facturas',sysdate,user, 'U');
    end if; 
    if deleting then 
        insert into log_Facturas values ('Lineas facturas',sysdate,user, 'D');
    end if; 
end;
/
begin
    Baja_linea(0,1);
end;
/
begin
    alta_linea(0,1,15,'24/06/2024');
end;
/
select * from log_facturas;




/*
Trigger de tipo fila
    • La columna TOTAL_VENDIDO, de la tabla PRODUCTOS mantiene el total de ventas de un determinado producto.
    • Para controlaro, creamos un Trigger de tipo fila sobre la tabla LINEAS_FACTURA, de forma que cada vez que
    se añada, cambie o borre una línea se actualice en la tabla PRODUCTOS la columna TOTAL_VENDIDO.
    • Si se inserta una nueva línea con ese producto, se debe añadir el total al campo.
    • Si se borra la línea debemos restar el total
    • Si se modifica, debemos comprobar si el valor antiguo era superior al nuevo y sumamos o restamos 
    dependiendo del resultado
*/

select * from lineas_factura;
/
create or replace trigger productos_vendidos_trigger
before
insert or update or delete
on Lineas_factura
for each row
declare
    cantidad number;
    resultado number;
begin
    
    if inserting then
        select NVL(Total_vendidos,0) into cantidad from Productos where cod_producto=:New.cod_producto;
        resultado:=cantidad+:New.unidades;
        update Productos set Total_vendidos=(resultado) where cod_producto=:New.cod_producto;
    end if;
    
    if deleting then
        select NVL(Total_vendidos,0) into cantidad from Productos where cod_producto=:old.cod_producto;
        resultado:=cantidad-:old.unidades;
        update Productos set Total_vendidos=(resultado) where cod_producto=:New.cod_producto;
    end if;
    
    if updating then
   -- :New.unidades>:old.unidades then
            select NVL(Total_vendidos,0) into cantidad from Productos where cod_producto=:old.cod_producto;
            resultado:=cantidad+(:New.unidades-:old.unidades );
            update Productos set Total_vendidos=(resultado) where cod_producto=:New.cod_producto;

    end if;
end;

/
-- Probando
select * from lineas_factura;
select * from Productos;
begin
    --alta_linea(0,5,1,'24/06/2024');
    Baja_linea(0,5);
    --Mod_producto(0,5,3);

end;
