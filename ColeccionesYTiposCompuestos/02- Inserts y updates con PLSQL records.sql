create table regiones as select * from regions where region_id=0;

declare 
    reg1 regions%rowtype;
begin
    select * into reg1 from regions where region_id=1;
    
    --insert
    insert into regiones values reg1;
end;
/
declare 
    reg1 regions%rowtype;
begin
    reg1.region_id:=1;
    reg1.region_name:='Australia';
    
    --update
    update regiones set row=reg1 where region_id=1;

end;