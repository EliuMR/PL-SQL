/*
 Devolver un valor único de tipo escalar
 JSON_exists(campo_json,expresion_json,on_error)
*/

drop table productos1a;

create table productos1a(
    codigo int,
    nombre varchar2(200),
    datos json
);
insert into productos1a
values(1, 'ejemplo1',
'
{
    "pais" : "Argentina",
    "ciudad": "Buenos Aires",
    "poblacion": 10000

}
'
);

insert into productos1a
values(2, 'ejemplo2',
'
{
    "pais" : "Argentina",
    "ciudad": "Buenos Aires",
    "poblacion": 10000,
    "direccion":
                    {
                    "calle" : "Casas",
                    "piso"  : 5,
                    "puerta": "c"
                     }
}
'
);

insert into productos1a
values(3, 'ejemplo3',
'
{
    "pais" : "Francia",
    "ciudad": "Paris",
    "poblacion": 10000,
    "direccion":
                    {
                    "calle" : "Casas",
                    "piso"  : 5,
                    "puerta": "c"
                     },
    "telefonos": ["111-11111","222-222222"]
}
'
);


insert into productos1a
values(4, 'ejemplo4',
'
{
    "pais" : "Italia",
    "ciudad": "Roma",
    "poblacion": 10000,
    "direccion":
                    {
                    "calle" : "Casas",
                    "piso"  : 2,
                    "puerta": ""
                     },
    "telefonos": ["111-11121","222-222212"]
}
'
);

insert into productos1a
values(5, 'ejemplo5',
'
{
    "pais" : "Inglaterra",
    "ciudad": "Londres",
    "poblacion": 100001,
}
'
);


select * from productos1a;


/

-- Distintas opciones de buscada con exists (Patrones dentro de JSON)

-- Aquellos que tengan atributo ciudad
select prod1a.datos from productos1a prod1a where json_exists(prod1a.datos,'$.ciudad');

-- Aquellos que tengan atributo direccion
select prod1a.datos from productos1a prod1a where json_exists(prod1a.datos,'$.direccion.calle');

select prod1a.datos from productos1a prod1a where json_exists(prod1a.datos,'$.telefonos');

select prod1a.datos from productos1a prod1a where json_exists(prod1a.datos,'$.telefonos[2]');