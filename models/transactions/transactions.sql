select 
CAST(replace(`Account No`,"'","") AS INTEGER) as account_no, 
DATE_ADD(PARSE_DATE('%b %d, %Y',`DATE`), INTERVAL 2000 YEAR) as date,
GENERATE_UUID() as transaction_id,
`TRANSACTION DETAILS` as transaction_details,
CAST(`CHQNO` AS INTEGER) as chq_no,
DATE_ADD(PARSE_DATE('%b %d, %Y',`VALUE DATE`), INTERVAL 2000 YEAR) as value_date,
CAST(` WITHDRAWAL AMT ` AS FLOAT64) as withdrawal_amt,
CAST(` DEPOSIT AMT ` AS FLOAT64) as deposit_amt,
CAST(`BALANCE AMT` AS FLOAT64) as balance_amt, 

CASE 
WHEN transaction_details like '%Indiaforensic%' THEN 'Indiaforensic'
WHEN transaction_details like '%CASHDEP%' THEN 'Cash deposit'
WHEN transaction_details like '%RTGS%' THEN 'Real-time Gross Settlement'
WHEN transaction_details like '%IMPS%' THEN 'Immediate Payment Service'
WHEN transaction_details like '%RUPAY%' THEN 'RUPAY'
WHEN transaction_details like '%AEPS%' THEN 'Aadhaar Enabled Payment System'
WHEN transaction_details like '%INTERNAL FUND%' THEN 'Internal fund transfer'
ELSE 'Others'

END  as category

from `dbt-test-395011.dbt_huruizverastegui.transactions_data`
