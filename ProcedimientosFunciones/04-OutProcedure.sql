-- Parámetros de tipo out

-- Ejemplo igual al de In pero esta vez usamos r1 para el valor de tax
-- Out: es una dirección de memoria
-- Podemos tener más de una variable de tipo out, a diferencia de funciones que sólo retornar un valor
CREATE OR REPLACE PROCEDURE CALC_TAX_OUT
                            (EMPL IN EMPLOYEES.EMPLOYEE_ID%TYPE,
                             T1 IN NUMBER,
                             R1 OUT NUMBER)
IS 

SAL NUMBER:=0;
BEGIN
    IF T1<0 OR T1>40 THEN
        RAISE_APPLICATION_ERROR(-20000,'El porcentaje debe estar entre 0 y 60');
    END IF;
    SELECT SALARY INTO SAL FROM EMPLOYEES WHERE EMPLOYEE_ID=EMPL;
    R1:= SAL*T1/100;
    DBMS_OUTPUT.PUT_LINE('SALARY: '|| SAL);
    DBMS_OUTPUT.PUT_LINE('TAX: '|| R1);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No existe ese empleado');
END;
/


set SERVEROUTPUT on;
Declare
    A number;
    B number;
    R number; -- declaramos la salida dentro del programa donde vamos a llemar el procedimiento
begin
    A:=120;
    B:=1;
    R:=0; -- colocamos por si el procedure devuelve 0
-- pide que id de usuario, impuesto a pagar
    calc_tax_out(A,B,R);
    dbms_output.put_line('R: '||R);
    dbms_output.put_line('R modificada '||R*3);
end;
/