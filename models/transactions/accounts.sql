select replace(`Account No`,"'","") as account_no
from `dbt-test-395011.dbt_production.transactions_data`
group by 1
