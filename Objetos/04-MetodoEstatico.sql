-- Método estático
-- A nivel de clase
--  métodos globales independientemente del objeto

-- Tabla para el ejemplo
create table auditoria1 (usuario varchar2(100), fecha date);
select * from auditoria1;

create or replace type producto as object(
    -- Atributos
    codigo number,
    nombre varchar2(100),
    precio number,
    
    -- metodos
    member function ver_producto return varchar2,
    member function ver_precio return number,
    member PROCEDURE cambiar_precio (precio number), -- mismo nombre la variable que un atributo, para distinguir puede usarse self
    static procedure auditoria1
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

member procedure cambiar_precio(precio number)
as
begin
    self.precio:=precio; -- disntinguimos la variable de la columna
end cambiar_precio;

static procedure auditoria1
as
begin
    insert into auditoria1 values(user,sysdate);
end auditoria1;

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
    
    producto.auditoria1(); -- mandamos a llamar al static, de esta manera
end;

select * from auditoria1;