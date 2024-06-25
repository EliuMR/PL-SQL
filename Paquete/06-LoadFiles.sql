-- Paquete predefinidos que vienen con PL/SQL

-- Dbms_output
-- utl_file
-- utl_mail
-- dbms_alert
-- dbms_lock
-- dbms_session
-- dbms_application_info
-- htp
-- dbms_scheduler

-- Vamos utilizar utl_file
-- Tomar un fichero y cargar uma base de datos

-- Dar los permisos para que el usuario pueda tener acceso a directorios de oracle y paquetes
Grant create any directory to HR;
Grant execute on sys.utl_file to HR;
/
-- creamos un directorio
create or replace directory DataBase as 'C:\Users\elium\Documents\PL-SQL\Paquete\06-DataBase';

/

create table F1(
        c1 varchar2(20)
        );
/

-- Procedimiento
set SERVEROUTPUT on;
create or REPLACE PROCEDURE read_file is
string varchar2(21214);
vfile utl_file.file_type;

begin
    -- open file
    vfile:= utl_file.fopen('DATABASE','f1.txt','R');
    loop
    begin
        -- read line
        utl_file.get_line(vfile,string);
        insert into F1 (C1) values (string);
        dbms_output.put_line(string);
    Exception
    -- no mas lineas
        when no_data_found then exit;
    end;
    end loop;
-- close file
utl_file.fclose(Vfile);
end;

/
-- Probamos el procedure
begin
    read_file;
end;

select * from F1;