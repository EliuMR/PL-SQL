-- GET
declare
    json1 json_object_t;
    v1 varchar2(400); -- variable que me permitirá recuperar valores
    
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
    
    
    
    
    -- serialización
    -- Recuperar valores concretos
        -- Hay varios tipos de get, debemo saber si lo que queremos recuperar es numero, string, etc
    v1:=json1.get_string('nombre_completo');
    dbms_output.put_line(v1);
    
    -- Recuperar un elemento complejo, en este caso dirección
    -- Accedemos primero al sudocumento y ahí al campo
    v1:=json1.get_object('direccion').get_string('calle');
    dbms_output.put_line(v1);
end;    
