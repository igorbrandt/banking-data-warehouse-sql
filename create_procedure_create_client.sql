-- cria o registro do cliente nas tabelas clients e balances

CREATE OR REPLACE PROCEDURE create_client (
	IN p_client_name VARCHAR(40),
	IN p_client_birth_date DATE,
	IN p_client_fee_based BOOLEAN,
	IN p_client_active BOOLEAN,
	IN p_client_balance INTEGER,
	IN p_client_limit INTEGER
)
	
LANGUAGE plpgsql

AS $$

DECLARE
	v_client_id UUID;

BEGIN
	-- Insere na tabela clients e retorna o client_id na variável local
	INSERT INTO clients (
		client_name,
		client_birth_date,
		client_fee_based,
		client_active)
	VALUES(
		p_client_name,
		p_client_birth_date,
		p_client_fee_based,
		p_client_active)
	RETURNING client_id
	INTO v_client_id;

	-- Usa o v_client_id retornado para popular a tabela balances
	INSERT INTO balances (
		client_id,
		client_balance,
		client_limit)
	VALUES(
		v_client_id,
		p_client_balance,
		p_client_limit);
END;

$$;