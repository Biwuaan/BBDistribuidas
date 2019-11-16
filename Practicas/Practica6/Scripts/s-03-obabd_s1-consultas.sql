--@Autor: Oscar Berdejo Arvizu || Lópex Vite Erick Misael
--@Fecha creación: 10/10/2019
--@Descripción:Conteo de Registros

prompt conectando a obabd_s1
connect consultora_bdd/consultora_bdd@obabd_s1
prompt Realizando conteo de registros
set serveroutput on
--La consulta se lanza en OBABD_S1
	declare
	v_num_paises number;
	v_num_oficinas number;
	v_num_proyectos number;
	--v_num_proyectos_pdf number;
	v_num_empleados number;
	v_num_pago_empleados number;
begin
	dbms_output.put_line('Realizando consulta empleando ligas');
	select count(*) as into v_num_paises
	from (
		select pais_id
			from F_OBA_PAIS_1
		union all
		select pais_id
			from F_OBA_PAIS_2@obabd_s2.fi.unam
		) q1;

	select count(*) as into v_num_oficinas
	from (
		select oficina_id
			from F_OBA_OFICINA_1
		union all
		select oficina_id
			from F_OBA_OFICINA_2@obabd_s2.fi.unam
		) q2;

	select count(*)	 as into v_num_proyectos
	from (
		select proyecto_id
			from F_OBA_PROYECTO_1
		union all
		select proyecto_id
			from F_OBA_PROYECTO_2@obabd_s2.fi.unam
		union all 
		select proyecto_id
			from F_OBA_PROYECTO_3@obabd_s2.fi.unam
		) q3;

	select count(*) as into v_num_empleados
	from (
		select empleado_id
			from F_OBA_EMPLEADO_1@obabd_s2.fi.unam 
		) q4;

	select count(*) as into v_num_pago_empleados
	from (
		select pago_empleado_id
			from F_OBA_PAGO_EMPLEADO_1
		union all
		select pago_empleado_id
			from F_OBA_PAGO_EMPLEADO_2@obabd_s2.fi.unam
		) q5;

dbms_output.put_line('Resultado del conteo de registros');
dbms_output.put_line('Paises:        '||v_num_paises);
dbms_output.put_line('Oficinas:      '||v_num_oficinas);
dbms_output.put_line('Proyectos:     '||v_num_proyectos);
--dbms_output.put_line('Proyecto_PDF: '||v_num_proyectos_pdf);
dbms_output.put_line('Empleados:     '||v_num_empleados);
dbms_output.put_line('Pago_Empleado: '||v_num_pago_empleados);

END;
/
Prompt Listo
exit