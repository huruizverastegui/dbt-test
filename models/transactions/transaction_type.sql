select 
transaction_id,
CASE 
WHEN withdrawal_amt > 0  THEN 'withdrawal'
WHEN deposit_amt > 0  THEN 'deposit'

END  as transaction_type
from `dbt-test-395011.dbt_huruizverastegui.transactions`
