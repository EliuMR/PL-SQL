/*
    JSON_QUERY(campo_json,expresion_json,on_error)
    permite devolver un valor, un array o sub-documentos aninado
*/
-- Usando 05-JSON_exists

select datos from productos1a;

/

-- Acceder a un valor simple
select json_query(prod1.datos,'$.pais') from productos1a prod1;

-- Campo anidado
select json_query(prod1.datos,'$.direccion') from productos1a prod1;

-- Valor de un campo anidado
select json_query(prod1.datos,'$.direccion.piso') from productos1a prod1;

-- Un array
select json_query(prod1.datos,'$.telefonos') from productos1a prod1;

-- Valor de un array
select json_query(prod1.datos,'$.telefonos[0]') from productos1a prod1;
