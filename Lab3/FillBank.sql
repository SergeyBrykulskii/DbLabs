INSERT INTO client_category (client_category_name, description, criteria, bonus)
VALUES ('Обычный', 'Стандартная категория клиентов', 'Нет дополнительных требований', 'Бонусные баллы за операции'),
       ('VIP', 'Привилегированная категория клиентов', 'Высокий баланс и активность', 'Повышенный уровень бонусов, выше приритет скорости обслуживания');

INSERT INTO currency (currency_name, code, symbol)
VALUES ('Рубль', 643, '₽'),
       ('Доллар', 840, '$');
	   
INSERT INTO account (currency_id, balance, opening_date)
VALUES (1, 10000.00, '2023-01-01'),
       (1, 5000.00, '2023-01-01');
	   
INSERT INTO client (account_id, client_category_id, first_name, last_name, email, phone, client_password)
VALUES (1, 1, 'Иван', 'Собачкин', 'ivan@gmail.com', '+375331234567', 'пароль1'),
       (2, 2, 'Анна', 'Котова', 'elena@gmail.com', '+375299876543', 'пароль2');	
	   	   
INSERT INTO bank_transaction (account_id, amount, bank_transaction_type, transaction_datetime, description)
VALUES (1, 500.00, 'Пополнение', '2023-01-01 10:00:00', 'Пополнение счета'),
       (1, -200.00, 'Снятие', '2023-01-02 15:30:00', 'Снятие наличных');
	   
INSERT INTO deposit (account_id, deposit_type, amount, issuance_date, is_early_withdrawal, interestRate, term)
VALUES (1, 'Срочный', 10000.00, '2023-01-01', false, 0.05, 12),
       (2, 'Срочный', 5000.00, '2023-01-01', false, 0.03, 6);
	   
INSERT INTO working_hours (opening_time, closing_time)
VALUES ('08:00:00', '18:00:00'),
       ('09:00:00', '17:00:00');

INSERT INTO address (country, sity, street, house_number)
VALUES ('Беларусь', 'Минск', 'Гикало', 9),
       ('Беларусь', 'Минск', 'Беды', 4);

INSERT INTO bank_branch (address_id, working_hours_id, bank_branch_name, phone)
VALUES (1, 1, 'Главный офис', '+375331234123'),
  	   (2, 2, 'Филиал 1', '+375331234123');	   
	   
INSERT INTO staff (bank_branch_id, first_name, last_name, staff_password, phone, job_position, department)
VALUES (1, 'Александр', 'Иванов', 'пароль3', '1111111111', 'Менеджер', 'Отдел продаж'),
       (1, 'Ольга', 'Соколова', 'пароль4', '2222222222', 'Кассир', 'Отдел обслуживания');

INSERT INTO credit_product (credit_product_name, credit_product_type, description, max_amount, interest_rate, is_actual)
VALUES ('Потребительский кредит На старт', 'Потребительский', 'Кредит для личных нужд', 100000.00, 0.1, true),
       ('Ипотека Рост', 'Ипотечный', 'Кредит на приобретение недвижимости', 1000000.00, 0.05, true);

INSERT INTO credit (account_id, credit_product_id, amount, issuance_date, repayment_period)
VALUES (1, 1, 10000.00, '2023-01-01', 12),
       (2, 2, 5000.00, '2023-01-01', 6);