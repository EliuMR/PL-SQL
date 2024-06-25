-- Trigger Compuestos

-- permite tener sobre un objeto distintos tipos de triggers

create or replace trigger trigger1
for delete OR insert or update on regions
compound trigger -- trigger compuesto
    
    before statement is begin
        insert into log_table values ('Before statements',user);
    end before statement;
    
    after statement is begin
        insert into log_table values ('After statements',user);
    end after statement;

    before each row is begin
        insert into log_table values ('Before each row',user);
    end before each row;
    
   after each row  is begin
        insert into log_table values ('after each row',user);
    end after each row;
end trigger1;
/

insert into regions values (5000, 'Mexico');

select * from log_table;
