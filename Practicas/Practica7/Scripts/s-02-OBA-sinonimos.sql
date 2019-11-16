--@Autor: Oscar Berdejo Arvizu || Lópex Vite Erick Misael
--@Fecha creación: 10/10/2019
--@Descripción: Creación de Sinonimos

Prompt conectandose a obabd_s1
connect consultora_bdd/consultora_bdd@obabd_s1

Prompt creando sinónimos en obabd_s1

--Pais
create or replace synonym pais_1 for f_oba_pais_1;
create or replace synonym pais_2 for f_oba_pais_2@obabd_s2;

--Oficina
create or replace synonym oficina_1 for f_oba_oficina_1;
create or replace synonym oficina_2 for f_oba_oficina_2@obabd_s2;

--Proyecto
create or replace synonym proyecto_1 for f_oba_proyecto_1;
create or replace synonym proyecto_2 for f_oba_proyecto_2@obabd_s2;
create or replace synonym proyecto_3 for f_oba_proyecto_3@obabd_s2;

--Proyecto_PDF
create or replace synonym proyecto_pdf_1 for f_oba_proyecto_pdf_1;
create or replace synonym proyecto_pdf_2 for f_oba_proyecto_pdf_2@obabd_s2;

--Empleado
create or replace synonym empleado_1 for f_oba_empleado_1@obabd_s2;
create or replace synonym empleado_2 for f_oba_empleado_2;
create or replace synonym empleado_3 for f_oba_empleado_3@obabd_s2;

--Pago_emplado
create or replace synonym pago_empleado_1 for f_oba_pago_empleado_1;
create or replace synonym pago_empleado_2 for f_oba_pago_empleado_2@obabd_s2;


Prompt conectandose a obabd_s2

connect consultora_bdd/consultora_bdd@obabd_s2
Prompt creando sinónimos en obabd_s2

--Pais
create or replace synonym pais_1 for f_oba_pais_1@obabd_s1;
create or replace synonym pais_2 for f_oba_pais_2;

--Oficina
create or replace synonym oficina_1 for f_oba_oficina_1@obabd_s1;
create or replace synonym oficina_2 for f_oba_oficina_2;

--Proyecto
create or replace synonym proyecto_1 for f_oba_proyecto_1@obabd_s1;
create or replace synonym proyecto_2 for f_oba_proyecto_2;
create or replace synonym proyecto_3 for f_oba_proyecto_3;

--Proyecto_PDF
create or replace synonym proyecto_pdf_1 for f_oba_proyecto_pdf_1@obabd_s1;
create or replace synonym proyecto_pdf_2 for f_oba_proyecto_pdf_2;

--Empleado
create or replace synonym empleado_1 for f_oba_empleado_1;
create or replace synonym empleado_2 for f_oba_empleado_2@obabd_s1;
create or replace synonym empleado_3 for f_oba_empleado_3;

--Pago_emplado
create or replace synonym pago_empleado_1 for f_oba_pago_empleado_1@obabd_s1;
create or replace synonym pago_empleado_2 for f_oba_pago_empleado_2;


Prompt Listo!
exit