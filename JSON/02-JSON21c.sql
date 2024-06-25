-- JSON en 21c y anteriores

create table productos1
(   codigo int,
    nombre varchar2(200),
    datos json); -- campo es json
/


insert into productos1 values (1,'ejemplo', 
-- documento json que agreagamos a la tabla
' 
    {
        "pais"      : "Argentina",
        "ciudad"    : "Buenos Aires",
        "población" : 10000,
    }
');

/
select * from productos1;