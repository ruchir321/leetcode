CREATE TABLE p2292_orders (
    order_id INT,
    product_id INT,
    quantity INT,
    purchase_date DATE,
    PRIMARY KEY (order_id)
);

INSERT INTO p2292_orders (order_id, product_id, quantity, purchase_date) VALUES
(1, 1,   7, '2020-03-16'),
(2, 1,   4, '2020-12-02'),
(3, 1,   7, '2020-05-10'),
(4, 1,   6, '2021-12-23'),
(5, 1,   5, '2021-05-21'),
(6, 1,   6, '2021-10-11'),
(7, 2,   6, '2022-10-11');

SELECT * FROM p2292_orders;





WITH table1 AS (
    SELECT
        product_id,
        COUNT(product_id) AS order_count,
        EXTRACT (YEAR FROM purchase_date) AS order_year
    FROM
        p2292_orders
    GROUP BY
        product_id,
        EXTRACT (YEAR FROM purchase_date)
),

table2 AS (
    SELECT
        product_id,
        COUNT(product_id) AS order_count,
        EXTRACT (YEAR FROM purchase_date) AS order_year
    FROM
        p2292_orders
    GROUP BY
        product_id,
        EXTRACT (YEAR FROM purchase_date)
)

SELECT *
FROM table1
JOIN table2
ON table1.product_id = table2.product_id AND table1.order_year = table2.order_year + 1
WHERE table1.order_count >= 3 and table2.order_count >= 3;








INSERT INTO p2292_orders (order_id, product_id, quantity, purchase_date) VALUES
(15, 2,   7, '2020-03-16'),
(16, 2,   4, '2021-12-02'),
(17, 2,   7, '2021-05-10');


SELECT * FROM p2292_orders;

WITH table1 AS (
    SELECT
        product_id,
        COUNT(product_id) AS order_count,
        EXTRACT (YEAR FROM purchase_date) AS order_year
    FROM
        p2292_orders
    GROUP BY
        product_id,
        EXTRACT (YEAR FROM purchase_date)
),

table2 AS (
    SELECT
        product_id,
        COUNT(product_id) AS order_count,
        EXTRACT (YEAR FROM purchase_date) AS order_year
    FROM
        p2292_orders
    GROUP BY
        product_id,
        EXTRACT (YEAR FROM purchase_date)
)

SELECT DISTINCT(table1.product_id)
FROM table1
JOIN table2
ON table1.product_id = table2.product_id AND table1.order_year = table2.order_year + 1
WHERE table1.order_count >= 3 and table2.order_count >= 3;
