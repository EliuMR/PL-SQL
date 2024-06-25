/*
    is json
    is not json
*/
-- Con 21c si usamos el tipo de datos json no es necesario preguntar si es json



-- Supongamos que tenemos una tabla con un campo fichero en el que puede guardar un csv
-- json, etc. No podemos restringircreate table ejemplo(
    codigo int,
    fichero clob
);
/

insert into ejemplo values(1,'{"col1" : "prueba"}');

insert into ejemplo values(2,'Esto es una prueba');

insert into ejemplo values(3,'<doc><col1>prueba</col1></doc>');

-- recuperar aquellos que sean json
select * from Ejemplo where fichero is json;

-- recuperar aquellos que no sean json
select * from Ejemplo where fichero is not json;