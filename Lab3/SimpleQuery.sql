-- SELECT * FROM account;
-- SELECT * FROM currency;
-- SELECT * FROM bank_transaction;
-- SELECT * FROM credit;
-- SELECT * FROM deposit;
-- SELECT * FROM credit_product;
-- SELECT * FROM client_category;
-- SELECT * FROM bank_branch;
-- SELECT * FROM client_staff;
-- SELECT * FROM staff;
-- SELECT * FROM client;

-- SELECT * FROM client WHERE first_name = 'Иван' AND last_name = 'Собачкин';

-- SELECT * FROM client
-- JOIN account ON client.client_id = account.client_id
-- WHERE account.balance > 6000;

-- SELECT * FROM bank_transaction ORDER BY transaction_datetime DESC;

-- SELECT * FROM credit_product WHERE is_actual = true ORDER BY max_amount DESC LIMIT 1;

-- SELECT department, COUNT(*) AS employee_count FROM staff GROUP BY department;

-- SELECT SUM(balance) AS total_balance FROM account;

-- SELECT * FROM client WHERE email LIKE '%@gmail.com';

-- SELECT * FROM bank_transaction WHERE transaction_datetime > '2023-01-02';

-- SELECT * FROM client ORDER BY last_name;
