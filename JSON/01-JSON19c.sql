-- JSON en 19c y anteriores

create table productos 
(   codigo int,
    nombre varchar2(200),
    datos varchar2(4000)
constraint x1 check (datos is JSON)); -- si un campo es json o no, restringiendo que el contenido sea JSON
/


insert into productos values (1,'ejemplo', 
-- documento json que agreagamos a la tabla
' 
    {
        "pais"      : "Argentina",
        "ciudad"    : "Buenos Aires",
        "población" : 10000,
    }
');

/
select * from productos;