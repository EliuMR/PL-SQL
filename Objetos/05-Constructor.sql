-- Constructor

-- creamos una secuencia para el ejemplo
create sequence seq1;

create or replace type producto as object(
    -- Atributos
    codigo number,
    nombre varchar2(100),
    precio number,
    
    -- metodos
    member function ver_producto return varchar2,
    member function ver_precio return number,
    member PROCEDURE cambiar_precio (precio number), -- mismo nombre la variable que un atributo, para distinguir puede usarse self
    static procedure auditoria1,
    
    constructor function producto(n1 varchar2) return self as result  -- siempre el nombre de la clase
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

constructor function producto(n1 varchar2) return self as result 
is 
begin
    self.nombre:=n1;
    self.precio:=null;
    self.codigo:=seq1.nextval; -- siguiente valor de la secuencia
    return; -- return
end producto;

end producto;
/
-- Probando objeto
set serveroutput on;
declare
    v1 producto; -- variable
begin
    -- siempre tendremos el constructor con todos los parámetrs
    v1:=producto(100,'manzanas',10);  --instanciamos con el constructor para dar los valores que queremos
    dbms_output.put_line(v1.ver_precio());
    dbms_output.put_line(v1.ver_producto());
    v1.cambiar_precio(20); -- cambiamos el precio con un método
    dbms_output.put_line(v1.ver_precio());
    
    -- segundo constructor
    v1:=producto('manzanas');
    dbms_output.put_line(v1.ver_precio());
    dbms_output.put_line(v1.ver_producto());
    v1.cambiar_precio(20); -- cambiamos el precio con un método
    dbms_output.put_line(v1.ver_precio());
    producto.auditoria1(); -- mandamos a llamar al static, de esta manera
end;



