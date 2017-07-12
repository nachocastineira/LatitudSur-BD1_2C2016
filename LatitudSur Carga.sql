INSERT INTO personal VALUES
	(1,'Jeronimo','Romero',19930327),
	(2,'Nacho', 'Castineira',19970408),
    (3,'Oscar','Eckert',19960520),
    (4,'Diego','Gonzalez',19860523),
    (5,'Agustina','Gimenez',19970320),
    (6,'Sebastian','Aebert',19960529),
	(7,'Fernando','Hierro',19990529);


INSERT INTO efectivos (cuit_e,fechaIngreso) VALUES
	(1,20050101),
	(2,20070101),
    (3,20100311),
    (6,20060518),
	(7,20100503);

INSERT INTO telefono_efectivos (cuit_t_e,telefono) VALUES
	(1,42460139),
	(2,39675852),
    (3,1558494235),
    (6,1568562718),
    (7,165478547);
    
INSERT INTO contratados (cuit_c,nivelEstudio,añoEgreso) VALUES
	(4,'Primarios',2006),
	(5,'Secundarios',2010);

INSERT INTO contrato (cuit_c,nroContrato,fechaInicio, fechaFin) VALUES
	(4,123456,19960520,20060520),
    (5,234567,19980320,20060320);
    
INSERT INTO hotel (codigo_h,nombre,categoriaHotel,telefono,cuitContratado) VALUES
	(101,'Las leñas','Cuatro Estrellas',011424601,4),
    (102,'Hotel los Aromos','Cuatro Estrellas',022143333,5);
    
INSERT INTO administrativos (cuit_a,area,cuitContratado,codHotel) VALUES
	(1,'Mantenimiento',4,101),
    (2,'Contaduria',5,102),
    (7,'Limpiabaños',4,101);

INSERT INTO operativos (cuit_o,cargo,cuitAdministrativo) VALUES
	(3,'Jefe',1),
	(6,'Subjefe',2),
    (7,'Cadete',1);

INSERT INTO trabaja_en (cuit_tr_e,codigo_h_e,diaSemana) VALUES
	(3,101,'Lunes'),
    (6,102,'Martes');

INSERT INTO habitaciones (num_hab,categoria,cantidadPlazas,codHotelHab) VALUES
	(1001,'Superior',2,101),
	(1002,'Standar',4,102),
    (1003,'Standar',2, 102),
    (1004,'Standar',2, 101),
    (1005,'Standar',2, 101),
    (1006,'Superior',2,102),
    (1007,'Standar',3, 102),
    (1008,'Superior',2, 102),
    (1009,'Standar',5, 101);
    

INSERT INTO pasajeros (n_doc,tipo_doc,pais_origen,nombre,apellido) VALUES
	(32547854,'DNI','Argentina','Lucas','Morello'),
	(32111222,'DNI','Brasil','Nicolas','Furno'),
	(32111333,'DNI','Mexico','Matias','Valentin'),
	(32222444,'DNI','Chile','Nahuel','Lamarca'),
    (30111222,'DNI','Noruega','Matias','Gomez'),
    (18888888,'DNI','Argentina','Jose','Cito'),
    (20555789,'DNI','Uruguay','Esteban','Quito'),
    (10555666,'PAS','Zaire','Nelson','Abab'),
    (10555777,'PAS','Zaire','Mike','Mutae'),
    (10555888,'PAS','Zaire','Motumbo','Papem'),
	(10567897,'DNI','Argentina','Rodrigo','Sano'),
    (10365488,'DNI','Argentina','Martin','Martinez'),
    (10245879,'DNI','Chile','Fernando','Fernandez');


INSERT INTO residen (nDoc,tipoDoc,paisOrigen,numHab,codHotelRes,fechaSalida,fechaEntrada) VALUES
	(32547854,'DNI','Argentina',1001,101,20160509,20160506),
	(32111222,'DNI','Brasil',1002,102,20160331,20160327),
	(32111333,'DNI','Mexico',1003,102,20160929,20160921),
	(32222444,'DNI','Chile',1002,102,20161019,20161011),
    (30111222,'DNI','Noruega',1004,101,20160501,20160510),
    (18888888,'DNI','Argentina',1005,101,20161025,20161015),
    (20555789,'DNI','Uruguay',1008,102,20150212,20150202),
    (10555666,'PAS','Zaire',1007,102,20160217,20160210),
    (10555777,'PAS','Zaire',1007,102,20160217,20160210),
	(10567897,'DNI','Argentina',1005,101,20151025,20151015),
	(10365488,'DNI','Argentina',1005,101,20151025,20151015),
    (10555888,'PAS','Zaire',1007,102,20160217,20160210),
    (10245879,'DNI','Chile',1003,102,20160217,20150210);

    
    