select 
replace(`Account No`,"'","") as account_no, 
DATE_ADD(PARSE_DATE('%b %d, %Y',`DATE`), INTERVAL 2000 YEAR) as date,
`TRANSACTION DETAILS` as transaction_details,
`CHQNO` as chq_no,
DATE_ADD(PARSE_DATE('%b %d, %Y',`VALUE DATE`), INTERVAL 2000 YEAR) as value_date,
` WITHDRAWAL AMT ` as withdrawal_amt,
` DEPOSIT AMT ` as deposit_amt,
`BALANCE AMT` as balance_amt

from `dbt-test-395011.dbt_production.transactions_data`
