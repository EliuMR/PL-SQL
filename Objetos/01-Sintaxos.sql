-- Oracle no es una base de datos de tipo objeto, sin embargo ha incorporado funcionalidades que permiten 
-- trabjas con algunas características de las bases de datos orientadas a objetos

-- Un objeto se crea a través de una clase que define sus características
-- A partir de ña claase podemos crear (instanciar) objetos
-- Una clase tiene atributos y métodos


-- Creamos primero la definición, luego se crea a especificación o body objeto.
-- Se debe declarar un objeto utilizando el constructor que inicializa los atributos
-- Para usar el objeto se usa con la notación punto
 
create or replace type producto as object(
    -- Atributos
    codigo number,
    nombre varchar2(100),
    precio number,
    
    -- metodos
    member function ver_producto return varcha2,
    member function ver_precio return number,
    member PROCEDURE cambiar_precio (pvp number)

);
/
-- Borrando
drop type producto;
