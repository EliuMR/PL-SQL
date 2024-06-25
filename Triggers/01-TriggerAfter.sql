-- Trigger
-- Cuando se efectua un insert update o delete a una trabla se dispara el trigger
-- Por ejemplo impedir que ser borre una fila, guardar los cambios, que siempre en un insert sea mayúscula todo
-- Para auditoria
-- Tipos de trigger: 
    -- DML: insert, update, delete.
    -- DDL: create, drop
    -- Database: logon, shutdown


                                --- TRIGERS DML
    -- Tipos: Before(controlar la acción antes del evento), after, instead of 
    -- Eventos: Insert, update o delete
    -- Filas afectadas: Statement (sólo se dispara una vez, digamos un evento que borra mil veces pero sólo se ejecuta una vez), row (por cada fila afectada)

-- Tabla que guardará el registro con el usuario que modificó dicho registro
create table Log_table(
    log_column varchar2(200),
    user_name varchar2(200)
);

/
--Cada que alguien inserte en la tabla regiones, guarda en una tabla de log table el registro de lo realiza
create or replace Trigger Ins_empl
after insert on regions
Begin
    insert into log_table values ('Insersión en la tabla regiones',User);
end;

/
-- Probando
insert into regions values(1000,'México');
select * from regions;
select * from log_table;

/

