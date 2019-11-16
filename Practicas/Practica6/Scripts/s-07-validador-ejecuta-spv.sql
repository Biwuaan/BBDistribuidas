--@Autor:          Jorge A. Rodríguez C
--@Fecha creación:  dd/mm/yyyy
--@Descripción:     script de validacion en pdb - ejecución

--parametros recibidos
define p_pdb='&1'
define p_usr='&2'
define p_pwd='&3'
define p_sitio='&4'
define p_iniciales='&5'

Prompt Iniciando ejecución de procedimientos para &&p_pdb
connect &&p_usr/&&p_pwd@&&p_pdb
set echo off
set feedback off
set serveroutput on
exec spv_valida_ligas(&&p_sitio, trim(upper('&&p_iniciales')));
exec spv_valida_datos_blob(&&p_sitio,trim(upper('&&p_iniciales')));
exec spv_valida_procedimientos_blob
exec spv_valida_export_archivos(&&p_sitio, trim(upper('&&p_iniciales')));