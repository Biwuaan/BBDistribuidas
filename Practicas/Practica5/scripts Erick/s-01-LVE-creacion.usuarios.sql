--@Autor: Oscar Berdejo Arvizu || Lópex Vite Erick Misael
--@Fecha creación: 10/10/2019
--@Descripción: Creación de Usuarios

prompt Conectandose a elvbd_s1 como usuario SYS
connect sys@elvbd_s1 as sys dba
prompt creando usuario consultora_bdd

create user consultora_bdd identified by consultora_bdd 
	quota unlimited on users;

grant create session, create table, create procedure, create sequence,
	to consultora_bdd;


prompt Conectandose a elvbd_s2 como usuario SYS
connect sys@elvbd_s2 as sys dba
prompt creando usuario consultora_bdd

create user consultora_bdd identified by consultora_bdd 
	quota unlimited on users;

grant create session, create table, create procedure, create sequence,
	to consultora_bdd;

prompt Listo
exit;
