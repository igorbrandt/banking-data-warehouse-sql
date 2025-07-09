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
FROM clients