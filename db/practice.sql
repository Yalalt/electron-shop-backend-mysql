
-- 7
SELECT * FROM customers INNER JOIN payments ON payments.customerNumber=customers.customerNumber WHERE payments.amount > customers.creditLimit;


-- 8
SELECT SUM(amount), paymentDate AS 'Total Income' FROM payments WHERE paymentDate >= '2003-05-06' AND paymentDate <= '2003-12-31';

-- 9
SELECT * FROM customers INNER JOIN (SELECT DISTINCT customerNumber, paymentDate FROM payments WHERE paymentDate >= '2003-05-06' AND paymentDate <= '2003-12-31') A ON A.customerNumber=customers.customerNumber;

-- 10
SELECT customerName, status, phone, city, country FROM customers INNER JOIN (SELECT customerNumber, status FROM orders WHERE status <> 'Resolved' AND status <> 'Shipped') A ON A.customerNumber=customers.customerNumber;

