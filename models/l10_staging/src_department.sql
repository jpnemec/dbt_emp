with source_cte as (
  select 
    * 
  from 
    {{source('pc_fivetran_db', 'department') }} src
), 
department as (
  SELECT 
    "_ROW" as department_id, 
    "DEPT_NO" as department_code, 
    "DEPT_NAME" as department_name, 
    "_FIVETRAN_SYNCED" as sync_date_time 
  FROM 
    source_cte
) 
select 
  * 
from 
  department