select 
CAST(replace(`Account No`,"'","") AS INTEGER) as account_no, 
DATE_ADD(PARSE_DATE('%b %d, %Y',`DATE`), INTERVAL 2000 YEAR) as date,
`TRANSACTION DETAILS` as transaction_details,
CAST(`CHQNO` AS INTEGER) as chq_no,
DATE_ADD(PARSE_DATE('%b %d, %Y',`VALUE DATE`), INTERVAL 2000 YEAR) as value_date,
CAST(` WITHDRAWAL AMT ` AS FLOAT64) as withdrawal_amt,
CAST(` DEPOSIT AMT ` AS FLOAT64) as deposit_amt,
CAST(`BALANCE AMT` AS FLOAT64) as balance_amt

from `dbt-test-395011.dbt_production.transactions_data`
