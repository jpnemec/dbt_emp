with source_cte as (
  select 
    * 
  from 
     {{ source('pc_fivetran_db','department_manager') }}
), 
department_manager as (
  SELECT 
    "_ROW" as department_manager_id, 
    "DEPT_NO" as department_code, 
    "EMP_NO" as employee_number, 
    "_FIVETRAN_SYNCED" as sync_date_time 
  FROM 
    source_cte
) 
select 
  * 
from 
  department_manager