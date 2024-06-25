-- Usar objetos con SQL

-- Usando el objeto de la práctica 09
create table tienda (
    codigo number,
    estantería number,
    producto producto -- de nuestro objeto
);

/

insert into tienda values(1,1,producto(20,'limon',90));
select * from tienda;
-- ver el precio de mi objeto, se debe usar un alias a la tabla
select t.producto.precio from tienda t;
select t.producto.ver_precio(20) from tienda t;