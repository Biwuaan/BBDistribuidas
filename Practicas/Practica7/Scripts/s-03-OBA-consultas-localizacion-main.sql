--@Autor: Oscar Berdejo Arvizu || Lópex Vite Erick Misael
--@Fecha creación: 10/10/2019
--@Descripción: Realizando consultras en ambas PDBs

Prompt Conecntado a PDB obabd_s1
connect consultora_bdd/consultora_bdd@obabd_s1
Prompt Realizando conteo de registros en obabd_s1
set serveroutput on 


start s-03-OBA-consultas-localizacion.sql

Prompt Conecntado a PDB obabd_s2
connect consultora_bdd/consultora_bdd@obabd_s2
Prompt realizando conteo de registros en obabd_s2
set serveroutput on 

start s-03-OBA-consultas-localizacion.sql
