--@Autor: Oscar Berdejo Arvizu || Lópex Vite Erick Misael
--@Fecha creación: 10/10/2019
--@Descripción:Creación de ligas

prompt Creando liga en obabd_s1 hacia obabd_s2
connect consultora_bdd/consultora_bdd@obabd_s1
create database link obabd_s2.fi.unam using 'OBABD_S2';


prompt Creando liga en obabd_s2 hacia obabd_s1
connect consultora_bdd/consultora_bdd@obabd_s2
create database link obabd_s1.fi.unam using 'OBABD_S1';


prompt Listo.

exit