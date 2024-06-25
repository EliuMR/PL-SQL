-- Delete
declare 
    t test.c1%type;
begin
    t:=10;
    delete from test where c1=t;
end;
/ -- fin de bocle
