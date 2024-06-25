/*
    Modificar Json
    
    -- Antes de las 19c, había que modificar todo el campo completo
    -- En la 19c aparece json_mergepatch para actualizar trozos
    -- En la 21c aparece json_transform más potente, agregar arrays etc.
*/

-- Usando 05-JSON_exists
                
select * from productos1a;

-- Para antes de la 19c, se tenía que modificar todo el json para uno existente
    -- Modificar la población
    update productos1a set datos=
    '
    {
        "pais": "Argentina",
        "ciudad": "Buenos Aires",
        "poblacion" : 20000
    }
    ' where codigo=1;

-- En 19c
    -- Agregando datos de json
    UPDATE productos1a 
    SET datos = JSON_MERGEPATCH(
        datos,
        '{
        "estado": true,
        "C1": 10
        }'
    ) 
    WHERE codigo = 1;
    -- Actualizar datos, buscando el atributo que se llame como el que queramos modficar y lo cambia por el nuevo valor
    UPDATE productos1a 
    SET datos = JSON_MERGEPATCH(
        datos,
        '{
        "estado": false
        }'
    ) 
    WHERE codigo = 1;