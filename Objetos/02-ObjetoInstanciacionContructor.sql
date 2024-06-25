create or replace type producto as object(
    -- Atributos
    codigo number,
    nombre varchar2(100),
    precio number,
    
    -- metodos
    member function ver_producto return varchar2,
    member function ver_precio return number,
    member PROCEDURE cambiar_precio (pvp number)

);

/

create or replace type body producto as

member function ver_producto
return varchar2 
as
begin 
    return 'Codigo: '||codigo||' nombre '||nombre||' precio '||precio; 
end ver_producto;

member function ver_precio return number as
begin
    return precio;
end ver_precio;

member procedure cambiar_precio(pvp number)
as
begin
    precio:=pvp;
end cambiar_precio;

end producto;
/

-- Probando objeto
set serveroutput on;

declare
    v1 producto; -- variable
begin
    v1:=producto(100,'manzanas',10);  --instanciamos con el constructor para dar los valores que queremos
    dbms_output.put_line(v1.ver_precio());
    dbms_output.put_line(v1.ver_producto());
    v1.cambiar_precio(20); -- cambiamos el precio con un método
    dbms_output.put_line(v1.ver_precio());
    v1.nombre:='pera';
    dbms_output.put_line(v1.ver_producto());
end;