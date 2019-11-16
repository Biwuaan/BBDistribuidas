-- @Author:  Jorge Rodríguez C.
--@Fecha creación: 16/10/2018
--@Descripción: Ejecutamos el script con procedimiento para cargar archivos blob en cada PDB

prompt Conectando a obabd_s1 
conn consultora_bdd/consultora_bdd@obabd_s1
prompt Cargando el script
@s-00-guarda-blob-en-archivo.sql

prompt Conectando a obabd_s2
conn consultora_bdd/consultora_bdd@obabd_s2
prompt Cargando el script
@s-00-guarda-blob-en-archivo.sql
