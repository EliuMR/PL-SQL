-- Arrays en Json
-- JSON_ARRAY_T : un objeto que representa un array json
-- Append, append_null, put, put_null

set SERVEROUTPUT on;

declare
    json1 json_array_t;
    v1 varchar2(4000); 
begin
    json1:=json_array_t('["bmw","vw","mercedes"]');
    dbms_output.put_line(json1.to_string);
    
    -- Ver el número de elementos
    dbms_output.put_line(json1.get_size);
    
    -- Recuperar el valor del array .get(posición)
    dbms_output.put_line(json1.get(0).to_string);
    
    for x in 0..json1.get_size-1 loop
        dbms_output.put_line(json1.get(x).to_string);
    
    end loop;
end;

/
--- Arrays de documentos
set SERVEROUTPUT on;

declare
    json1 json_array_t;
    v1 varchar2(4000); 
begin
     json1:=json_array_t('  [
                            {"ciudad" : "Madrid",
                            "concesionario":["bmw","vw","mercedes"]
                            }
                            ,
                            {
                            "ciudad" : "Valencia",
                            "concesionario":["honda","kia","audi"]
                            }
                            ]');
    -- recuperar un valor
    dbms_output.put_line(json1.get(0).to_string);
    
    --recuperar todos
    for x in 0..json1.get_size-1 loop
        dbms_output.put_line(json1.get(x).to_string);
    end loop;
end;


/

-- Más operaciones
set SERVEROUTPUT on;

declare
    json1 json_array_t;
    v1 varchar2(4000); 
begin
    json1:=json_array_t('["bmw","vw","mercedes"]');
    dbms_output.put_line(json1.to_string);
    
    -- Añadir un elemento
    json1.append('ford');
    dbms_output.put_line(json1.to_string);

    --Añadir un nulo
    json1.append_null();
    dbms_output.put_line(json1.to_string);
    
    -- Añadir en una posición
    json1.put(2,'Renault');
    dbms_output.put_line(json1.to_string);
    
    -- Eliminar un elemento
    json1.remove(2);
    
    
    --añadir array
    json1.put(3,json_array_t('["c1","c2","c3"]'));
    dbms_output.put_line(json1.to_string);
end;