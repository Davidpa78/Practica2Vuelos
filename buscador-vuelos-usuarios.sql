/*CREAMOS EL USUARIO ADMINISTRADOR QUE POSEE TODOS LOS PODERES SOBRE LA BASE DE DATOS*/

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL ON Practica2.* TO 'admin'@'localhost';



/*Creamos  un nuevo usuario llamado trabajador asignándole sus respectivos permisos, Que pueda ver todas las tablas existentes y modificar las tres tablas que utilizamos para las reservas.(Si fuera de manera física y no a través de internet).También es el encargado de atención al cliente.*/

CREATE USER 'trabajador'@'localhost' IDENTIFIED BY 'trabajador';
GRANT INSERT, DELETE,UPDATE ON Practica2.PASAJERO 
TO 'trabajador'@'localhost';
GRANT INSERT, DELETE,UPDATE ON Practica2.RESERVA 
TO 'trabajador'@'localhost';
GRANT INSERT, DELETE,UPDATE ON Practica2.RESERVA_VUELOS 
TO 'trabajador'@'localhost';
GRANT SELECT ON Practica2.*
TO 'trabajador'@'localhost';



/*Al cliente le asignamos el permisos de ver a las tablas donde puede consultar su reserva y el permiso de insertar en las tablas para rellenar dicha reserva, pero no le asignamos los permisos de editar ni borrar, en el caso de que lo necesitase se pondría en contacto con atención al cliente y el trabajador lo realizaría */


CREATE USER 'cliente'@'localhost' IDENTIFIED BY 'cliente';
GRANT SELECT 
ON Practica2.RESERVA
TO 'cliente'@'localhost';
GRANT SELECT 
ON Practica2.RESERVA_VUELOS
TO 'cliente'@'localhost';
GRANT INSERT 
ON Practica2.RESERVA
TO 'cliente'@'localhost';
GRANT INSERT 
ON Practica2.RESERVA_VUELOS
TO 'cliente'@'localhost';
GRANT INSERT 
ON Practica2.PASAJERO
TO 'cliente'@'localhost';












