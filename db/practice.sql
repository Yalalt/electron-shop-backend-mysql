-- 7

SELECT *
FROM customers
    INNER JOIN payments ON payments.customerNumber = customers.customerNumber
WHERE
    payments.amount > customers.creditLimit;

-- 8

SELECT
    SUM(amount),
    paymentDate AS 'Total Income'
FROM payments
WHERE
    paymentDate >= '2003-05-06'
    AND paymentDate <= '2003-12-31';

-- 9

SELECT *
FROM customers
    INNER JOIN (
        SELECT
            DISTINCT customerNumber,
            paymentDate
        FROM payments
        WHERE
            paymentDate >= '2003-05-06'
            AND paymentDate <= '2003-12-31'
    ) A ON A.customerNumber = customers.customerNumber;

-- 10

SELECT
    customerName,
    status,
    phone,
    city,
    country
FROM customers
    INNER JOIN (
        SELECT
            customerNumber,
            status
        FROM orders
        WHERE
            status <> 'Resolved'
            AND status <> 'Shipped'
    ) A ON A.customerNumber = customers.customerNumber;

-- 11

SELECT *
FROM orders ord
    LEFT JOIN customers cus ON ord.customerNumber = cus.customerNumber
WHERE
    ord.shippedDate > ord.requiredDate;

-- 12

SELECT *
FROM customers cus
    RIGHT JOIN (
        SELECT
            customerNumber,
            MAX(custom) Orders
        FROM (
                SELECT
                    customerNumber,
                    COUNT(customerNumber) custom
                FROM orders
                GROUP BY
                    customerNumber
                ORDER BY
                    COUNT(customerNumber) DESC
            ) A
    ) B ON cus.customerNumber = B.customerNumber;

-- 13

SELECT *
FROM products
    RIGHT JOIN (
        SELECT
            productCode,
            MAX(ordCar) quantity
        FROM (
                SELECT
                    *,
                    SUM(quantityOrdered) ordCar
                FROM
                    orderdetails
                GROUP BY
                    productCode
                ORDER BY
                    SUM(quantityOrdered) DESC
            ) tableA
    ) tableB ON products.productCode = tableB.productCode;

-- 14

SELECT
    SUM(quantityOrdered) AS Sum_Planes
FROM orders
    RIGHT JOIN (
        SELECT
            orderNumber,
            quantityOrdered
        FROM
            orderdetails orderD
            RIGHT JOIN (
                SELECT
                    productCode
                FROM products
                WHERE
                    productLine = 'Planes'
            ) prods ON orderD.productCode = prods.productCode
    ) tableC ON orders.orderNumber = tableC.orderNumber
WHERE status = 'Shipped';

-- 15

SELECT
    SUM(priceEach) AS Classic_Cars_Price
FROM orders
    RIGHT JOIN (
        SELECT
            orderNumber,
            quantityOrdered,
            priceEach
        FROM
            orderdetails orderD
            RIGHT JOIN (
                SELECT
                    productCode
                FROM products
                WHERE
                    productLine = 'Classic Cars'
            ) prods ON orderD.productCode = prods.productCode
    ) tableC ON orders.orderNumber = tableC.orderNumber
WHERE status = 'Shipped';

-- 16

SELECT
    productLine,
    productVendor,
    SUM(quantityOrdered) Zaragdsan
FROM products p
    LEFT JOIN (
        SELECT
            productCode,
            shippedDate,
            status,
            quantityOrdered,
            priceEach
        FROM orders o
            LEFT JOIN orderdetails d ON o.orderNumber = d.orderNumber
        WHERE
            YEAR(o.shippedDate) = '2003'
            AND o.status = 'Shipped'
    ) tblO ON p.productCode = tblO.productCode
GROUP BY productLine;

-- 17

SELECT *
FROM orderdetails O
    LEFT JOIN (
        SELECT *
        FROM orders
        WHERE
            NOT status = 'Cancelled'
            AND NOT status = 'Disputed'
    ) B ON O.orderNumber = B.orderNumber;

SELECT *
FROM (
        SELECT *
        FROM products
        WHERE quantityInStock < 100
    ) A
    LEFT JOIN (
        SELECT
            productCode,
            SUM(quantityOrdered) SumOrdered
        FROM orderdetails
        GROUP BY
            productCode
    ) B ON A.productCode = B.productCode;


-- 18

SELECT AVG(buyPrice) averagePrice FROM products p2;


SELECT * FROM products p1 WHERE buyPrice > (SELECT AVG(buyPrice) averagePrice FROM products);

use classicmodels;

SELECT p1.* FROM products p1 JOIN (SELECT AVG(buyPrice) average FROM products) p2 ON p1.buyPrice > p2.average;


--- 19

SELECT p1.* FROM products p1 JOIN (SELECT MAX(quantityInStock) maxInStock FROM products) p2 ON p1.quantityInStock >= p2.maxInStock;

--- 20

SELECT
    *
FROM
    products pr1
    JOIN (
        SELECT
            productCode,
            quantityOrdered,
            priceEach
        FROM
            orderdetails Od1
            JOIN (
                SELECT
                    orderNumber
                FROM
                    orders O1
                    JOIN (
                        SELECT
                            customerNumber
                        FROM
                            customers
                        ORDER BY
                            RAND()
                        limit
                            1
                    ) Cus ON O1.customerNumber = Cus.customerNumber
            ) Od2 ON Od1.orderNumber = Od2.orderNumber
    ) pr2 ON pr1.productCode = pr2.productCode;