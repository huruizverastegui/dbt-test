select 
replace(`Account No`,"'","") as account_no, 
`DATE` as date, 
`TRANSACTION DETAILS` as transaction_details,
`CHQ_NO` as chq_no,
`VALUE DATE` as value_date,
` WITHDRAWAL AMT ` as withdrawal_amt,
` DEPOSIT AMT ` as deposit_amt,
`BALANCE AMT` as balance_amt

from `dbt-test-395011.dbt_production.transactions_data`
