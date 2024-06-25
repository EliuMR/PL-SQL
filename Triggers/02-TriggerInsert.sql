-- Sólo el usuario HR pueda insertar elementos en Regions
CREATE OR REPLACE TRIGGER IMPEDIR_REGION 
BEFORE INSERT ON REGIONS 
BEGIN
  if user <> 'HR' then
    raise_application_error(-20000, 'Sólo HR puede insertar Regions'); -- Parar triger
  end if;
END;

/
-- Probando
insert into regions values(1001,'Andorra');
select * from regions;
select * from log_table;