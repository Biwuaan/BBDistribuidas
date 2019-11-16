--@Autor: Oscar Berdejo Arvizu || Lópex Vite Erick Misael
--@Fecha creación: 10/10/2019
--@Descripción: Consultas Globales



	declare
	v_num_paises number;
	v_num_oficinas number;
	v_num_proyectos number;
	v_num_proyectos_pdf number;
	v_num_empleados number;
	v_num_pago_empleados number;


begin
select count(*) as into v_num_paises
	from (
	select pais_id 
		from pais_1
	union all
	select pais_id
		from pais_2)q1;

select count(*) as into v_num_oficinas
from (
	select oficina_id
		from oficina_1
	union all
	select oficina_id
		from oficina_2)q2;

select count(*)	 as into v_num_proyectos
from (
	select proyecto_id
		from proyecto_1
	union all
	select proyecto_id
		from proyecto_2)q3;

select count(*) as into v_num_proyectos_pdf
	from (
	select proyecto_id
		from proyecto_pdf_1
	union all
	select proyecto_id
		from proyecto_pdf_2)q4;

select count(*) as into v_num_empleados
from (
	select empleado_id
		from empleado_2
	union all
	select empleado_id
		from empleado_3)q5;

select count(*) as into v_num_pago_empleados
from (
	select pago_empleado_id
		from pago_empleado_1
	union all
	select pago_empleado_id
		from pago_empleado_2)q6;


dbms_output.put_line('Resultado del conteo de registros');
dbms_output.put_line('==================================');
dbms_output.put_line('Paises:        '||v_num_paises);
dbms_output.put_line('Oficinas:      '||v_num_oficinas);
dbms_output.put_line('Proyectos:     '||v_num_proyectos);
dbms_output.put_line('Proyecto_PDF:  '||v_num_proyectos_pdf);
dbms_output.put_line('Empleados:     '||v_num_empleados);
dbms_output.put_line('Pago_Empleado: '||v_num_pago_empleados);

END;
/

