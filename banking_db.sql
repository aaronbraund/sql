CREATE TABLE transactions (
transaction_ID INTEGER PRIMARY KEY AUTOINCREMENT,
vendor TEXT,
date TEXT,
transaction_amount INTEGER);

INSERT INTO transactions (vendor, date, transaction_amount) VALUES
('Grocery Store', '2024-02-20', 150),
('Online Marketplace', '2024-02-21', 75),
('Bookstore', '2024-02-22', 45),
('Electronics Retail', '2024-02-23', 200),
('Coffee Shop', '2024-02-24', 30);

SELECT * FROM transactions;

UPDATE transactions
SET vendor = 'Waterstones'
WHERE transaction_id = 3;

SELECT * FROM transactions;

DELETE FROM transactions WHERE transaction_id = 3;

SELECT * FROM transactions;
