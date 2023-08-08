select 
transaction_id,
transaction_details, 
CASE 
WHEN transaction_details like '%Indiaforensic%' THEN 'Indiaforensic'
END 
from `dbt-test-395011.dbt_huruizverastegui.transactions`
