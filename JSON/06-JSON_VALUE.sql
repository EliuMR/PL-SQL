/*
    JSON_VALUE (campo_json,expresion_json)
    devuelve un valor único de tipo escalar
*/

-- Usando 05-JSON_exists

select datos from productos1a;

/

-- Los paises de cada  una de las filas de los documentos de JSON, recordar que solo retorna escalares, no campos compuestos
select json_value(prod1.datos,'$.pais') from productos1a prod1;

-- Las calles 
select json_value(prod1.datos,'$.direccion.calle') from productos1a prod1;

-- No podríamos acceder a un array pero sí a elementos
select json_value(prod1.datos,'$.telefonos[0]') from productos1a prod1;
