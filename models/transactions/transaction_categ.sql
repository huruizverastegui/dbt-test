select 
transaction_id,
CASE 
WHEN transaction_details like '%Indiaforensic%' THEN 'Indiaforensic'
WHEN transaction_details like '%CASHDEP%' THEN 'Cash deposit'
WHEN transaction_details like '%RTGS%' THEN 'Real-time Gross Settlement'
WHEN transaction_details like '%IMPS%' THEN 'Immediate Payment Service'
WHEN transaction_details like '%RUPAY%' THEN 'RUPAY'
WHEN transaction_details like '%AEPS%' THEN 'Aadhaar Enabled Payment System'
WHEN transaction_details like '%INTERNAL FUND%' THEN 'Internal fund transfer'
ELSE 'Others'

END  as transaction_categ
from `dbt-test-395011.dbt_huruizverastegui.transactions`
