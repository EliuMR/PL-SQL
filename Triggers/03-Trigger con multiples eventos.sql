-- Trigger con multiples eventos
CREATE OR REPLACE TRIGGER IMPEDIR_REGION 
BEFORE 
    INSERT or Update or Delete
ON REGIONS 
BEGIN
  if user <> 'HR' then
    raise_application_error(-20000, 'Sólo HR puede trabajar Regions'); -- Parar triger
  end if;
END;
/
---
-- Solo no medificar la columna region_name
-- El of columna_nombre sólo tiene sentido en update.
CREATE OR REPLACE TRIGGER IMPEDIR_REGION 
BEFORE 
    INSERT or Update of region_name or Delete
ON REGIONS 
BEGIN
  if user <> 'HR' then
    raise_application_error(-20000, 'Sólo HR puede trabajar Regions'); -- Parar triger
  end if;
END;
/
