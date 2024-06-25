-- Comprobador de estado

-- Ver los trigers
desc user_triggers;
select trigger_name,trigger_type,action_type,trigger_body from user_triggers;

select object_name, object_type, status from user_objects where object_type='TRIGGER';

-- compilar
alter trigger REGION_Eventos compile;

-- desactivar el trigger
alter trigger REGION_Eventos disable;
-- Podemos checar si el trigger está activado
select trigger_name, status from user_triggers;
-- Habilitar trigger
alter trigger REGION_Eventos enable;