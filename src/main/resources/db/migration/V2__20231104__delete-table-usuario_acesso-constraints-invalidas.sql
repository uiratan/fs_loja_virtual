select ccu.constraint_name 
from information_schema.constraint_column_usage ccu 
where ccu.table_name = 'usuario_acesso'
and ccu.column_name = 'acesso_id'
and ccu.constraint_name <> 'unique_acesso_user';

alter table usuario_acesso drop constraint "uk_fhwpg5wu1u5p306q8gycxn9ky";