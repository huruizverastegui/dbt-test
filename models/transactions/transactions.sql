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
WHEN `TRANSACTION DETAILS` like '%Indiaforensic%' THEN 'Indiaforensic'
WHEN `TRANSACTION DETAILS` like '%CASHDEP%' THEN 'Cash deposit'
WHEN `TRANSACTION DETAILS` like '%RTGS%' THEN 'Real-time Gross Settlement'
WHEN `TRANSACTION DETAILS` like '%IMPS%' THEN 'Immediate Payment Service'
WHEN `TRANSACTION DETAILS` like '%RUPAY%' THEN 'RUPAY'
WHEN `TRANSACTION DETAILS` like '%AEPS%' THEN 'Aadhaar Enabled Payment System'
WHEN `TRANSACTION DETAILS` like '%INTERNAL FUND%' THEN 'Internal fund transfer'
ELSE 'Others'
END  as category, 

CASE 
WHEN ` WITHDRAWAL AMT ` > 0  THEN 'withdrawal'
WHEN ` DEPOSIT AMT ` > 0  THEN 'deposit'

END  as type

from `dbt-test-395011.dbt_huruizverastegui.transactions_data`
