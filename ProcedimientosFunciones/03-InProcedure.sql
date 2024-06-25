-- Parámetros in 

-- ejemplo, calcular el impuesto de un empleado
CREATE OR REPLACE PROCEDURE CALC_TAX
                            (EMPL IN EMPLOYEES.EMPLOYEE_ID%TYPE,
                             T1 IN NUMBER)
IS 
TAX NUMBER:=0;
SAL NUMBER:=0;
BEGIN
    if T1<0 or T1>40 then
        raise_application_error(-20000,'El porcentaje debe estar entre 0 y 60');
    end if;
    SELECT SALARY INTO SAL FROM EMPLOYEES WHERE EMPLOYEE_ID=EMPL;
    TAX:= SAL*T1/100;
    DBMS_OUTPUT.PUT_LINE('SALARY: '|| SAL);
    DBMS_OUTPUT.PUT_LINE('TAX: '|| TAX);
Exception
    when no_data_found then
        dbms_output.put_line('No existe ese empleado');
END;
/


set SERVEROUTPUT on;
Declare
    A number;
    B number;
begin
    A:=120;
    B:=61;
-- pide que id de usuario, impuesto a pagar
    calc_tax(A,B);
end;