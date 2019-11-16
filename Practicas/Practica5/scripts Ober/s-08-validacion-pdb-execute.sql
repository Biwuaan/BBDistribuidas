--@Autor:          Jorge A. Rodríguez C
--@Fecha creación:  dd/mm/yyyy
--@Descripción:     script de validacion en pdb - ejecución
whenever sqlerror exit rollback;
--parametros recibidos
define p_pdb='&1'
define p_usr='&2'
define p_pwd='&3'
define p_tipo_fr='&4'
define p_sitio='&5'
define p_iniciales='&6'

Prompt Iniciando ejecución de procedimientos para &&p_pdb
connect &&p_usr/&&p_pwd@&&p_pdb
set serveroutput on
set echo off
set feedback off

exec spv_print_header

exec sp_valida_fragmentos(&&p_sitio,trim(upper('&&p_tipo_fr')),trim(upper('&&p_iniciales')));
exec sp_valida_columnas(&&p_sitio,trim(upper('&&p_iniciales')));
exec sp_valida_fks(&&p_sitio,trim(upper('&&p_tipo_fr')),trim(upper('&&p_iniciales')));
exec sp_valida_datos(&&p_sitio,trim(upper('&&p_tipo_fr')),trim(upper('&&p_iniciales')));
exec spv_print_ok('Validación  concluida.');