--          PRÁCTICA CON EXCEPCIONES DE USUARIO
/*
1- Crear una Excepción personalizada denominada
CONTROL_REGIONES.
• Debe dispararse cuando al insertar o modificar una región
queramos poner una clave superior a 200. Por ejemplo usando una
variable con ese valor.
• En ese caso debe generar un texto indicando algo así como
“Codigo no permitido. Debe ser inferior a 200”
• Recordemos que las excepciones personalizadas deben
dispararse de forma manual con el RAISE.
*/
set SERVEROUTPUT on;
declare
    my_excep EXCEPTION;
    clave Regions.region_id%type;
    nombre Regions.region_name%type;
begin
    clave:=201;
    nombre:='Oceania';
    
    if clave>200 then
        raise my_excep;
    else 
        insert into Regions (region_id,region_name) values (clave,nombre);
    end if;
    Exception
        when my_excep then
            dbms_output.put_line('Debe ser inferior a 200');
        when others then
            dbms_output.put_line('Error');
    
end;