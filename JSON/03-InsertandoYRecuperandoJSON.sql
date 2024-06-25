-- Usando el script 02-JSON21C
-- Para acceder a los valores de json dentro de un tabla se necesita dar un alias 
select pro.datos.pais from productos1 pro;

/
-- insertaremos valores en el campo json para ver que no deben tener la misma estructura todos los datos de dicho tipo dentro de la tabla
insert into productos1
values (2,'ejemplo2',
'{
        "pais"      : "Argentina",
        "ciudad"    : "Buenos Aires",
        "población" : 10000,
        "direccion" : {
                        "calle":    "manzanares",
                        "piso":     5,
                        "puerta":   "c",
                        
                        }
}'
)

/
select prod1.datos.direccion.puerta from productos1 prod1;


-- insertando un array
insert into productos1
values (3,'ejemplo3',
'{
        "pais"      : "Franci",
        "ciudad"    : "Paris",
        "población" : 10000,
        "direccion" : {
                        "calle":    "rios",
                        "piso":     5,
                        "puerta":   "c",
                        
                        },
        "telefono"  :   ["111-111111","222-222222"]
}'
)

/
select * from productos1;
/
-- obtener el array llamado telefono
select prod1.datos.telefono from productos1 prod1;
-- acceder un elemento dentro del array
select prod1.datos.telefono[0] from productos1 prod1;