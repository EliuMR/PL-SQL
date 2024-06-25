/*
Operaciones reaacionales
= igual
<> Diferente
< menor
> mayor
>= mayor o igual
<= menor o igual
Operaciones lógicos
AND
NOT
OR
*/
-- estrucura if
DECLARE
    x NUMBER := 20;
BEGIN
    IF x = 10 THEN
        dbms_output.put_line('x:=10');
    ELSE
        dbms_output.put_line('x:= other value');
    END IF;
END;

-- elseif
set SERVEROUTPUT on

DECLARE
    sales NUMBER := 20000;
    bonus NUMBER := 0;
BEGIN
    IF sales > 50000 THEN
        bonus := 1500;
    ELSIF sales > 35000 THEN
        bonus := 500;
    ELSE
        bonus := 100;
    END IF;

    dbms_output.put_line(bonus);
END;

-- Práctica
/*

1. PRÁCTICA 1
• Debemos hacer un bloque PL/SQL anónimo, donde declaramos una variable
NUMBER y la ponemos algún valor.
• Debe indicar si el número es PAR o IMPAR. Es decir debemos usar IF..... ELSE
para hacer el ejercicio
• Como pista, recuerda que hay una función en SQL denominada MOD, que
permite averiguar el resto de una división.
• Por ejemplo MOD(10,4) nos devuelve el resto de dividir 10 por 4.

*/
set SERVEROUTPUT on
declare
    variable_ number:=50;
BEGIN
    if mod(variable_,2)=0 THEN
    dbms_output.put_line('par');
    else 
    dbms_output.put_line('impar'); 
    end if;
end;

/*
2. PRÁCTICA 2
• Crear una variable CHAR(1) denominada TIPO_PRODUCTO.
• Poner un valor entre "A" Y "E"
• Visualizar el siguiente resultado según el tipo de producto
o 'A' --> Electronica
o 'B' --> Informática
o 'C' --> Ropa
o 'D' --> Música
o 'E' --> Libros
o Cualquier otro valor debe visualizar "El código es incorrecto"
*/
set SERVEROUTPUT on
declare 
    letra char(1);
begin
    letra:='a';
    if letra='A' then
        dbms_output.put_line('Electrónica');
    elsif letra='B' then
        dbms_output.put_line('Informática');
    elsif letra='C' then
        dbms_output.put_line('Ropa');
    elsif letra='D' then
        dbms_output.put_line('Música');
    elsif letra='E' then
        dbms_output.put_line('Libros');
    else
        dbms_output.put_line('El código es incorrecto');
    end if;    
end;