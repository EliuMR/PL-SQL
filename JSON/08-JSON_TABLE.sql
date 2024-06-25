/*
    JSON_TABLE
    (campo_json,mapeo_de_columnas)
    
    Permite convertir datos JSON a relacionales
*/

-- Usando 05-JSON_exists


-- Querer sacar el pais como columna
select j_pais from productos1a prod1,json_table(prod1.datos,'$' COLUMNS (j_pais path '$.pais') );

-- Querer sacar pais y ciudad
select j_pais,j_ciudad from productos1a prod1,json_table(prod1.datos,'$' COLUMNS (j_pais path '$.pais', j_ciudad path '$.ciudad') );

-- No es posible recuperar aquellos que tienen valores anidados como dirección pero sí un valor de ésta como la calle
select j_pais,j_ciudad,j_direccion from productos1a prod1,json_table
(prod1.datos,'$' COLUMNS 
    (j_pais path '$.pais',
    j_ciudad path '$.ciudad',
    j_direccion path '$.direccion.calle') );

