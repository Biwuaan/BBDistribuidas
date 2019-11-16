--@Autor: Oscar Berdejo Arvizu || Lópex Vite Erick Misael
--@Fecha creación: 10/10/2019
--@Descripción: Carga

prompt Conectandose a obabd_s1 como usuario consultora_bdd
connect consultora_bdd/consultora_bdd@obabd_s1
--si ocurre un error, la ejecución se detiene.
whenever sqlerror exit rollback;


Prompt limpiando.
--delete from ...
delete from F_OBA_PAGO_EMPLEADO_1;
delete from F_OBA_EMPLEADO_2;
delete from F_OBA_PROYECTO_1;
delete from F_OBA_OFICINA_1;
delete from F_OBA_PAIS_1;
delete from F_OBA_PROYECTO_PDF_1;

Prompt Cargando datos
--insert into ..

insert into F_OBA_PAIS_1(pais_id, clave, nombre, region)
	values(1, 'MX', 'MEXICO', 'A');

insert into F_OBA_OFICINA_1(oficina_id, nombre, pais_id)
	values(1, 'Oficina 1 de CDMX', 1);

insert into F_OBA_PROYECTO_1(proyecto_id, nombre, clave, fecha_inicio, fecha_fin,
	responsable_id, oficina_id) values (1, 'PROYECTO A', 'P00A',
	to_date('16/02/2006', 'DD/MM/YYYY'), to_date('31/12/2012', 'DD/MM/YYYY'),
	 1, 1 );

insert into F_OBA_PROYECTO_PDF_1(num_pdf, proyecto_id, archivo_pdf, tamanio)
	values(1, 1, empty_blob(), 2);

insert into F_OBA_EMPLEADO_2(empleado_id, nombre, ap_paterno, ap_materno,
	rfc, email) values(1,'Juan', 'Lopez', 
	'Lara', 'LOLA890820KML', 'juanq@m.com');

insert into F_OBA_PAGO_EMPLEADO_1(pago_empleado_id, proyecto_id, importe, fecha_pago,
	empleado_id) values (1, 1, 1500.45, to_date('01/02/2017', 'DD/MM/YYYY'),
	1);

insert into F_OBA_EMPLEADO_2(empleado_id, nombre, ap_paterno, ap_materno,
	rfc, email, jefe_id) values(2,'Carlos', 'Baez', 
	'Aguirre', 'BAAGCA982613', 'juanq@m.com', 1);

insert into F_OBA_PAGO_EMPLEADO_1(pago_empleado_id, proyecto_id, importe, fecha_pago,
	empleado_id) values (2, 3, 5490.45, to_date('01/08/2017', 'DD/MM/YYYY'),
	2);


--hacer commit al terminar
commit;

prompt Conectandose a obabd_s2 como usuario consultora_bdd
connect consultora_bdd/consultora_bdd@obabd_s2 
--si ocurre un error, la ejecución se detiene.
whenever sqlerror exit rollback;


Prompt limpiando.
--delete from ...
delete from F_OBA_PAGO_EMPLEADO_2;
delete from F_OBA_PROYECTO_2;
delete from F_OBA_PROYECTO_3;
delete from F_OBA_EMPLEADO_1;
delete from F_OBA_OFICINA_2;
delete from F_OBA_PAIS_2;
delete from F_OBA_PROYECTO_PDF_2;
delete from F_OBA_EMPLEADO_3;



Prompt Cargando datos
--insert into ..
insert into F_OBA_EMPLEADO_1(empleado_id, foto, num_cuenta)
	values(1, empty_blob(), 09934902);

insert into F_OBA_EMPLEADO_1(empleado_id, foto, num_cuenta)
	values(2, empty_blob(), 04449321);

insert into F_OBA_EMPLEADO_1(empleado_id, foto, num_cuenta)
	values(3, empty_blob(), 67382342);

insert into F_OBA_PAIS_2(pais_id, clave, nombre, region)
	values(2, 'JAP', 'JAPON', 'B');

insert into F_OBA_OFICINA_2(oficina_id, nombre, pais_id, oficina_anexa_id)
	values(2, 'Oficina 1 de tokio', 2, 1);

insert into F_OBA_PROYECTO_2(proyecto_id, nombre, clave, fecha_inicio, fecha_fin,
	responsable_id, oficina_id) values (2, 'Proyecto B', 'P00B',
	to_date('14/01/2008', 'DD/MM/YYYY'), to_date('31/12/2013', 'DD/MM/YYYY'), 
	2, 2);

insert into F_OBA_PROYECTO_3(proyecto_id, nombre, clave, fecha_inicio,
	responsable_id, oficina_id) values ( 3, 'Proyecto C', 'P00C',
	to_date('06/05/2008', 'DD/MM/YYYY'), 3, 2);

insert into F_OBA_PROYECTO_PDF_2(num_pdf, proyecto_id, archivo_pdf, tamanio)
	values(1, 2, empty_blob(), 4);

insert into F_OBA_EMPLEADO_3(empleado_id, nombre, ap_paterno, ap_materno,
	rfc, email, jefe_id) values (3, 'Eva', 'Zavala', 'Cortes',
	'ZACOEV040423', 'EVA@M.COM', 1);

insert into F_OBA_PAGO_EMPLEADO_2(pago_empleado_id, proyecto_id, importe, fecha_pago,
	empleado_id) values (3, 2,  760.67, to_date('31/12/2016', 'DD/MM/YYYY'), 3 );

--hacer commit al terminar
commit;
Prompt Listo!
exit