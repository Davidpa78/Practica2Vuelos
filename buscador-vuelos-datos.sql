
/*INSERTAMOS LOS DATOS EN TODOS LOS CAMPOS INTRODUCIENDO TRANSACCIONES EN LAS RESERVAS*/

INSERT INTO AEROPUERTO VALUES ('LEMD','MAD','Adolfo Suarez-Barajas','Madrid','España'),
('VHHH','HKG','Chek Lap Kok','Hong Kong','China'),
('EDDB','SXF','Aeropuerto de Berlín-Schönefeld','Berlín','Alemania'),
('EGKK','LGW','Gatwick Airport','Londres','Reino Unido'),
('MMTJ','TIJ','Aeropuerto Internacional General Abelardo L. Rodríguez','Tijuana','México'),('SEGU','TIJ','Aeropuerto Internacional José Joaquín de Olmedo','Guayaquil','Ecuador'),
('OMDB','DXB','Aeropuerto Internacional de Dubái','Dubai','Emiratos Árabes Unidos')
;



INSERT INTO TERMINALES VALUES ('2','VHHH'),
('1','VHHH'),
('1','SEGU'),
('3','OMDB'),
('2','MMTJ');



INSERT INTO COMPAÑIA VALUES ('RYR','Ryanair','/images/logoRYR.png'/*<-- Simulamos un sistemas de directorios donde se localizaría el logo de la empresa*/),
('IBE','IBERIA','/images/logoIBE.png'),
('DAL','DELTA','/images/logoDAL.png'),
('AVA','AVIANCA','/images/logoAVA.png'),
('CFG','CONDOR','/images/logoCFG.png'),
('EZS','EasyJet','/images/logoEZS.png'),
('VLG','Vueling Airlines','/images/logoVLG.png');

INSERT INTO VUELO VALUES ('FS031','RYR','MMTJ','SEGU','Programado','2018-07-22 12:30'),
('BA4564A','EZS','SEGU','OMDB','Cancelado','2018-09-25 05:00'),
('CH2031','EZS','VHHH','MMTJ','En ruta','2017-02-25 11:30'),
('IB1523','RYR','MMTJ','VHHH','Aterrizó','2010-03-22 10:30'),
('A123A','CFG','OMDB','SEGU','Programado','2017-12-20 09:20');

INSERT INTO ASIENTO VALUES ('C68','FS031','Bussiness'),
('A03','BA4564A','PrimeraClase'),
('G12','CH2031','Turista'),
('B07','IB1523','Turista'),
('C15','FS031','Bussiness');

INSERT INTO PASAJERO VALUES ('02547828R','David','Parra','Auñón'),
('25386528S','Francisco','Quintana','Verde'),
('02575358R','Ignacio','Anton','Lérida'),
('15862423G','Carlos','Cabanill','Martin'),
('33352123T','Luis','Rodriguez','Lopez');


/*ACTUALIZAMOS Y BORRAMOS DATOS(estos datos no los puedes haber usado como FOREIGN KEY ya que sino saldría error)*/

UPDATE AEROPUERTO SET CodOACI='LEMP' WHERE Ciudad='Madrid';
UPDATE AEROPUERTO SET CodOACI='EDPB' WHERE CodIATA='SXF';
UPDATE AEROPUERTO SET CodOACI='EGKL' WHERE CodIATA='LGW';
DELETE FROM AEROPUERTO WHERE CodOACI='LEMP';
DELETE FROM AEROPUERTO WHERE CodOACI='EDPB';
DELETE FROM AEROPUERTO WHERE CodOACI='EGKL';

UPDATE COMPAÑIA SET CodCompañia ='IBR' WHERE Nombre='IBERIA';
UPDATE COMPAÑIA SET CodCompañia ='DEL' WHERE Nombre='DELTA';
UPDATE COMPAÑIA SET CodCompañia ='AVI' WHERE Nombre='AVIANCA'; 
DELETE FROM COMPAÑIA WHERE CodCompañia ='IBR';
DELETE FROM COMPAÑIA WHERE CodCompañia='DEL';
DELETE FROM COMPAÑIA WHERE CodCompañia='AVI';


/*INTRODUCIMOS DOS TRANSACCIONES PARA METER DATOS EN LAS TABLAS DE RESERVA(De esta manera generaremos la reserva y el precio e imprimiremos el billete que corresponderia con la tabla RESERVA_VUELOS) */

START TRANSACTION;

/*EN LA PRIMERA ESTABLECEMOS LA RESERVA CON EL LOCALIZADOR QUE SE REPITE EN AMBOS CASOS (IDA/VUELTA)*/

INSERT INTO RESERVA VALUES /*VUELO*/('SG/KD4GT','02575358R','1000');

/*EN LA SEGUNDA TENEMOS LOS DOS BILLETES DE IDA Y VUELTA*/

INSERT INTO RESERVA_VUELOS VALUES /*VUELO (IDA) ---> */('SG/KD4GT','BA4564A','02575358R','A03','EZS'),
/*VUELO (VUELTA) --->*/('SG/KD4GT','CH2031','02575358R','G12','EZS');
COMMIT;


START TRANSACTION;

INSERT INTO RESERVA VALUES('RY/LS4GH','25386528S','10');

INSERT INTO RESERVA_VUELOS VALUES/*VUELO (IDA) ---> */('RY/LS4GH','IB1523','25386528S','B07','RYR'),
 /*VUELO (VUELTA)--->*/('RY/LS4GH','FS031','25386528S','C15','RYR');

COMMIT;















