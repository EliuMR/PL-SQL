-- Prácticas Oracle pl/sql
/*
Prácticas Bucles
1. Práctica 1
• Vamos a crear la tabla de multiplicar del 1 al 10, con los tres tipos de
bucles: LOOP, WHILE y FOR

*/
set SERVEROUTPUT on
declare 
    x number;
    z number;
begin
    x:=1;
    z:=1;
    loop
        exit when x=11; 
        dbms_output.put_line('Tabla multiplicar '||to_char(x));
        loop
            exit when z=11;
            dbms_output.put_line(to_char(x*z));
            z:=z+1;            
        end loop; 
    x:=x+1;
    z:=1;
    end loop;
end;

set SERVEROUTPUT on
declare 
    x number;
    z number;
begin
    x:=1;
    z:=1;
    while x<11 loop
    dbms_output.put_line('Tabla multiplicar '||to_char(x));
        while z<11 loop
        dbms_output.put_line(to_char(x*z));
        z:=z+1;
        end loop;
    z:=1;
    x:=1+x;
    end loop;
end;

set SERVEROUTPUT on
begin
    for x in 1..10 loop -- 
        dbms_output.put_line('Tabla multiplicar '||to_char(x));
        for z in 1..10 loop -- 
        dbms_output.put_line(to_char(x*z));
        end loop;
    end loop;
end;

/*
2. Práctica 2-
• Crear una variable llamada TEXTO de tipo VARCHAR2(100).
• Poner alguna frase
• Mediante un bucle, escribir la frase al revés, Usamos el bucle WHILE
*/
set SERVEROUTPUT on
declare
    frase varchar2(100) := 'TEXTO';
    cantidad number:=1;
    frase_alreves varchar2(100);
begin
    while cantidad<LENGTH(frase)+1 loop
        frase_alreves:=frase_alreves||substr(frase,LENGTH(frase)-cantidad+1,1);
        cantidad:=1+cantidad;
    end loop;
    dbms_output.put_line(frase_alreves);
end;
/*
3. Práctica 3
• Usando la práctica anterior, si en el texto aparece el carácter "x" debe
salir del bucle. Es igual en mayúsculas o minúsculas.
• Debemos usar la cláusula EXIT.
*/
set SERVEROUTPUT on
declare
    frase varchar2(100) := 'TEXTO';
    cantidad number:=1;
    frase_alreves varchar2(100);
begin
    while cantidad<LENGTH(frase)+1 loop
        exit when substr(frase,LENGTH(frase)-cantidad+1,1)='X';
        frase_alreves:=frase_alreves||substr(frase,LENGTH(frase)-cantidad+1,1);
        cantidad:=1+cantidad;
    end loop;
    dbms_output.put_line(frase_alreves);
end;

/*
4. Práctica 4
• Debemos crear una variable llamada NOMBRE
• Debemos pintar tantos asteriscos como letras tenga el nombre.
Usamos un bucle FOR
• Por ejemplo Alberto → *******
• O por ejemplo Pedro → *****
*/

set SERVEROUTPUT on
declare
    nombre varchar2(100):='JUAN';
    cadena varchar2(100);
begin
    for i in 1..LENGTH(nombre) loop
        cadena:='*'||cadena;
    end loop;
    dbms_output.put_line(cadena);
end;