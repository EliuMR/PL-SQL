-- Sobreescribir métodos
-- Se realiza en el objeto hijo con overriding

create or replace type producto as object(
    -- Atributos
    codigo number,
    nombre varchar2(100),
    precio number,
    
    -- metodos
    member function ver_producto return varchar2,
    
    -- sonrecarga
    member function ver_precio (impuestos number) return number, -- ver precio menos impuestos
    member function ver_precio return number,
    
    member PROCEDURE cambiar_precio (precio number), -- mismo nombre la variable que un atributo, para distinguir puede usarse self
    static procedure auditoria1,
    
    constructor function producto(n1 varchar2) return self as result  -- siempre el nombre de la clase
)not final; -- para poder heredar


/




create or replace type body producto as

member function ver_producto
return varchar2 
as
begin 
    return 'Codigo: '||codigo||' nombre '||nombre||' precio '||precio; 
end ver_producto;

member function ver_precio (impuestos number) return number as
begin
    return precio-precio*impuestos/100;
end ver_precio;


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

-- Hijo

create or replace type comestibles under producto(
    caducidad date,
    member function ver_caducidad return varchar2,
    
    overriding member function ver_precio return number -- REESCRIBIMOS UNA FUNCIÓN DE PADRE
)
/

create or replace type body comestibles as

member function ver_caducidad return varchar2 as
begin
    return caducidad;
end;

overriding member function ver_precio return number 
as begin
    return precio+10;
end;
end;
/


-- Probando
declare
v1 comestibles:=comestibles(99,'Tornillos',20,sysdate()); -- hay que declarar todos los atributos de padre e hijo
begin
    dbms_output.put_line(v1.ver_precio());
    dbms_output.put_line(v1.ver_caducidad());
end;