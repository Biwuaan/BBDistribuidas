--@Autor: Oscar Berdejo Arvizu || Lópex Vite Erick Misael
--@Fecha creación: 10/10/2019
--@Descripción: Creación de tablas
--Nodo 2

create table F_OBA_PAIS_2(
	pais_id number(5,0) not null,
	clave varchar2(5) not null,
	nombre varchar2(40) not null,
	region char(1) not null,
	constraint F_OBA_PAIS_2_PK primary key (pais_id)
);

create table F_OBA_OFICINA_2(
	oficina_id number(5,0) not null,
	nombre varchar2(40) not null,
	pais_id number(5,0) not null,
	oficina_anexa_id number(5,0),
	constraint F_OBA_OFICINA_1_PK primary key (oficina_id),
	constraint PAIS_OFICINA_PAIS_ID_FK foreign key (pais_id)
	references F_OBA_PAIS_2 (pais_id)
);

create table F_OBA_EMPLEADO_3(
	empleado_id number(10,0) not null,
	nombre varchar2(40) not null,
	ap_paterno varchar2(40) not null,
	ap_materno varchar2(40) not null,
	rfc varchar2(13) not null,
	email varchar2(40) not null,
	jefe_id number(10,0),
	constraint F_OBA_EMPLEADO3_PK primary key (empleado_id)
);

create table F_OBA_EMPLEADO_1(
	empleado_id number(10,0) not null,
	foto BLOB not null,
	num_cuenta varchar2(18) not null,
	constraint F_OBA_EMPLEADO1_PK primary key (empleado_id)
);

create table F_OBA_PROYECTO_2(
	proyecto_id number(5,0) not null,
	nombre varchar2(100) not null,
	clave varchar2(5) not null,
	fecha_inicio date not null,
	fecha_fin date not null,
	responsable_id number(5,0),
	oficina_id number(5,0) not null,
	constraint F_OBA_PROYECTO_2_PK primary key (proyecto_id),
	constraint OFICINA_PROY2_OFICINA_ID_FK foreign key (oficina_id)
	references F_OBA_OFICINA_2(oficina_id),
	constraint EMP_PROY2_RESPONSABLE_ID_FK foreign key (responsable_id)
	references F_OBA_EMPLEADO_1(empleado_id)
);


create table F_OBA_PROYECTO_3(
	proyecto_id number(5,0) not null,
	nombre varchar2(100) not null,
	clave varchar2(5) not null,
	fecha_inicio date not null,
	fecha_fin date,
	responsable_id number(5,0),
	oficina_id number(5,0) not null,
	constraint F_OBA_PROYECTO_3_PK primary key (proyecto_id),
	constraint OFICINA_PROY3_OFICINA_ID_FK foreign key (oficina_id)
	references F_OBA_OFICINA_2(oficina_id),
	constraint EMP_PROY3_RESPONSABLE_ID_FK foreign key (responsable_id)
	references F_OBA_EMPLEADO_1(empleado_id)
);

create table F_OBA_PROYECTO_PDF_2(
	num_pdf number(1,0) not null,
	proyecto_id number(5,0) not null,
	archivo_pdf BLOB not null,
	tamanio number(10,2) not null,
	constraint F_OBA_PROYECTO_PDF_PK primary key (num_pdf, proyecto_id)
);

create table F_OBA_PAGO_EMPLEADO_2(
	pago_empleado_id number(10,0) not null,
	proyecto_id number(10,0) not null,
	importe number(10,0) not null,
	fecha_pago date,
	empleado_id number(10,0) not null,
	constraint F_OBA_PAGO_EMP2_PK primary key (pago_empleado_id),
	constraint EMP_PAGO2_EMPLEADO_ID_FK foreign key (empleado_id)
	references F_OBA_EMPLEADO_1(empleado_id)
);