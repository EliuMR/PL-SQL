-- Colecciones
--  El record solo alamacena una fila, 
-- las coleeciones alamacenamos objetos del mismo tipo, arrays

-- Arrays Asociativo (index by tables) (curso)
-- Son colecciones pl/sql con dos columnas
--  clave primaria de tipo entero o cadena
--  valores: un tipo que puede ser escalar o record
-- podemos agregar datos como manipularlos

-- type nombre is table of
--  tipo columna
--  index pls_integer|binary_integer|varchar2(x);

-- Acceso al array
--  para acceder al array usamos
--      array(n)

-- Métodos:
--  Exists(N)   detectar si existe un elemento
--  count(N)    número de elementos
--  first       devuelve el índice más pequeño
--  last        devuelve el índice más alto
--  prior(N)    devuelve el índice anterior a N
--  next(N)     devuelve el indice posterior a N
--  delete      borra todo
--  delete(N)   borra el indice n
--  delete(N,M) borra de los indices n a m


set SERVEROUTPUT on ;

declare
    type departamentos is table of
        departments.department_name%type
    index by pls_integer;

    type empleados is table of
        employees%rowtype
    index by pls_integer;
    
    depts departamentos;
    emples empleados;
begin 
    -- tipo simple
    depts(1):='informatica';
    depts(2):='Test';
    dbms_output.put_line(depts(1));
    dbms_output.put_line(depts(2));
    dbms_output.put_line(depts.last);
    dbms_output.put_line(depts.first);
    
    if depts.exists(3) then
        dbms_output.put_line(depts(3));
    else 
        dbms_output.put_line('Este depto no existe');
    end if;
    
    -- tipo compuesto
    select * into emples(1) from employees where employee_id=100;
    dbms_output.put_line(emples(1).first_name);

end;

















