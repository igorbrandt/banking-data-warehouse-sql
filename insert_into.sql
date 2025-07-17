-- Populando as tabelas

---- TABELA CLIENTS ----
INSERT INTO clients (
	client_name, 
	client_birth_date, 
	client_fee_based, 
	client_active)
VALUES
	('Igor', '1995-10-06', FALSE, TRUE),
	('Roberto', '1997-12-02', FALSE, FALSE),
	('Alice', '2000-01-15', TRUE, TRUE),
	('Antônio', '1980-07-20', TRUE, FALSE);

SELECT *
FROM clients;

---- TABELA BALANCES ----
INSERT INTO balances (
	client_id,
	client_balance, 
	client_limit)
VALUES
	('f4a24086-8842-47ff-91de-d425bfc9b5cb', 56000, 50000),
	('7b749378-c4e8-4472-bc32-904dd00fbd79', 47000, 30000),
	('d7ae6372-5450-40ad-bb4a-d50d2543c953', 62000, 100000),
	('c73a025a-d1f1-4fc1-9d2f-0362cdc840fd', 25000, 20000);

SELECT *
FROM balances;

---- TABELA TRANSACTIONS ----
INSERT INTO transactions (
	client_id,
	transaction_type,
	transaction_description,
	transaction_value,
	transaction_time
)
VALUES
	('f4a24086-8842-47ff-91de-d425bfc9b5cb','d','compra mercado', 10000, NOW()),
	('7b749378-c4e8-4472-bc32-904dd00fbd79','c','PIX recebido', 6000, NOW()),
	('d7ae6372-5450-40ad-bb4a-d50d2543c953','d','compra refeição', 7500, NOW()),
	('c73a025a-d1f1-4fc1-9d2f-0362cdc840fd','c','TED recebida', 12000, NOW());

SELECT *
FROM transactions;