-- Bucles loop

set SERVEROUTPUT on

DECLARE
    x NUMBER := 1;
BEGIN
    LOOP
        dbms_output.put_line(x);
        x := x + 1;
        IF x = 11 THEN
            EXIT; -- para salir del bucle 
        END IF;
    /*
    exit when x=11; -- también sirve para salir de loop
    */
    END LOOP;
END;

-- loops anidados
-- poner etiquetas ayuda con la finalización de loop anidados y el exit 
DECLARE
    s PLS_INTEGER := 0;
    i PLS_INTEGER := 0;
    j PLS_INTEGER;
BEGIN
    << parent >> LOOP 
    -- print parent
        i := 1 + i;
        j := 100;
        dbms_output.put_line('Parent:' || i);
        << child >> LOOP
    -- print child
            EXIT parent WHEN ( i > 3 );
            dbms_output.put_line('Child:' || j);
            j := j + 1;
            EXIT child WHEN ( j > 105 );
        END LOOP child;

    END LOOP parent;

    dbms_output.put_line('finish');
END;