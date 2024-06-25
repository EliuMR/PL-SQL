-- Controlar el tipo de eventos
CREATE OR REPLACE TRIGGER REGION_Eventos
BEFORE 
    INSERT or Update or Delete
ON REGIONS 
BEGIN
  if inserting then -- si se realizó un insert
    insert into log_table values('Inserción',user);
  end if;
  
  if updating then
    insert into log_table values('Update',user);
  end if;
  
  if deleting then
    insert into log_table values('Delete',user);
  end if;
END;
/


-- Probando
delete regions where region_name='México';

select * from log_table;

update Regions set region_name='México' where region_name='Andorra';
select * from log_table;
/
