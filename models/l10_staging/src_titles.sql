with source_cte as (
  select 
    * 
  from 
    {{source('pc_fivetran_db', 'titles') }} src
), 
titles as (
  SELECT 
    "_ROW" as title_id, 
    "TITLE_ID" as title_code, 
    "TITLE" as title, 
    "_FIVETRAN_SYNCED" as sync_date_time 
  FROM 
    source_cte
) 
select 
  * 
from 
  titles