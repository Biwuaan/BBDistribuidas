
--@Autor:          Jorge A. Rodríguez C
--@Fecha creación:  dd/mm/yyyy
--@Descripción:     script de validacion

Prompt Validación - Práctica 5
Prompt Datos de Entrada:
accept p_usuario default 'consultora_bdd' prompt '1. Proporcionar el nombre de usuario [consultora_bdd]: '
accept p_usr_pwd default 'consultora_bdd' prompt '2. Proporcionar password del usuario &&p_usuario [consultora_bdd]: '
accept p_pdb1 prompt '3. Nombre del sitio 1 (PDB 1). Ejemplo jrcbd_s1: '
accept p_pdb2 prompt '4. Nombre del sitio 2 (PDB 2). Ejemplo jrcbd_s2: '
accept p_iniciales prompt '5. Iniciales empleadas para nombrar fragmentos (p.e. JRC): '
Prompt 6. Indicar la estrategia de fragmentación para la tabla PAGO_EMPLEADO:
prompt    P - Con respecto a PROYECTO (default)
Prompt    E - Con respecto a EMPLEADO
accept p_pago_empleado default 'P' prompt 'Indicar valor (P|E): '

--crea Objetos
start s-08-validacion-pdb-create.plb &&p_pdb1 &&p_usuario &&p_usr_pwd &&p_pago_empleado 1
start s-08-validacion-pdb-create.plb &&p_pdb2 &&p_usuario &&p_usr_pwd &&p_pago_empleado 2
--ejecuta procedimientos
start s-08-validacion-pdb-execute.sql &&p_pdb1 &&p_usuario &&p_usr_pwd &&p_pago_empleado 1 &&p_iniciales
start s-08-validacion-pdb-execute.sql &&p_pdb2 &&p_usuario &&p_usr_pwd &&p_pago_empleado 2 &&p_iniciales

Prompt Listo!.
exit