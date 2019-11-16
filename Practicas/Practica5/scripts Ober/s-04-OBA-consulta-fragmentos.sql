--@Autor: Oscar Berdejo Arvizu || Lópex Vite Erick Misael
--@Fecha creación: 10/10/2019
--@Descripción: Revision de Fragmentos 

prompt Conectandose a obabd_s1 como usuario consultora_bdd
connect consultora_bdd/consultora_bdd@obabd_s1

col table_name format A40

select table_name
	from user_tables;

prompt Conectandose a obabd_s2 como usuario consultora_bdd
connect consultora_bdd/consultora_bdd@obabd_s2

col table_name format A40

select table_name
	from user_tables;

prompt Listo
exit;