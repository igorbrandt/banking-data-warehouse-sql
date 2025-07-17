-- Criando um procedure simples

CREATE OR REPLACE PROCEDURE make_transaction (
	IN p_transaction_type CHAR(1),
	IN p_transaction_description VARCHAR(20),
	IN p_transaction_value INTEGER,
	IN p_client_id UUID
)

LANGUAGE plpgsql

AS $$

BEGIN
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