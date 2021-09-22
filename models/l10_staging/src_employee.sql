with source_cte as (
  select 
    * 
  from 
    {{source('pc_fivetran_db', 'employee') }} src
), 
employee as (
  SELECT 
    "_ROW" as employee_id, 
    "EMP_NO" as employee_number, 
    "LAST_NAME" as last_name, 
    "FIRST_NAME" as first_name, 
    to_date("BIRTH_DATE", 'MM/DD/YY') as birth_date, 
    to_date("HIRE_DATE", 'MM/DD/YY') as hire_date, 
    left("SEX", 1) as sex, 
    "EMP_TITLE_ID" as employee_title_id, 
    "_FIVETRAN_SYNCED" as sync_date_time 
  FROM 
    source_cte
) 
select 
  * 
from 
  employee