/*
    Trabajar con la base de datos
*/

set SERVEROUTPUT on;

select json_object(datos) from productos1a;

declare
    json1 json_object_t;
    v1 varchar2(4000); -- variable para almacenar valor original
    resultado varchar(4000);-- variable para almacenar valor modificado
begin
    select datos into v1 from productos where codigo=1;
    dbms_output.put_line(v1); -- Para poder acceder a elemento json hay que almacenarlo en varchaer2
    
    -- para poder manipular lo modificamos a objeto json
    json1:=JSON_OBJECT_t(v1);
    
    --Agregamos un nuevo valor
    json1.put('col1','nuevo_valor');
    dbms_output.put_line(json1.to_string);
    
    -- Queremos almacenarlo a la base de datos
    resultado:=json1.to_string; -- convertimos nuestro json en un varchar
    -- Actualizo o lo que quiera en nuestra tabla
    update productos1a set datos=resultado where codigo=1;
end;
/