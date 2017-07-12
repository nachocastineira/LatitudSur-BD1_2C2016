USE latitudSur;

/* 1: Listar nombre y CUIL de todo el personal operativo. */

	SELECT operativos.cuit_o AS CUIT, personal.nombre AS NOMBRE
		FROM operativos INNER JOIN personal ON operativos.cuit_o = personal.cuit ;
		
/* 2: Listar el apellido y nombre de los pasajeros atendidos con fecha de ingreso, 
	  nombre hotel y código habitación utilizada. */
      
	SELECT pasajeros.apellido AS Apellido, pasajeros.nombre AS Nombre,
	       residen.fechaEntrada AS 'Fecha de Entrada', hotel.nombre AS Hotel, residen.numHab AS Habitación
		FROM pasajeros INNER JOIN residen ON pasajeros.n_doc = residen.nDoc 
					              INNER JOIN hotel ON residen.codHotelRes = hotel.codigo_h;

/* 3: Listar los números de teléfonos de todo el personal que desempeñe ambas tareas (administrativas y operativas). */

	SELECT telefono_efectivos.telefono AS 'Teléfono de Personal administrativo-operativo'
		FROM telefono_efectivos INNER JOIN operativos ON telefono_efectivos .cuit_t_e = operativos.cuit_o 
					            INNER JOIN administrativos ON telefono_efectivos .cuit_t_e = administrativos.cuit_a;
				
/* 4. Por problemas eléctricos se desea trasladar a todos los alojados en la habitación en donde se aloja el 
señor José Cito, argentino, DNI Nro 18888888 en fecha 15/10/2016 a otra habitación del mismo hotel 
(no validamos la capacidad de las habitaciones) */

	UPDATE residen 
	SET numHab = 1009
    WHERE numHab = (SELECT numHab
						FROM (SELECT numHab,nDoc FROM residen) AS res
							WHERE res.nDoc = 18888888);
                            

/*5. Era la primera vez que recibíamos pasajeros de Zaire y nos informan que todo el contingente 
(que ya estaba cargado como pasajeros) cambió de destino y ya no contaremos con su presencia. */

	DELETE FROM pasajeros
		WHERE pais_origen ='Zaire';
        

/* 6. Deseamos contar con un listado de todos los hoteles y su capacidad total de pasajeros */
	
    SELECT hotel.nombre AS Hotel, SUM(habitaciones.cantidadPlazas) AS Capacidad
		FROM hotel INNER JOIN habitaciones ON hotel.codigo_h = habitaciones.codHotelHab
			GROUP BY hotel.nombre;
            
/* 7. El pasajero Esteban Quito desea saber quién es el gerente del hotel en donde se alojó el 2/2/2015
 (suponemos que los gerentes no cambiaron). */
 
   SELECT personal.nombre as 'Nombre Gerente', personal.apellido AS 'Apellido Gerente'
		FROM habitaciones INNER JOIN residen ON habitaciones.num_hab = residen.numHab
									  INNER JOIN hotel ON residen.codHotelRes = hotel.codigo_h
									  INNER JOIN personal ON hotel.cuitContratado = personal.cuit
			WHERE residen.fechaEntrada IN (20150202);
      
 /*8. Se desea saber cuántas habitaciones de cada categoría posee el grupo hotelero */
 
	SELECT categoria AS Categoría, COUNT(cantidadPlazas) AS 'Cantidad de Plazas'
		FROM habitaciones
			GROUP BY categoria;
            
/* 9. Listar los nombres y apellidos de los empleados que nunca trabajan en un hotel categoría 5 estrellas*/ 
 
	SELECT personal.nombre AS Nombre, personal.apellido AS Apellido
		FROM trabaja_en INNER JOIN hotel ON trabaja_en.codigo_h_e = hotel.codigo_h
						INNER JOIN personal ON personal.cuit = trabaja_en.cuit_tr_e
						WHERE hotel.categoriaHotel != 'Cinco Estrellas'
	UNION
    SELECT personal.nombre AS Nombre, personal.apellido AS Apellido
		FROM contratados INNER JOIN hotel ON contratados.cuit_c = hotel.cuitContratado
						INNER JOIN personal ON personal.cuit = contratados.cuit_c
						WHERE hotel.categoriaHotel != 'Cinco Estrellas'
	UNION
    SELECT personal.nombre AS Nombre, personal.apellido AS Apellido
		FROM administrativos INNER JOIN hotel ON administrativos.codHotel = hotel.codigo_h
							INNER JOIN personal ON personal.cuit = administrativos.cuit_a
							WHERE hotel.categoriaHotel != 'Cinco Estrellas';

/* 10. Deseamos conocer que habitaciones no se ocuparon nunca durante el año en curso. Indicar número de habitación,
 nombre del hotel y nombre del gerente actual.*/

       SELECT habitaciones.num_hab as 'Numero de Habitacion', hotel.nombre as 'Hotel', personal.nombre as 'Gerente'
			FROM habitaciones INNER JOIN hotel INNER JOIN personal  ON habitaciones.codHotelHab = hotel.codigo_h AND hotel.cuitContratado = personal.cuit
				WHERE NOT EXISTS (SELECT 1
														FROM residen 
																WHERE habitaciones.num_hab = residen.numHab   AND  habitaciones.codHotelHab = residen.codHotelRes
																				AND (fechaEntrada > 20151231 OR fechaSalida > 20151231) );


