--@Autor: Oscar Berdejo Arvizu || Lópex Vite Erick Misael
--@Fecha creación: 10/10/2019
--@Descripción: Creación de Usuarios

prompt Conectandose a obabd_s1 como usuario SYS
connect sys@obabd_s1 as sysdba
prompt creando usuario consultora_bdd

create user consultora_bdd identified by consultora_bdd 
	quota unlimited on users;

grant create session, create table, create procedure, create sequence
	to consultora_bdd;


prompt Conectandose a obabd_s2 como usuario SYS
connect sys@obabd_s2 as sysdba
prompt creando usuario consultora_bdd

create user consultora_bdd identified by consultora_bdd 
	quota unlimited on users;

grant create session, create table, create procedure, create sequence
	to consultora_bdd;

prompt Listo
exit;
