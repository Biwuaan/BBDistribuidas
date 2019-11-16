--@Autor: Oscar Berdejo Arvizu || Lópex Vite Erick Misael
--@Fecha creación: 10/10/2019
--@Descripción: Creación de Tablas 

prompt Conectandose a elvbd_s1 como usuario SYS
connect sys@elvbd_s1 as sys dba
prompt creando usuario consultora_bdd

@s-02-LVE-n1-ddl.sql


prompt Conectandose a elvbd_s1 como usuario SYS
connect sys@elvbd_s1 as sys dba
prompt creando usuario consultora_bdd

@s-02-LVE-n2-ddl.sql

prompt Listo
exit;