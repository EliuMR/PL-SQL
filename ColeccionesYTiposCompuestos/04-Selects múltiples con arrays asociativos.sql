            -- Selects múltiples con arrays asociativos
-- cuidado con almacenar muchos elementos que va a memoria los arrays
set SERVEROUTPUT on;

declare 
    type departamentos is table of
        departments%rowtype
    index by pls_integer;
 depts departamentos;
begin
    -- almacenamos en nuestri array de nuestra tabla departments, cuyo id va de 10 en 10
    for i in 1..10 loop
        select * into depts(i) from departments where department_id=i*10;
    end loop;
    -- imprimimos el array usando los metodos para ir de inicio a final
    for i in depts.first..depts.last loop
        dbms_output.put_line(depts(i).department_name);
    end loop;    
    
end;