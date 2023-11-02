 CREATE SCHEMA `tienda_zapatillas`;
 USE `tienda_zapatillas`;
 CREATE TABLE `zapatillas` 
 (
 id_zapatilla INT AUTO_INCREMENT PRIMARY KEY,
 modelo VARCHAR(45) NOT NULL,
 color VARCHAR(45) NOT NULL
 );
 
 CREATE TABLE `clientes`
 (
 id_cliente INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(45) NOT NULL,
 numero_telefono SMALLINT NOT NULL,
 email VARCHAR(45) NOT NULL,
 direccion VARCHAR(45) NOT NULL,
 ciudad VARCHAR(45) NOT NULL,
 provincia VARCHAR(45) NOT NULL,
 pais VARCHAR(45) NOT NULL,
 codigo_postal SMALLINT NOT NULL
 );
 
 CREATE TABLE `empleados`
 (
 id_empleado INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(45) NOT NULL,
 tienda VARCHAR(45) NOT NULL,
 salario INT NOT NULL, 
 -- el salario seria mejor un float
 fecha_incorporacion DATE NOT NULL
 );
 
 CREATE TABLE `facturas`
 (
 id_factura INT AUTO_INCREMENT PRIMARY KEY,
 numero_factura VARCHAR(45) NOT NULL,
 fecha DATE NOT NULL,
 id_zapatilla INT NOT NULL ,
 id_empleado INT NOT NULL,
 id_cliente INT NOT NULL,
 CONSTRAINT `condicion_1`
	FOREIGN KEY (id_zapatilla) REFERENCES `zapatillas`(id_zapatilla) 
	ON DELETE RESTRICT
	ON UPDATE RESTRICT,
    FOREIGN KEY (id_empleado) REFERENCES `empleados`(id_empleado) 
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
    FOREIGN KEY (id_cliente) REFERENCES `clientes`(id_cliente) 
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
 );
 
  ALTER TABLE `zapatillas`
	ADD COLUMN `marca` VARCHAR (45) NOT NULL, 
    ADD COLUMN `talla` SMALLINT NOT NULL; 

ALTER TABLE `empleados`
	MODIFY COLUMN `salario` FLOAT NOT NULL;

ALTER TABLE `clientes`
	DROP COLUMN `pais`; 
    
ALTER TABLE `facturas`
	ADD COLUMN `total` FLOAT; 

ALTER TABLE `empleados`
	DROP COLUMN `salarios`;
    
INSERT INTO `zapatillas` (`modelo`, `color`, `marca`, `talla`)
	VALUES ('XQYUN', 'Negro', 'Nike', 42),('UOPMN', 'Rosas', 'Nike', 39),('OPNYT', 'Verdes', 'Adidas', '35');
    
INSERT INTO `empleados` (`nombre`, `tienda`, `salario`, `fecha_incorporacion`)
	VALUES ('Laura', 'Alcobendas',25987, '2010-09-03'), ('Maria', 'Sevilla', 0, '2001-04-11'), ('Esther', 'Oviedo', 30165.98, '2000-11-29'); 

ALTER TABLE `clientes`
	MODIFY COLUMN `numero_telefono` VARCHAR(9);
 
 INSERT INTO `clientes` (`nombre`, `numero_telefono`, `email`, `direccion`, `ciudad`, `provincia`, `codigo_postal`)
	VALUES ('Monica', '123456789','monica@email.com', 'Calle Felicidad', 'Mostoles', 'Madrid', 28176), 
    ('Lorena', '289345678','lorena@email.com', 'Calle Alegria', 'Barcelona', 'Barcelona', 12346), 
    ('Carmen', '298463759','carmen@email.com', 'Calle del Color', 'Vigo', 'Pontevedra', 23456);    

INSERT INTO `facturas`(`numero_factura`, `fecha`, `id_zapatilla`, `id_empleado`, `id_cliente`, `total`)
	VALUES ('123', '2001-12-11', 1,2,1,54.98), ('1234', '2005-05-23', 1,1,3,89.91), ('12345', '2015-09-18', 2,3,3,76.23);
    
UPDATE `zapatillas`
	SET `color` = 'Amarillas'
    WHERE `id_zapatilla` = 2;

UPDATE `empleados`
	SET `tienda`= 'A Coruña'
    WHERE `id_empleado`=1;
    
UPDATE `clientes`
	SET `numero_telefono`= '123456728'
    WHERE `id_cliente` =1; 
    
UPDATE `facturas`
	SET `total`=89.91
    WHERE `id_zapatilla`=2;
    