-- user object
-- Ver en output qué procedures tenemos almacenados
select * from user_objects
where object_type='PROCEDURE';

-- Saber cuántos objetos tenemos como tablas, procedures, trigger
select object_type,count(*) from user_objects
group by object_type;

-- Ver código fuente
select * from user_source
where name='PROCEDURE1';
select TEXT from user_source -- Ver sólo el codigo
where name='PROCEDURE1';