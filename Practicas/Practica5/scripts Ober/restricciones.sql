col tabla_hija format a30
col tabla_padre format a30
col nombre_restriccion format a30
set linesize 200


select h.table_name as "tabla_hija", p.table_name as "tabla_padre", 
	h.r_constraint_name as "nombre_restriccion"
	from user_constraints h, user_constraints p
	where h.r_constraint_name=p.constraint_name
	and h.constraint_type = 'R';
