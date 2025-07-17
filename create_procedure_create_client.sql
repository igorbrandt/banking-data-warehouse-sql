CREATE OR REPLACE PROCEDURE create_client (
	IN p_client_name VARCHAR(40),
	IN p_client_birth_date DATE,
	IN p_client_fee_based BOOLEAN,
	IN p_client_active BOOLEAN)

LANGUAGE plpgsql

AS $$

BEGIN
	INSERT INTO clients (
		client_name,
		client_birth_date,
		client_fee_based,
		client_active)
	VALUES(
		p_client_name,
		p_client_birth_date,
		p_client_fee_based,
		p_client_active);
END;
$$;