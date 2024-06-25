-- Crear dos variables de tipo numérico y visualizar su suma
set SERVEROUTPUT on
declare
    x number not null :=10;
    y number not null :=20;
    RESULTADO NUMBER;
begin
    RESULTADO:=x+y;
    dbms_output.put_line('Resultado dos números');
    dbms_output.put_line(RESULTADO);
end;

-- Modificar el ejemplo anterior y ponemos null como valor de una de las 
-- variables. ¿Qué resultado arroja? Volvemos a ponerla un valor numérico
set SERVEROUTPUT on
declare
    x number not null :=10;
    y number :=null;
begin
    dbms_output.put_line('Resultado dos números');
    dbms_output.put_line(x+y);
    y:=10;
    dbms_output.put_line(x+y);
end;

-- Añadir una constante al ejercicio. Sumamos las 2 variables y la 
-- constantes. Intentar modificar la constante. ¿Es posible?
set SERVEROUTPUT on
declare
    x number not null :=10;
    y constant number :=20;
begin
    dbms_output.put_line('Resultado dos números');
    dbms_output.put_line(x+y);
end;

-- Crear un bloque anónimo que tenga una variable de tipo VARCHAR2 con 
-- nuestro nombre, otra numérica con la edad y una tercera con la fecha de 
-- nacimiento. Visualizarlas por separado y luego intentar concatenarlas. ¿es 
-- posible?
set SERVEROUTPUT on
declare 
    nombre VARCHAR2(10);
    edad number;
    fecha date;
begin
    fecha:=TO_DATE('2000-05-21', 'YYYY-MM-DD');
    edad:=10;
    nombre:='Juan';
    dbms_output.put_line(nombre||' '||edad||' '||fecha);
    
end;

/*
 Queremos calcular el impuesto de un producto
    o El impuesto será del 21%. Le debemos poner en una constante
    o Creamos una variable de tipo number (5,2) para poner el precio del 
    producto
    o Creamos otra variable para el resultado. Le decimos que es del 
    mismo tipo (type) que la anterior
    o Hacemos el cálculo y visualizamos el resultado
*/
set SERVEROUTPUT on
declare
    impuesto constant number:=21;
    precioProducto number (5,2);
    resultado PrecioProducto%TYPE;
begin
    precioProducto:=100.2;
    resultado:=(precioproducto*impuesto)/100;
    dbms_output.put_line('El impuesto es '||resultado);
end;