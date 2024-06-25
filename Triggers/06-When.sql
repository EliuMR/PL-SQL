-- Clásula when
-- El triger solo se dispare bajo una codición

-- Controlar el tipo de eventos
CREATE OR REPLACE TRIGGER REGION_Eventos
BEFORE 
    INSERT or Update or Delete
ON REGIONS 
for each row -- triger disparado por cada fila

when (New.Region_id>1000) -- solo se usa los dos puntos (:New) después del begin

BEGIN
  if inserting then -- si se realizó un insert
    :New.Region_name:=upper(:New.Region_name); -- Ponme el nombre de la región en mayúsculas
    insert into log_table values('Inserción',user);
  end if;
  
  if updating then
    :New.Region_name:=upper(:New.Region_name);
    insert into log_table values('Update',user);
  end if;
  
  if deleting then
    insert into log_table values('Delete',user);
  end if;
END;
/

insert into regions values(90,'Rusia');
commit;

select * from regions;
-- como no satisface la condición del when entonces no se ejecuta el trigger y por lo tanto no guarda el log en log_Table
select * from log_table;