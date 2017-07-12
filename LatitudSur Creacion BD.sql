DROP DATABASE IF EXISTS latitudSur;
CREATE DATABASE latitudSur;
USE latitudSur;

CREATE TABLE personal (
		cuit INT PRIMARY KEY,
        nombre VARCHAR (30) NOT NULL,
        apellido VARCHAR (40) NOT NULL,
        fechaNac DATE NOT NULL );
		
CREATE TABLE efectivos (
		fechaIngreso DATE NOT NULL,
		cuit_e INT,
        PRIMARY KEY (cuit_e),
        CONSTRAINT per_efe_fk FOREIGN KEY (cuit_e) REFERENCES personal (cuit) ON DELETE CASCADE ON UPDATE CASCADE);
 
CREATE TABLE telefono_efectivos (
		telefono INT,
        cuit_t_e INT,
        PRIMARY KEY (telefono,cuit_t_e),
		CONSTRAINT efe_tel_fk FOREIGN KEY (cuit_t_e) REFERENCES efectivos(cuit_e)ON DELETE CASCADE ON UPDATE CASCADE);
        
CREATE TABLE contratados (
		cuit_c INT,
		nivelEstudio VARCHAR (25) NOT NULL,
        añoEgreso INT (4),
		PRIMARY KEY (cuit_c),
		CONSTRAINT per_con_fk FOREIGN KEY (cuit_c) REFERENCES personal (cuit)ON DELETE CASCADE ON UPDATE CASCADE);
        
CREATE TABLE contrato (
		cuit_c INT,
        nroContrato INT,
        fechaInicio DATE NOT NULL,
        fechaFin DATE,
        PRIMARY KEY (nroContrato),
		CONSTRAINT con_con_fk FOREIGN KEY (cuit_c) REFERENCES contratados (cuit_c)ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE hotel (
		codigo_h INT,
        nombre VARCHAR (30) NOT NULL,
        categoriaHotel VARCHAR (30) NOT NULL,
        telefono INT (15) NOT NULL,
        cuitContratado INT,
        PRIMARY KEY (codigo_h),
        CONSTRAINT hot_con_fk FOREIGN KEY (cuitContratado) REFERENCES contratados (cuit_c)ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE administrativos (
		cuit_a INT,
        area VARCHAR (20) NOT NULL,
		cuitContratado INT,
        codHotel INT,
        PRIMARY KEY (cuit_a),
        CONSTRAINT adm_efe_fk FOREIGN KEY (cuit_a) REFERENCES personal (cuit) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT adm_con_fk FOREIGN KEY (cuitContratado) REFERENCES contratados (cuit_c) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT adm_hot_fk FOREIGN KEY (codHotel) REFERENCES hotel (codigo_h)ON DELETE CASCADE ON UPDATE CASCADE);
			
CREATE TABLE operativos (
		cuit_o INT,
        cargo VARCHAR (30) NOT NULL,
        cuitAdministrativo INT,
        PRIMARY KEY (cuit_o),
		CONSTRAINT ope_con_cui_fk FOREIGN KEY (cuit_o) REFERENCES personal(cuit) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT ope_con_adm_fk FOREIGN KEY (cuitAdministrativo) REFERENCES personal(cuit) ON DELETE CASCADE ON UPDATE CASCADE);
        
CREATE TABLE trabaja_en (
		cuit_tr_e INT,
		codigo_h_e INT,
        diaSemana VARCHAR (20) NOT NULL,
        PRIMARY KEY (cuit_tr_e, codigo_h_e),
        CONSTRAINT tra_ope_fk FOREIGN KEY (cuit_tr_e) REFERENCES operativos (cuit_o) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT tra_hot_fk FOREIGN KEY (codigo_h_e) REFERENCES hotel (codigo_h) ON DELETE CASCADE ON UPDATE CASCADE);
        
CREATE TABLE habitaciones (
		num_hab INT,
        categoria VARCHAR (20) NOT NULL,
        cantidadPlazas INT (1) NOT NULL,
        codHotelHab INT,
        PRIMARY KEY (num_hab, codHotelHab),
        CONSTRAINT hab_hot_fk FOREIGN KEY (codHotelHab) REFERENCES hotel (codigo_h) ON DELETE CASCADE ON UPDATE CASCADE);
 
CREATE TABLE pasajeros (
		n_doc INT,
        tipo_doc VARCHAR (20),
		pais_origen VARCHAR (30),
		nombre VARCHAR (30) NOT NULL,
        apellido VARCHAR (30) NOT NULL,
        PRIMARY KEY (n_doc,tipo_doc,pais_origen));
        
CREATE TABLE residen (
		nDoc INT,
        tipoDoc VARCHAR (20),
		paisOrigen VARCHAR (30),
		numHab INT,
        codHotelRes INT,
        fechaSalida DATE NOT NULL,
        fechaEntrada DATE NOT NULL,
        PRIMARY KEY (nDoc,tipoDoc,paisOrigen, numHab, codHotelRes),
		CONSTRAINT pas_res_fk FOREIGN KEY (nDoc,tipoDoc,paisOrigen) REFERENCES pasajeros (n_doc,tipo_doc,pais_origen) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT hab_res_hab_fk FOREIGN KEY (numHab) REFERENCES habitaciones (num_hab) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT hab_res_hot_fk FOREIGN KEY (codHotelRes) REFERENCES hotel (codigo_h) ON DELETE CASCADE ON UPDATE CASCADE);
        
        
        