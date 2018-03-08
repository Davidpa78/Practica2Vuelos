DROP DATABASE IF EXISTS Practica2;
CREATE DATABASE Practica2;
USE Practica2;

CREATE TABLE AEROPUERTO(CodOACI CHAR(4)/*Establecemos un CHAR(4) por que es obligatorio rellenar con 4 carácteres alfanuméricos*/,CodIATA CHAR(3)/*Establecemos un CHAR(3) por que es obligatorio rellenar con 3 carácteres alfabéticos*/, Nombre VARCHAR(100), Ciudad VARCHAR (60), País VARCHAR(30), 
PRIMARY KEY(CodOACI));/*Hemos pensado una multiclave de CodIATA y Nombre por que hemos averiguado que existen aeropuertos en el mismo país y ciudad con el mismo código por lo que la unica forma de realizarlo sería estableciendo nombre y codIATA clave principal.Otra forma que se podría hacer sería con un id pero sería absurdo ya que el codigo IATA está hecho para eso. Al final establecemos CodOACI como clave principal ya que identifica de manera única  a los aeropuertos*/

CREATE TABLE TERMINALES(Número TINYINT UNSIGNED, CodOACI_AEROPUERTO CHAR(4),
PRIMARY KEY(Número,CodOACI_AEROPUERTO),
FOREIGN KEY(CodOACI_AEROPUERTO) REFERENCES AEROPUERTO(CodOACI));


CREATE TABLE COMPAÑIA(CodCompañia CHAR(3)/*Establecemos un CHAR(3) por que es obligatorio rellenar con 3 carácteres alfabéticos*/, Nombre VARCHAR(20),Logo VARCHAR(60)/*Usamos un varchar puesto que introduciremos un enlace a la dirección donde se encuentra la fotografía también se puede establecer con un BLOB pero gasta mucho espacio*/, 
PRIMARY KEY(CodCompañia));

CREATE TABLE VUELO(CodVuelo VARCHAR(7)/* El codigo de vuelo varia en su amplitud en función de fecha compañía etc por lo que no podemos establecer un CHAR el más largo que encontramos se da con 7 valores alfanuméricos*/,CodCompañia CHAR(3),CodOACI_AEROPUERTO_ORIGEN CHAR(4),CodOACI_AEROPUERTO_DESTINO CHAR(4) ,Estado ENUM('Programado','Cancelado','En ruta','Aterrizó')/*En la página oficial del aeropuerto de Madrid hemos encontrado estos 4 estados*/,Fecha DATETIME/*Necesitamos saber a la hora que despegó o va a despegar el avión*/,
PRIMARY KEY(CodVuelo,CodCompañia,CodOACI_AEROPUERTO_ORIGEN,CodOACI_AEROPUERTO_DESTINO),
CONSTRAINT FK_Comp_VUELO FOREIGN KEY(CodCompañia) REFERENCES COMPAÑIA(CodCompañia),
CONSTRAINT FK_OACI_OR_VUELO FOREIGN KEY(CodOACI_AEROPUERTO_ORIGEN) REFERENCES AEROPUERTO(CodOACI),
CONSTRAINT FK_OACI_DEST_VUELO FOREIGN KEY(CodOACI_AEROPUERTO_DESTINO) REFERENCES AEROPUERTO(CodOACI));

CREATE TABLE ASIENTO(CodAsiento VARCHAR(20),CodVuelo VARCHAR(7),TipoClase ENUM('Turista','Bussiness','PrimeraClase'),/*Si no añadimos codigo vuelo no sabemos que asiento es por que dependiendo del vuelo será uno o otro*/
PRIMARY KEY(CodAsiento,CodVuelo),
CONSTRAINT FK_VUELO_ASIENTO FOREIGN KEY(CodVuelo) REFERENCES VUELO(CodVuelo));

CREATE TABLE PASAJERO(DNI CHAR(9), Nombre VARCHAR(30), Apellido1 VARCHAR(30), Apellido2 VARCHAR(30),
PRIMARY KEY(DNI));

CREATE TABLE RESERVA(Localizador VARCHAR(15)/*Es un varchar ya que varía en funcion de la compañía, el vuelo y la fecha, se rellena con carácteres alfanuméricos*/, DNI_PASAJERO CHAR(9),‎Precio FLOAT,
PRIMARY KEY(Localizador,DNI_PASAJERO), 
CONSTRAINT FK_RESERVA_PASAJERO FOREIGN KEY(DNI_PASAJERO) REFERENCES PASAJERO(DNI));

CREATE TABLE /*En esta tabla añadiríamos todos los datos necesarios en una reserva,es decir,lo que aparecerá posteriormente en el billete.De este modo dandole acceso al usuario a esta tabla sabrá todo sobre el vuelo reservado*/RESERVA_VUELOS(Localizador VARCHAR(20), CodVuelo VARCHAR(7),DNI_PASAJERO CHAR(9),CodAsiento VARCHAR(20),CodCompañia CHAR(3),
PRIMARY KEY(Localizador,CodVuelo,DNI_PASAJERO,CodAsiento,CodCompañia), 
CONSTRAINT FK_VUELO_RESERVA_VUELOS FOREIGN KEY(CodVuelo) REFERENCES VUELO(CodVuelo),
CONSTRAINT FK_ASIENTO_RESERVA_VUELOS FOREIGN KEY(CodAsiento) REFERENCES ASIENTO(CodAsiento),
CONSTRAINT FK_COMPAÑIA_RESERVA_VUELOS FOREIGN KEY(CodCompañia) REFERENCES COMPAÑIA(CodCompañia));

