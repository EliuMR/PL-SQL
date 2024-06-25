-- PUT JSON
-- Añadir y modificar json
-- Todos estos datos son temporales, se deben guardar


set SERVEROUTPUT on;

declare
    json1 json_object_t;
begin
    -- constructor
    json1:= JSON_OBJECT_t.parse('{"nombre":"alberto"}');
    dbms_output.put_line(json1.to_string);
    
    -- put
    -- escalares
    json1.put('edad',29);
    json1.put('telefono','222-222222');
    
    --documento anidado
    -- agregar como objeto json
    json1.put('direccion',json_object_t('{"calle":"rio","numero":5,"ciudad":"madrid"}'));
    
     dbms_output.put_line(json1.to_string);
     
     -- agregando array
     -- Que se debe agregar con un json array
     json1.put('experiencia',json_array_t('["excel","word","pp"]'));
     dbms_output.put_line(json1.to_string);
     
     
     -- Actualización, si no existe lo agrega la función put o actualiza
     json1.put('edad',45);
    dbms_output.put_line(json1.to_string);
    
    -- Renombrar clave
    json1.rename_key('nombre','nombre_completo');
    dbms_output.put_line(json1.to_string);
    
    -- borrar un elemento
    json1.remove('telefono');
end;    

/

