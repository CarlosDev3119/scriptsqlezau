-- crear una base de datos para gestionar empleados
-- los empleados deberan tener un nombre de usuario, un password
-- y un correo

-- el usuario tendra permisos como admin y default


-- comando para crear DB: 'CREATE DATABASE "nombre de bd" '
CREATE DATABASE empleados;

-- comando para usar la bd: USE "nombre de la bd"
USE empleados;

-- crear tabla usuarios para registrar empleados
-- para crear una tabla se ocupa la palabra reservada 
-- CREATE TABLE "nombre de mi tabla" (
--     campos tipo de dato - restricciones
-- ); 


-- tipos de datos

-- VARCHAR(10) -- TEXTO
-- FLOAT -- NUMEROS CON PUNTO FLOTANTE 10.2, 20.4 
-- DOUBLE -- NUMEROS CON PUNTO FLOTANTE 10.2, 20.4 
-- MONEY -- DATO NUMERICO(DINERO) 1,500.00
-- CHAR(10) CHARACTER A, D, F, HOLA
-- DECIMAL 10.2, 20.4 
-- INT 10, 20, 30
-- DATE YYYY-MM-DD 2023-03-27
-- DATETIME YYYY-MM-DD 2023-03-27 20:49:12.123
-- TIMESTAMP SIRVE PARA FECHAS y horas 
-- boolean true o false 


-- restricciones 
-- NOT NULL = NO NULO( no permite campos vacios)
-- NULL = NULO( permite campos vacios)
-- UNIQUE = DATO UNICO(no permite duplicidad)
-- PRIMARY KEY = LLAVE PRIMARIA
-- FOREIGN KEY = LLAVE FORANEA
-- AUTO_INCREMENT = UN VALOR AUTOINCREMENTABLE (1, 2, 3, 4 DE FORMA AUTOMATICA)
-- IDENTITY = UN VALOR AUNTOINCREMENTABLE(SOLO SQL SERVER)


CREATE TABLE usuarios(
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(255) NOT NULL,
    pass VARCHAR(30) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- PARA INSERTAR INFORMACION(REGISTROS) A LA BD SE UTILIZA EL SIG comando
-- INSERT INTO "nombre de mi tabla"('campos que se llenaran') VALUES ('datos a llenar')

-- ESPECIFICANDO CAMPOS
-- INSERT INTO usuarios(nombre_usuario, pass, email) 
-- VALUES ('CARLOS', '123123', 'prueba@gmail.com' )

-- SIN ESPECIFICAR CAMPOS
-- INSERT INTO usuarios 
-- VALUES (NULL,'CARLOS', '123123', 'prueba@gmail.com' )

-- GUARDAR MULTIPLES REGISTROS

-- INSERT INTO 
--     usuarios(nombre_usuario, pass, email) 
-- VALUES 
--     ('DANIEL', '123123', 'prueba2@gmail.com' ),
--     ('RICHARD', '123123', 'prueba3@gmail.com' ),
--     ('SALMA', '123123', 'prueba4@gmail.com' );

-- CONSULTAR INFORMACION

-- SELECT 'CAMPOS A OBTENER' FROM 'nombre de mi tabla';

-- selecionar todo
SELECT * FROM usuarios;

-- seleccion espeficia
SELECT id_usuario, email FROM usuarios;

--CONTAR DATOS DE UNA TABLA COUNT()
SELECT COUNT(*) FROM `clientes` WHERE 1;


delimiter // 
CREATE PROCEDURE pa_cantidad_clientes_provincias( in provincia1 varchar(20), in provincia2 varchar(20) ) 
BEGIN 

    DECLARE canti1 INT; 
    DECLARE canti2 int; 

    SELECT count(*) INTO canti1 FROM clientes AS cli 
    JOIN provincias AS pro  
    ON pro.codigo=cli.codigoprovincia
    where pro.nombre=provincia1;

    SELECT count(*) INTO canti2 FROM clientes AS cli 
    JOIN provincias AS pro  
    on pro.codigo=cli.codigoprovincia 
    where pro.nombre=provincia2;      

    SELECT canti1,canti2;   

END // 
delimiter ; 

-- base de datos nueva opcional
CREATE DATABASE regiones;

USE regiones;

-- crear una tabla para localidades y otra para codigos postales

CREATE TABLE IF NOT EXISTS localidades(
    id_localidad INT PRIMARY KEY AUTO_INCREMENT,
    nombre_localidad VARCHAR(255) NOT NULL,
    id_codigo_postal INT NOT NULL,
    FOREIGN KEY (id_codigo_postal) REFERENCES codigos_postales(id_cp)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS codigos_postales(
    id_cp INT PRIMARY KEY AUTO_INCREMENT,
    cp VARCHAR(10) NOT NULL
)ENGINE=INNODB;


--- id_localidad, nombre_localidad, id_codigo_postal  ------    id_cp, codigo_postal

    1              Cuatro Vientos        1                        1       56589
    2              San BuenaVentura      1                        2       56530


-- hacer una consulta que me traiga la localidad y el codigo postal con un join


-- 1 cuatro vientos 1
-- 2 san buena      1
-- 3 San marcos     2


-- 1 56589
-- 2 56530
-- 3 56423

INSERT INTO localidades(nombre_localidad,id_codigo_postal) VALUES ('CUATRO VIENTOS', 1);
INSERT INTO localidades(nombre_localidad,id_codigo_postal) 
VALUES 
    ('SAN BUENA', 1),
    ('SAN FRANCISCO', 2),
    ('SAN JERONIMO', 1);

INSERT INTO codigos_postales(cp) 
VALUES 
    ('56589'),
    ('56588')

