-- Controlar SQL con excepciones
-- Las excepciones no siempre sonun error sino que puede ser lo que queremos

set SERVEROUTPUT on;
declare
    reg regions%rowtype;
    reg_control regions.region_id%type;
begin
    reg.region_id:=1;
    reg.region_name:='Africa';
    -- en este ejemplo veo si existe mi dato que voy a insertar y si no salta la excepcion
    select region_id into reg_control
        from Regions
        where region_id=reg.region_id;
        dbms_output.put_line('La region ya existe');
    exception
        when no_data_found then
            insert into regions values (reg.region_id,reg.region_name);
        commit;
    
end;