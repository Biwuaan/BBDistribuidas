--@Autor: Oscar Berdejo Arvizu || Lópex Vite Erick Misael
--@Fecha creación: 10/10/2019
--@Descripción: Realizando vistas

create or replace view pais as
	select p.pais_id, p.clave, p.nombre, p.region
	from(
		select pais_id, clave, nombre, region from pais_1
		union all
		select pais_id, clave, nombre, region from pais_1) p;

create or replace view oficina as 
	select o.oficina_id, o.nombre, o.pais_id, o.oficina_anexa_id
	from(
		select oficina_id, nombre, pais_id, oficina_anexa_id from oficina_1
		union all
		select oficina_id, nombre, pais_id, oficina_anexa_id from oficina_2)o;

create or replace view proyecto as 
	select pr.proyecto_id, pr.nombre, pr.clave, pr.fecha_inicio, pr.fecha_fin, 
		pr.responsable_id, pr.oficina_id
	from(
		select proyecto_id, nombre, clave, fecha_inicio, fecha_fin,
			responsable_id, oficina_id
			from proyecto_1
		union all
		select proyecto_id, nombre, clave, fecha_inicio, fecha_fin,
			responsable_id, oficina_id
			from proyecto_2)pr;

create or replace view pago_empleado as 
	select pe.pago_empleado_id, pe.proyecto_id, pe.importe, pe.fecha_pago, 
		pe.empleado_id
	from(
		select pago_empleado_id, proyecto_id, importe, fecha_pago, empleado_id
			from pago_empleado_1
		union all
		select pago_empleado_id, proyecto_id, importe, fecha_pago, empleado_id
			from pago_empleado_2)pe;