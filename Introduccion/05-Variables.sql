-- Variable pl/sql

-- Almacenan valores durante el desarrollo de los programas
-- En sql no se pueden usar variables pero en pl/sql sí
-- Las variables se declaran e inicializan en la sección Declare del bloque

-- sintaxis
-- DECLARE
--    Nombre_variable tipo_dato;
-- podemos inicializar la variable con:=
--    Variable tipo_dato:=valor;
-- En la zona begin se utilizan como cualquier otro lenguaje de programación
-- varibles: escalares, compuestas, de referencia, large objetcs

SET SERVEROUTPUT ON
DECLARE
    NAME VARCHAR2(100);
    LASTNAME VARCHAR2(100);
BEGIN
    NAME:='Juan';
    lastname:='Pérez';
    DBMS_OUTPUT.PUT_LINE(name||' '||lastname);
END;


-- En SQL no existe variable boleana
-- pero pl/sql sí
declare 
    b1 boolean;
begin
-- una variable boleana puede tomar estos tres valores
    b1:=True;
    b1:=False;
    b1:=Null;
end;


-- Crear una varible que sea del tipo de otra variable, columna
-- %Type
declare
    x number;
    z x%TYPE; -- z es del mismo tipo que x
begin
 null;
end;