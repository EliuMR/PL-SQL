-- Ámbito de las variables
-- En funciones o procedientos cuando termino de ejectarlo, se borran las variables etc.
-- En un paquete no, durante lo que dure la sesión abierta el paqute se sigue ejecutando
-- Es decir el valor de las variables perduran 

-- Usando el paquete de 01-Cabecera
set serveroutput on;
begin 
    Pack1.V1:=100;
    dbms_output.put_line(Pack1.V1);
end;
/
-- vemos como se mantiene el valor
set serveroutput on;
begin 
    Pack1.V1:= Pack1.V1+100;
    dbms_output.put_line(Pack1.V1);
end;