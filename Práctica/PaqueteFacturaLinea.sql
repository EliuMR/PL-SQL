/*
3.2. PAQUETE LINEA_FACTURAS
PROCEDIMIENTOS
    • ALTA_LINEA (COD_FACTURA, COD_PRODUCTO, UNIDADES, FECHA)
        o Procedimiento para insertar una línea de Factura
        o Debe comprobar que existe ya la factura antes de insertar el registro.
        o También debemos comprobar que existe el producto en la tabla de PRODUCTOS.
        o El PVP debemos seleccionarlo de la tabla PRODUCTOS
*/
create or replace procedure 
                Alta_linea( cod_factura_ in Lineas_factura.cod_factura%type,
                            cod_producto_ in Lineas_factura.cod_producto%type,
                            unidades_ in Lineas_factura.unidades%type,
                            fecha_ in Lineas_factura.fecha%type)
as
codigo_factura number;
producto_ number;
no_existe_cod_factura exception;
no_existe_producto exception;
pvp_ productos.pvp%type;
begin
    select count(*) into codigo_factura from Facturas where cod_factura=cod_factura_;
    select count(*) into producto_ from Productos where cod_producto=cod_producto_;
    
    if codigo_factura=1 then
        if producto_=1 then 
            select pvp into pvp_ from Productos where cod_producto=cod_producto_;
            insert into Lineas_factura values(cod_factura_,cod_producto_,pvp_,unidades_,fecha_);
        else
            raise no_existe_producto;
        end if;
    else
        raise no_existe_cod_factura;
    end if;
    Exception
        when no_existe_cod_factura then
            dbms_output.put_line('Este código no existe');
        when no_existe_producto then
            dbms_output.put_line('No existe ese producto');
end;

/
begin
    alta_linea(0,5,15,'24/06/2024');
end;
/
/*
    • BAJA_LINEA (cod_factura, COD_PRODUCTO
        o Damos de baja la línea con esa clave primaria)
*/
create or replace procedure BAJA_LINEA( cod_factura_    in Lineas_factura.cod_factura%type,
                                        cod_producto_   in Lineas_factura.cod_producto%type)
as

begin
    delete from Lineas_factura where cod_factura=cod_factura_ and cod_producto=cod_producto_;
    
    exception
        when no_data_found then
            dbms_output.put_line('No existe tal llave primaria');
end;
/
set serveroutput on;
begin
    Baja_linea(0,0);
end;
/*
    • MOD_PRODUCTO(COD_FACTURA,COD_PRODUCTO,PARAMETRO)
        o Se trata de 2 métodos sobrecargados, es decir el segundo parámetro debe admitir los siguientes
        valores:
            ▪ MOD_PRODUCTO(COD_FACTURA,COD_PRODUCTO, UNIDADES)
            ▪ MOD_PRODUCTO(COD_FACTURA,COD_PRODUCTO, FECHA)
        o Por tanto, debe modificar o bien unidades si se le pasa un NUMBER o bien la fecha si se le pasa 
        un DATE
    FUNCIONES
• NUM_LINEAS(COD_FACTURA)
o Devuelve el número de líneas de la factura
*/
create or replace procedure Mod_producto( cod_factura_ in Lineas_factura.cod_factura%type,
                                cod_producto_ in Lineas_factura.cod_producto%type,
                                unidades_ in Lineas_factura.unidades%type)
as
begin
    update Lineas_factura set unidades=unidades_ where cod_factura=cod_factura_ and cod_producto=cod_producto_;
    exception
        when no_data_found then
            dbms_output.put_line('No primary key');
end;
/
create or replace procedure Mod_producto( cod_factura_ in Lineas_factura.cod_factura%type,
                                cod_producto_ in Lineas_factura.cod_producto%type,
                                fecha_ in Lineas_factura.fecha%type)
as
begin
    update Lineas_factura set fecha=fecha_ where cod_factura=cod_factura_ and cod_producto=cod_producto_;
    exception
        when no_data_found then
            dbms_output.put_line('No primary key');
end;

/
begin
    Mod_producto(0,1,'11/01/2024');
end;