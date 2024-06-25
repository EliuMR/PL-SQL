-- Trigers DML de tipo ROW
-- Con row podemos acceder a los datos anteriores o nuevos 
-- con :Old y :New para una mayor restricción

-- Controlar el tipo de eventos
CREATE OR REPLACE TRIGGER REGION_Eventos
BEFORE 
    INSERT or Update or Delete
ON REGIONS 
for each row -- triger disparado por cada fila
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

-- Ponemos cada nombre de región en minuscuas
update regions set region_name=lower(region_name);
-- Si vemos que aunque pongamos en minusculas el triger se dispara y coloca todos los nombres nuevos en mayúsculas
select * from regions;
select * from log_table;

