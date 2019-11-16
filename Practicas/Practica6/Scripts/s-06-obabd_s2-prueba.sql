--@Autor: Edwin Ernesto Olmos
--@Fecha creación: 16/10/2019
--@Descripción: Script encargado de realizar prueba para carga-descarga de archivos BLOB

--creando un objeto DIRECTORY para acceder al directorio /tmp/bdd/p06
Prompt conectando a obabd_s2 como SYS
accept p_sys_password default 'system' prompt 'password de sys: ' hide

conn sys@obabd_s2/&p_sys_password as sysdba

set verify off

--ruta donde se ubicaran los archivos PDFs
define p_pdf_path='/tmp/bdd/p06'


Prompt Creando Directorio y asignando permisos al usuario consultora_bdd
create or replace directory tmp_dir as '&p_pdf_path';
grant read,write on directory tmp_dir to consultora_bdd;

Prompt conectando a obabd_s2 con usuario consultora_bdd
conn consultora_bdd/consultora_bdd@obabd_s2

Prompt invocando la carga de un archivo PDF...
-- Se asume que el archivo PDF se encuentra en el mismo directorio donde se
-- ejecuta este script. EL PDF se copia a /tmp/bdd y despues se le cambian permisos
-- de lectura y ejecución para todos los usuarios.
-- En SQL *Plus se emplea el símbolo '!' para ejecutar comandos en el sistema operativo.
Prompt limpiando y creando directorio en /tmp/bdd/p06
!rm -rf &p_pdf_path
!mkdir -p &p_pdf_path
!chmod 777 &p_pdf_path
!cp m_archivo_5.pdf &p_pdf_path
!cp m_archivo_1.pdf &p_pdf_path
!cp m_archivo_2.pdf &p_pdf_path
!cp m_archivo_3.pdf &p_pdf_path
!chmod 755 &p_pdf_path/m_archivo_5.pdf
!chmod 755 &p_pdf_path/m_archivo_1.pdf
!chmod 755 &p_pdf_path/m_archivo_2.pdf
!chmod 755 &p_pdf_path/m_archivo_3.pdf



Prompt Cargando PDF en BD para la tabla PROYECTO_PDF_2
--ejecuta el procedimiento
begin
carga_blob_en_bd('TMP_DIR','m_archivo_5.pdf','f_oba_proyecto_pdf_2','archivo_pdf','proyecto_id','2','num_pdf','1');
end;
/

Prompt Cargando PDF en BD para la tabla EMPLEADO_1
--ejecuta el procedimiento
begin
carga_blob_en_bd('TMP_DIR','m_archivo_1.pdf','f_oba_empleado_1','foto','empleado_id','1','','');
carga_blob_en_bd('TMP_DIR','m_archivo_2.pdf','f_oba_empleado_1','foto','empleado_id','2','','');
carga_blob_en_bd('TMP_DIR','m_archivo_3.pdf','f_oba_empleado_1','foto','empleado_id','3','','');
end;
/


Prompt Mostrando el tamaño del PDF en BD pata tabla PROYECTO_PDF_2
select proyecto_id,num_pdf,dbms_lob.getlength(archivo_pdf) as longitud
from f_oba_proyecto_pdf_2
where proyecto_id = 2
and num_pdf = 1;

Prompt Mostrando el tamaño del PDF en BD pata tabla EMPLEADO_1
select empleado_id,dbms_lob.getlength(foto) as longitud
from f_oba_empleado_1
where empleado_id = 1;

Prompt Mostrando el tamaño del PDF en BD pata tabla EMPLEADO_1
select empleado_id,dbms_lob.getlength(foto) as longitud
from f_oba_empleado_1
where empleado_id = 2;

Prompt Mostrando el tamaño del PDF en BD pata tabla EMPLEADO_1
select empleado_id,dbms_lob.getlength(foto) as longitud
from f_oba_empleado_1
where empleado_id = 3;

Prompt Salvando PDF en directorio para tabla PROYECTO_PDF_2
--ejecuta procedimiento
begin
guarda_blob_en_archivo('TMP_DIR','m_export_archivo_5.pdf','f_oba_proyecto_pdf_2','archivo_pdf','proyecto_id','2','num_pdf','1');
end;
/
Prompt Salvando PDF en directorio para tabla EMPLEADO_1
--ejecuta procedimiento
begin
guarda_blob_en_archivo('TMP_DIR','m_export_archivo_1.pdf','f_oba_empleado_1','foto','empleado_id','1','','');
guarda_blob_en_archivo('TMP_DIR','m_export_archivo_2.pdf','f_oba_empleado_1','foto','empleado_id','2','','');
guarda_blob_en_archivo('TMP_DIR','m_export_archivo_3.pdf','f_oba_empleado_1','foto','empleado_id','3','','');
end;
/
Prompt Mostrando el contenido del directorio para validar la existencia del PDF.

!ls -l &p_pdf_path/m_export_archivo_5.pdf
!ls -l &p_pdf_path/m_export_archivo_1.pdf
!ls -l &p_pdf_path/m_export_archivo_2.pdf
!ls -l &p_pdf_path/m_export_archivo_3.pdf

Prompt Listo!
exit