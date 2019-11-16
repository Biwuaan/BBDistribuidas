--@Autor: Oscar Berdejo Arvizu || Lópex Vite Erick Misael
--@Fecha creación: 10/10/2019
--@Descripción: Creación de Usuarios

prompt Otorgando privilegios a obabd_s1
connect sys@obabd_s1 as sysdba
prompt Otorgando privilegios

grant create database link to consultora_bdd;

prompt Otorgando privilegios a obabd_s2
connect sys@obabd_s2 as sysdba
prompt Otorgando privilegios

grant create database link to consultora_bdd;

prompt Listo
exit;
