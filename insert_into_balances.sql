INSERT INTO balances (
	client_id, 
	client_balance, 
	client_limit)
VALUES
	(1, 56000, 50000),
	(2, 47000, 30000),
	(3, 62000, 100000),
	(4, 25000, 20000);

SELECT *
FROM balances