-- Trigger DDL
-- Evitar que borren tablas
CREATE OR REPLACE TRIGGER TRIGGER_DDL 
BEFORE DROP ON HR.SCHEMA -- Antes de eliminar en tal esquema
BEGIN
  raise_application_error(-20000,'No se pueden borrar tablas');
END;

-- Test
drop table log_table;