/*
3.1. PAQUETE FACTURAS
PROCEDIMIENTOS
    • ALTA_FACTURA (COD_FACTURA, FECHA,DESCRIPCIÓN).
        o Debe dar de alta una factura con los valores indicados en los parámetros
        o Debe comprobar que no se duplica
*/
create or replace procedure Alta_factura (cod_factura_ in Facturas.cod_factura%type,
                                          fecha_ in Facturas.fecha%type,
                                          descripcion_ in Facturas.Descripcion%type)
as
    duplicado_codigo number;
    duplicados exception;
begin
    select count(*) into duplicado_codigo from Facturas where cod_factura=cod_factura_;
    if duplicado_codigo=0 then
        insert into Facturas values (cod_factura_,fecha_,descripcion_);
    else
        raise duplicados;
    end if;
    
    
    Exception
        when duplicados then
            dbms_output.put_line('El código ya se encuentra en la tabla');
        when others then
            dbms_output.put_line('Error desconocido');   
end;
/
set serveroutput on;
begin
    Alta_factura(0,'26/06/2024','Compra de resiltos 2 litros');
end;

/*
    • BAJA_FACTURA (cod_factura).
        o Debe borrar la factura indicada en el parámetros
        o Debe borrar también las líneas de facturas asociadas en la tabla LINEAS_FACTURA.
*/
create or replace procedure Baja_Factura(cod_factura_ in Facturas.cod_factura%type)
as

begin
    delete Facturas where cod_factura=cod_factura_;
    
    exception
        when no_data_found then
            dbms_output.put_line('Tal código no existe');
end;
/
set serveroutput on;
begin
    Baja_factura(0);
end;
/*
    • MOD_DESCRI(COD_FACTURA, DESCRIPCION).
        o Debe modificar la descripción de la factura que tenga el código del parámetro con la nueva 
    descripción
*/
/
create or replace procedure Mod_descri(cod_factura_ in Facturas.cod_factura%type,
                                        descripcion_ in Facturas.descripcion%type)
                                        
as

begin
    update Facturas set descripcion= descripcion_ where cod_factura=cod_factura_;
    
    exception
        when no_data_found then
            dbms_output.put_line('Tal código no existe');
end;

/
set serveroutput on;
begin
    Mod_descri(0,'Resistol 2 litros');
end;
/
/*
    • MOD_FECHA (COD_FACTURA,FECHA).
        o Debe modificar la descripción de la factura que tenga el código del parámetro con la nueva 
        fecha
*/
create or replace procedure Mod_fecha(cod_factura_ in Facturas.cod_factura%type,
                                        fecha_ in Facturas.fecha%type)
                                        
as

begin
    update Facturas set fecha= fecha_ where cod_factura=cod_factura_;
    
    exception
        when no_data_found then
            dbms_output.put_line('Tal código no existe');
end;

/
set serveroutput on;
begin
    Mod_fecha(0,'20/06/1990');
end;
/*
            FUNCIONES
    • NUM_FACTURAS(FECHA_INICIO,FECHA_FIN).
        o Devuelve el número de facturas que hay entre esas fechas
*/
create or replace function Num_facturas(fecha_inicio in Facturas.fecha%type,
                                        fecha_fin    in Facturas.fecha%type)
return number
as
cantidad_fechas number;
begin
    select count(*) into cantidad_fechas from Facturas where fecha between fecha_inicio and fecha_fin;
    return cantidad_fechas;
end;
/
set serveroutput on;
begin
    dbms_output.put_line('La cantidad de registros en dichas fechas son '||Num_facturas('19/06/1990','19/06/1991'));
end;
/
/*
    • TOTAL_FACTURA(COD_FACTURA.)
        o Devuelve el total de la factura con ese código. Debe hacer el sumatorio de “pvp*unidades”
        de las líneas de esa factura en la tabla LINEAS_FACTURA
*/
create or replace function Total_factura (cod_factura_ in Lineas_factura.cod_factura%type)
return number
as
precioPunidad number;
cantidad number;
begin
    select pvp into precioPunidad from Lineas_Factura where cod_factura_=cod_factura;
    select unidades into cantidad from Lineas_Factura where cod_factura_=cod_factura;
    return cantidad*precioPunidad;
    
    exception
        when no_Data_found then
            dbms_output.put_line('No datos con tal código');
end;

/
insert into Lineas_Factura values(0,0,25.5,15,'20/06/1990');
/
set serveroutput on;
begin
    dbms_output.put_line('El total de la factura con código '||0 ||' '||Total_factura(0));
end;