-- Criando as tabelas

---- EXTENSÃO UUID ----
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

---- TABELA CLIENTS ----
CREATE TABLE IF NOT EXISTS clients (
	client_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	client_name TEXT NOT NULL,
	client_birth_date DATE NOT NULL,
	client_fee_based BOOLEAN NOT NULL,
	client_active BOOLEAN NOT NULL
);

---- TABELA BALANCES ----
CREATE TABLE IF NOT EXISTS balances (
	client_id UUID NOT NULL,
	client_balance INTEGER NOT NULL,
	client_limit INTEGER NOT NULL,
	FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

---- TABELA TRANSACTIONS ----
CREATE TABLE IF NOT EXISTS transactions (
	transaction_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	client_id UUID NOT NULL,
	transaction_type CHAR(1) NOT NULL,
	transactions_desciption VARCHAR(20) NOT NULL,
	tranaction_value INTEGER NOT NULL,
	transaction_time TIMESTAMP NOT NULL DEFAULT NOW(),
	FOREIGN KEY (client_id) REFERENCES clients(client_id)
);