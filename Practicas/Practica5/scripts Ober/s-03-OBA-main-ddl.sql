--@Autor: Oscar Berdejo Arvizu || Lópex Vite Erick Misael
--@Fecha creación: 10/10/2019
--@Descripción: Creación de Tablas 

prompt Conectandose a obabd_s1 como usuario consultora_bdd
connect consultora_bdd/consultora_bdd@obabd_s1
prompt creando tablas

@s-02-OBA-n1-ddl.sql


prompt Conectandose a obabd_s2 como usuario consultora_bdd
connect consultora_bdd/consultora_bdd@obabd_s2
prompt creando tablas

@s-02-OBA-n2-ddl.sql

prompt Listo
exit;