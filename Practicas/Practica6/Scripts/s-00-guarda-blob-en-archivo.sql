create or replace procedure guarda_blob_en_archivo (
  v_directory_name in varchar2,
  v_dest_file_name in varchar2,
  v_table_name in varchar2,
  v_blob_column_name in varchar2,
  v_pk1_column_name in varchar2,
  v_pk1_column_value in varchar2,
  v_pk2_column_name  in varchar2,
  v_pk2_column_value in varchar2) is

    --Variables del programa
    v_file utl_file.FILE_TYPE;
    v_buffer_size number := 32767;
    v_buffer RAW(32767);
    v_blob blob;
    v_blob_length number;
    v_position number;
    v_query varchar2(2000);

    --Variables de validación
    v_valid_table_name       varchar2(30);
    v_valid_blob_column_name varchar2(30);
    v_valid_pk1_column_name  varchar2(30);
    v_valid_pk2_column_name  varchar2(30);

    begin
		--Validamos que los campos sean correctos.
		v_valid_table_name := dbms_assert.simple_sql_name(v_table_name);
		v_valid_blob_column_name := dbms_assert.simple_sql_name(v_blob_column_name);
		v_valid_pk1_column_name := dbms_assert.simple_sql_name(v_pk1_column_name);


		--Realizamos el query para la búsqueda del archivo, colocamos los placeholders correspondientes
		v_query := 'select ' ||v_valid_blob_column_name ||' into :ph_blob'
			||' from ' || v_valid_table_name
			||' where '
			||v_valid_pk1_column_name||'=' ||':ph_pk1_column_value';

		--Si se especifica una segunda columna se debe colocar la otra condición y ejecutamos segun el caso
		if v_pk2_column_name is not null then
			v_valid_pk2_column_name := dbms_assert.simple_sql_name(v_pk2_column_name);
		  	v_query := v_query 
		  	|| ' and '  || v_valid_pk2_column_name  || '= :ph_pk2_column_value';
		  	execute immediate v_query into v_blob using v_pk1_column_value, v_pk2_column_value;
		else
			execute immediate v_query into v_blob using v_pk1_column_value;
		end if;


		--Obtenemos la longitud del archivo traido en la consulta, creamos archivo.
		v_blob_length := dbms_lob.getlength(v_blob);
		v_position := 1;
		v_file := utl_file.fopen(v_directory_name,v_dest_file_name,'wb',32767);


		--Leemos los datos del archivo por partes y los escribimos en el nuevo, empezamos desde la posición 1
		while v_position < v_blob_length loop
		  dbms_lob.read(v_blob,v_buffer_size,v_position,v_buffer);
		  UTL_FILE.put_raw(v_file,v_buffer,TRUE);
		  v_position := v_position + v_buffer_size;
		end loop;
		utl_file.fclose(v_file);

		-- cierra el archivo en caso de error y relanza la excepción.
		exception when others then
		  if utl_file.is_open(v_file) then
		    utl_file.fclose(v_file);
		  end if;
		raise;
	end guarda_blob_en_archivo;
/
show errors;
