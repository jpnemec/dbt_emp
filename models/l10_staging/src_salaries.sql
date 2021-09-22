with source_cte as (
  select 
    * 
  from 
    {{source('pc_fivetran_db', 'salaries') }} src
), 
salaries as (
  SELECT 
    "_ROW" as salary_id, 
    "EMP_NO" as employee_number, 
    "SALARY" as salary, 
    "_FIVETRAN_SYNCED" as sync_date_time 
  FROM 
    source_cte
) 
select 
  * 
from 
  salaries