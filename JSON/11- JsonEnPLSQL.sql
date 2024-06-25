-- Json en PL/SQL

set SERVEROUTPUT on;

declare
    c1 varchar2(400);
begin
    select prod1.datos.poblacion into c1 from productos1a prod1 where codigo=2;
    dbms_output.put_line(c1);
    
    -- Recuperar un valor de pais
    select json_value(prod1.datos,'$.pais') into c1 from productos1a prod1 where codigo=2;
    dbms_output.put_line(c1);
    
    -- Calle
    select json_value(prod1.datos,'$.direccion.calle') into c1 from productos1a prod1 where codigo=2;
    dbms_output.put_line(c1);
   
   -- Dirección con querry 
    select json_query(prod1.datos,'$.direccion') into c1 from productos1a prod1 where codigo=3;
    dbms_output.put_line(c1);
    
    
    select json_transform(datos, rename '$.poblacion'='pob') into c1 from productos1a prod1 where codigo=2;
    dbms_output.put_line(c1);
end;    

/

