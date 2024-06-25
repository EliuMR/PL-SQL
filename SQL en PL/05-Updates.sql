-- updates
declare
    t test.c1%type;
begin 
    t:=10;
    update test set c2='cccc' where c1=t;
end;