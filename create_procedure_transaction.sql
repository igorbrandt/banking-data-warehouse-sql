-- Stored Procedure (função) que cadastrará uma transação
-- conferir se a transação é viável (novo saldo respeita o limite)
-- registrar transação e atualizar o saldo

-- os prefixos p_ (de parameter) são usados como conveção dentro de 
-- Stored Procedures para deeixar claro que estou me referindo ao parâmetro
-- que será passado, e não à coluna em si
CREATE OR REPLACE PROCEDURE make_transaction (
	IN p_transaction_type CHAR(1),
	IN p_transaction_description VARCHAR(20),
	IN p_transaction_value INTEGER,
	IN p_client_id UUID
)

LANGUAGE plpgsql

AS $$
-- DECLARE cria variáveis locais
DECLARE
	present_balance INTEGER;
	present_limit INTEGER;
BEGIN
	SELECT client_balance, client_limit 
	INTO present_balance, present_limit
	FROM balances
	WHERE client_id = p_client_id;

	-- RAISE NOTICE -> equivalente ao print() do Python
	RAISE NOTICE 'Saldo atual do cliente: %', present_balance;
	RAISE NOTICE 'Limite atual do cliente: %', present_limit;

	-- verifica limite necessário
	IF 
		p_transaction_type = 'd' 
		AND (present_balance - p_transaction_value) < - present_limit THEN
		RAISE EXCEPTION 'Limite inferior ao necessário para realizar a transação';
	END IF;

	-- verifica se é débito para atualizar o saldo
	UPDATE balances
	SET client_balance = client_balance +
		CASE WHEN p_transaction_type = 'd' THEN - p_transaction_value
		ELSE p_transaction_value END
	WHERE client_id = p_client_id;

	-- registra a transação em transactions
	INSERT INTO transactions (
		transaction_type, 
		transaction_description, 
		transaction_value, 
		client_id)
	VALUES (
		p_transaction_type, 
		p_transaction_description, 
		p_transaction_value, 
		p_client_id);
END;
$$;

