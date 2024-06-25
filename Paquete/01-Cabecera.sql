                            -- Paquetes:
    -- Concepto similar al de paqueterías en lenguajes de programación:
    -- Almacenar otros objetos: como objetos, variables, funciones.
    -- Para una mejor organización
  -- Formado por dos componenetes:
    -- SPEC: Cabececera, variables pública-declaraciones, no hay código
    -- BODY: Variables privadas, código de los objetos declarados en spec
-- Orientación a objetos

-- Paquete
Create or replace package Pack1
-- Cabecera
is
    v1 number;
    v2 varchar2(200);
    
end;
/
-- para interactuar con el paquete hay que poner el camino nombre_paquete.objeto 
set serveroutput on;
begin 
    Pack1.V1:=100;
    dbms_output.put_line(Pack1.V1);
    Pack1.V2:='AAAA';
    dbms_output.put_line(Pack1.V2);
end;