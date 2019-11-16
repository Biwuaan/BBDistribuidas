--@Autor: Oscar Berdejo Arvizu || Lópex Vite Erick Misael
--@Fecha creación: 10/10/2019
--@Descripción: Revision de Fragmentos 

prompt Conectandose a elvbd_s1 como usuario SYS
connect sys@elvbd_s1 as sys dba
prompt creando usuario consultora_bdd


col owner format A40
col table_name format A40

select owner, table_name
	from all_tables
	where owner = 'consultora_bdd'


prompt Conectandose a elvbd_s2 como usuario SYS
connect sys@elvbd_s2 as sys dba
prompt creando usuario consultora_bdd

col owner format A40
col table_name format A40

select owner, table_name
	from all_tables
	where owner = 'consultora_bdd'

prompt Listo
exit;