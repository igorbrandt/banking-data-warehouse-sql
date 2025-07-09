CREATE TABLE IF NOT EXISTS clients (
	client_id SERIAL PRIMARY KEY NOT NULL,
	client_name TEXT NOT NULL,
	client_birth_date DATE NOT NULL,
	client_fee_based BOOLEAN NOT NULL,
	client_active BOOLEAN NOT NULL
);

