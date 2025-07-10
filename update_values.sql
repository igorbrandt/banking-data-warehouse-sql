UPDATE balances
SET client_balance = client_balance + 
  CASE 
    WHEN t.transaction_type = 'd' THEN -t.transaction_value
    WHEN t.transaction_type = 'c' THEN  t.transaction_value
  END
FROM transactions t
WHERE t.client_id = balances.client_id
  AND t.transaction_id = 'ID_DA_TRANSACAO';


SELECT * FROM balances