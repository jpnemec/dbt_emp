with source_cte as (
  select 
    * 
  from 
    {{source('pc_fivetran_db', 'departures') }} src
), 
departures as (
  SELECT 
    "_ROW" as exit_reason_id, 
    "EXIT_REASON" as exit_reason, 
    "EMP_NO" as employee_number, 
    to_date("EXIT_DATE", 'MM/DD/YY') as exit_date, 
    "_FIVETRAN_SYNCED" as sync_date_time 
  FROM 
    source_cte
) 
select 
  * 
from 
  departures
