-- while
-- bucle controlado
set SERVEROUTPUT on

DECLARE
    done BOOLEAN := FALSE;
    x number:=1;
BEGIN
    while x<10 loop
        dbms_output.put_line(x);
        x:=x+1;
        exit when x=5;
    end loop;

    WHILE done LOOP
        dbms_output.put_line('No');
        done := TRUE;
    END LOOP;
    WHILE NOT done LOOP
        dbms_output.put_line('Sí');
        done := TRUE;
    END LOOP;

END;