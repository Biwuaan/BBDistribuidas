--@Autor: Oscar Berdejo Arvizu || Lópex Vite Erick Misael
--@Fecha creación: 10/10/2019
--@Descripción: Creación de tablas
--Nodo 1


create table F_ELV_PAIS_1(
	pais_id number(5,0) not null,
	clave varchar2(5) not null,
	nombre varchar2(40) not null,
	region char(1) not null;
	constraint F_ELV_PAIS_1_PK primary key (pais_id)
);

create table F_ELV_OFICINA_1(
	oficina_id number(5,0) not null,
	nombre varchar2(40) not null,
	pais_id number(5,0) not null,
	constraint F_ELV_OFICINA_1_PK primary key (oficina_id),
	constraint PAIS_OFICINA_PAIS_ID_FK foreign key (pais_id)
	references F_ELV_PAIS_1 (pais_id)
);

create table F_ELV_PROYECTO_1(
	proyecto_id number(5,0) not null,
	nombre varchar2(100) not null,
	clave varchar2(5) not null,
	fecha_inicio date not null,
	fecha_fin date not null,
	responsable_id number(5,0),
	oficina_id number(5,0) not null,
	constrint F_ELV_PROYECTO_1_PK primary key (proyecto_id),
	constraint OFICINA_PROYECTO_OFICINA_ID_FK foreign key (oficina_id)
	references F_ELV_OFICINA_1(oficina_id)
);

create table F_ELV_PROYECTO_PDF_1(
	num_pdf number(1,0) not null,
	proyecto_id number(5,0) not null,
	archivo_pdf VARBINARY not null,
	tamanio number(10,2) not null,
	constraint F_ELV_PROYECTO_PDF_PK primary key (num_pdf, proyecto_id)
);

create table F_ELV_EMPLEADO2(
	empleado_id number(10,0) not null,
	nombre varchar2(40) not null,
	ap_paterno varchar2(40) not null,
	ap_materno varchar2(40) not null
	rfc varchar2(13) not null,
	email varchar2(40) not null,
	jefe_id number(10,0),
	constraint F_ELV_EMPLEADO2_PK primary key (empleado_id)
);

create table F_ELV_PAGO_EMP1(
	pago_emp_id number(10,0) not null,
	proyecto_id number(10,0) not null,
	importe number(10,0) not null,
	fecha_pago date,
	empleado_id number(10,0) not null,
	constraint F_ELV_PAGO_EMP1_PK primary key (pago_emp_id),
	constraint EMP_PAGO1_EMPLEADO_ID_FK foreign key (empleado_id)
	references F_ELV_EMPLEADO2(empleado_id)
);