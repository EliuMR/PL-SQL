/*
    Modificar Json con Json_transform. Solo en 21c
    
        SET         Actualizar un elemente si no existe lo crea
        INSERT      Insertar un elemento que no existe
        APPEND      Añade un elemento al ainfal de un arrau
        REMOVE      Borrar un elemento incluido dentro de un array
        REPLACE     Como set pero si el elemento no existe no lo crea
        KEEP        Elimina todos los elementos salvo los que están en la lista
*/

-- Usando 05-JSON_exists

-- json_transform toma los datos que se encuentran dentro de sus valores, actualiza con el segundo elemento 
-- y los guarda en lo que esté igualado

-- En este ejemplo modificamos la población de elemento con código 1 (SET)
update productos set datos=json_transform(datos,set '$.poblacion'=90000) where codigo =1;

-- Visualización de la transformación pero no estamos update, por lo que la base de datos no se ve comprometida
select JSON_TRANSFORM(datos,set '$.poblacion'=1000) from productos1;
select JSON_TRANSFORM(datos,set '$.poblacion1'=1000) from productos1; -- si el valor no existe lo agrega

-- Insertando un valor, si la columna existe da error
select JSON_TRANSFORM(datos,insert '$.tipo'='tipo1') from productos1;

-- Append, insertar un valor al final de un contenido, este trabaja con arrays, donde exista tal array
select JSON_TRANSFORM(datos,set '$.telefonos'='333-3333333') from productos1 where codigo=3;
-- Se podría realizar de igual manera con insert
select JSON_TRANSFORM(datos,insert '$.telefonos[3]'='333-3333333') from productos1 where codigo=3;

-- Rename, cambiar el nombre de una columna
select JSON_TRANSFORM(datos,rename '$.población'='Pob') from productos1;

-- Replace, similar al set pero si no existe el valor da un error
select JSON_TRANSFORM(datos,replace '$.población'=1) from productos1;

-- Remove, eliminamos un campo
select JSON_TRANSFORM(datos,remove '$.población') from productos1;
select JSON_TRANSFORM(datos,remove '$.direccion.calle') from productos1 where codigo=3;

-- Keep
-- Eliminame todo menos direccion.calle
select JSON_TRANSFORM(datos,keep '$.direccion.calle') from productos1 where codigo=3;

-- Multiple
select JSON_TRANSFORM(datos,set '$.poblacion'=1000,
                            insert '$.direccion.codigo'=72120,
                            rename '$.direccion.calle'='via') from productos1 where codigo=3;
