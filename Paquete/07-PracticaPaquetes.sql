                -- Práctica de Paquetes
/*
1. Crear un paquete denominado REGIONES que tenga los
siguientes componentes:
    • PROCEDIMIENTOS:
        • - ALTA_REGION, con parámetro de código y nombre Región.
        Debe devolver un error si la región ya existe. Inserta una nueva
        región en la tabla. Debe llamar a la función EXISTE_REGION
        para controlarlo.
        • - BAJA_REGION, con parámetro de código de región y que
        debe borrar una región. Debe generar un error si la región no
        existe, Debe llamar a la función EXISTE_REGION para
        controlarlo
        • - MOD_REGION: se le pasa un código y el nuevo nombre de la
        región Debe modificar el nombre de una región ya existente.
        Debe generar un error si la región no existe, Debe llamar a la
        función EXISTE_REGION para controlarlo
    • FUNCIONES
        • CON_REGION. Se le pasa un código de región y devuelve el
        nombre
        • EXISTE_REGION. Devuelve verdadero si la región existe. Se
        usa en los procedimientos y por tanto es PRIVADA, no debe
        aparecer en la especificación del paquete
*/
create or REPLACE PACKAGE PckRegiones
-- cabecera
is
    Procedure Alta_Region   (regionId number, nombreRegion varchar2);
    Procedure Baja_region   (regionId number);
    Procedure MOD_REGION    (regionId number, nombreRegion varchar2);
end;
---
/
create or replace package body PckRegiones
    is
        FUNCTION Existe_Region(nombre_region varchar2) return number
            is
                existe number;
            begin
                select count(*) into existe from Regions where REGION_NAME=nombre_Region;
                if existe=0 then
                    return 1;
                else
                    return 0;
                end if;
            end Existe_Region;
        
    Procedure Alta_Region(regionId number, nombreRegion varchar2)
        is
            duplicado number;
            nombreDuplicado Exception;
        
        begin
            duplicado:= Existe_Region(nombreRegion);
            if duplicado=1 then
                insert into Regions (Region_id,Region_name) values (regionId,nombreRegion);
            else
                raise nombreDuplicado;
            end if;
        Exception
            when nombreDuplicado then
                dbms_output.put_line('La región ya existe');
            when others then
                dbms_output.put_line('Error indefinido');
        end Alta_Region;
    Procedure Baja_region (regionId number)
        is 
            nombreRegion varchar2(20);
            duplicado number;
            idNoExiste Exception;
        begin
            select Region_name into nombreRegion from Regions where Region_id=regionId;
            duplicado:= Existe_Region(nombreRegion);
            if duplicado=0 then 
                delete Regions where Region_id=regionId;
            else
                raise idNoExiste;
            end if;
        Exception
            when idNoExiste then 
                dbms_output.put_line('No existe tal Región con ese Id');
            when others then
                dbms_output.put_line('Error indefinido');
    end Baja_region;
    
    PROCEDURE MOD_REGION    (regionId number, nombreRegion varchar2)
        is
            nombre varchar2(20);
            duplicado number;
            idNoExiste Exception;
        begin
            select Region_name into nombre from Regions where Region_id=regionId;
            duplicado:= Existe_Region(nombre);
        
        if duplicado=0 then
            update Regions set Region_name=nombreRegion where Region_id=regionId;
        else
                raise idNoExiste;
            end if;
        Exception
            when idNoExiste then 
                dbms_output.put_line('No existe tal Región con ese Id');
            when others then
                dbms_output.put_line('Error indefinido');

    end MOD_Region;
end PckRegiones;



/
begin
  --   pckregiones.alta_region(6,'Oceanía');
    -- pckregiones.Baja_region(5);
    pckregiones.MOD_Region(6,'Africa');
end;

-- ---------------------------------------------------------------------------------------
/*
2.-Crear un paquete denominado NOMINA que tenga sobrecargado
la función CALCULAR_NOMINA de la siguiente forma:
    • CALCULAR_NOMINA(NUMBER): se calcula el salario del
    empleado restando un 15% de IRPF.
    • CALCULAR_NOMINA(NUMBER,NUMBER): el segundo
    parámetro es el porcentaje a aplicar. Se calcula el salario del
    empleado restando ese porcentaje al salario
    • CALCULAR_NOMINA(NUMBER,NUMBER,CHAR): el segundo
    parámetro es el porcentaje a aplicar, el tercero vale ‘V’ . Se
    calcula el salario del empleado aumentando la comisión que le
    pertenece y restando ese porcentaje al salario siempre y
    cuando el empleado tenga comisión.
*/
create or replace package Nomina
is 
    Function Calcular_nomina(id number) return number;
    Function Calcular_nomina(id number, porcentaje number) return number;
    Function Calcular_nomina(id number, porcentaje number, tercero varchar2) return number;
end;
/
-- Body
create or replace package body Nomina
is

    Function Calcular_nomina(id number)
    return number
    is
    salario Employees.Salary%type;
    begin
        select Salary into salario from Employees where employee_id=id;
        return salario-salario*0.15;
    end Calcular_nomina;

    Function Calcular_nomina(id number, porcentaje number) 
    return number
    is
    salario Employees.Salary%type;
    begin
        select Salary into salario from Employees where employee_id=id;
        return salario-salario*porcentaje;
    end Calcular_nomina;
    
    Function Calcular_nomina(id number, porcentaje number, tercero varchar2)
    return number
    is
    salario  Employees.Salary%type;
    comision Employees.Commission_PCT%type;
    begin
        select Salary into salario from Employees where employee_id=id;
        select Commission_PCT into comision from Employees where employee_id=id;
        if comision>=0 then
            return salario-salario*porcentaje+salario*comision;
        else
            return salario;
        end if;
    end Calcular_nomina;
    
end Nomina;
/
set SERVEROUTPUT on;
declare
salario number;
begin
    salario:=Nomina.Calcular_nomina(165);
    dbms_output.put_line(salario);
    salario:=Nomina.Calcular_nomina(165,0.01);
    dbms_output.put_line(salario);
    salario:=Nomina.Calcular_nomina(165,0.01,'V');
    dbms_output.put_line(salario);
end;
