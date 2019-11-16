--@Autor: Oscar Berdejo Arvizu || Lópex Vite Erick Misael
--@Fecha creación: 10/10/2019
--@Descripción: Revision de Fragmentos 

prompt Conectandose a obabd_s1 como usuario consultora_bdd
connect consultora_bdd/consultora_bdd@obabd_s1

set linesize 200;

select PAIS_1, OFICINA_1, EMPLEADO_1, PROYECTO_1, PROYECTO_PDF_1, PAGO_EMPLEADO_1
	from (select count(pais_id) as PAIS_1 from F_OBA_PAIS_1),
	(select count(oficina_id) as OFICINA_1 from F_OBA_OFICINA_1),
	(select count(empleado_id) as EMPLEADO_1 from F_OBA_EMPLEADO_2),
	(select count(proyecto_id) as PROYECTO_1 from F_OBA_PROYECTO_1),
	(select count(num_pdf) as PROYECTO_PDF_1 from F_OBA_PROYECTO_PDF_1),
	(select count(pago_empleado_id) as PAGO_EMPLEADO_1 from F_OBA_PAGO_EMPLEADO_1);

prompt Conectandose a obabd_s2 como usuario consultora_bdd
connect consultora_bdd/consultora_bdd@obabd_s2

set linesize 200;

select PAIS_2, OFICINA_2, EMPLEADO_2, EMPLEADO_3, PROYECTO_2, PROYECTO_3, PROYECTO_PDF_2, PAGO_EMPLEADO_2
	from (select count(pais_id) as PAIS_2 from F_OBA_PAIS_2),
	(select count(oficina_id) as OFICINA_2 from F_OBA_OFICINA_2),
	(select count(empleado_id) as EMPLEADO_2 from F_OBA_EMPLEADO_3),
	(select count(empleado_id) as EMPLEADO_3 from F_OBA_EMPLEADO_1),
	(select count(proyecto_id) as PROYECTO_2 from F_OBA_PROYECTO_2),
	(select count(proyecto_id) as PROYECTO_3 from F_OBA_PROYECTO_3),
	(select count(num_pdf) as PROYECTO_PDF_2 from F_OBA_PROYECTO_PDF_2),
	(select count(pago_empleado_id) as PAGO_EMPLEADO_2 from F_OBA_PAGO_EMPLEADO_2);

prompt Listo
exit;