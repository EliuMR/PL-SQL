-- Parámetros de tipo in-out

-- Variable para pasarle el porcentaje que quiero calcular y me regrese el resultado
CREATE OR REPLACE PROCEDURE CALC_TAX_IN_OUT
                            (EMPL IN EMPLOYEES.EMPLOYEE_ID%TYPE,
                             T1 IN OUT NUMBER)
IS 

SAL NUMBER:=0;
BEGIN
    IF T1<0 OR T1>40 THEN
        RAISE_APPLICATION_ERROR(-20000,'El porcentaje debe estar entre 0 y 60');
    END IF;
    SELECT SALARY INTO SAL FROM EMPLOYEES WHERE EMPLOYEE_ID=EMPL;
    DBMS_OUTPUT.PUT_LINE('PORECENTAJE: '||T1);
    T1:= SAL*T1/100;
    DBMS_OUTPUT.PUT_LINE('SALARY: '|| SAL);
    DBMS_OUTPUT.PUT_LINE('TAX: '|| T1);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No existe ese empleado');
END;
/


set SERVEROUTPUT on;
Declare
    A number;
    B number; --  Va servir para entrada como salida
begin
    A:=120;
    B:=10;
-- pide que id de usuario, impuesto a pagar
    calc_tax_IN_out(A,B);
    dbms_output.put_line('B: '||B);
end;
/