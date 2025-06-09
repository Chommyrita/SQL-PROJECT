--- JOIN STATEMENT
/* THREE TYPES OF JOIN AS FOLLOWS
 1. LEFT JOIN
 2. RIGHT JOIN
 3. INNER JOIN
 4.FULL JOIN E.T.C */

/* INNER JOIN : RETURNS RECORDS THAT HAVE MATCHING VALUES */
--- SYNTAX FOR JOIN :
/* SELECT COLUMN(S) FROM TABLE1
INNER JOIN TABLE2
ON TABLE1.COLUMNNAME =TABLE2.COLUMNNAME */

/* EXAMPLE 1: 
Show all customers, including those who haven’t placed an order. 
Display customer names and associated order IDs.*/

SELECT * FROM CUSTOMERS,orders;

SELECT CUSTOMERS.customer_name,orders.order_id
FROM CUSTOMERS
LEFT JOIN orders
ON CUSTOMERS.customer_id = orders.customer_id;

-- example 2
-- List all products and include the order IDs of 
-- orders that contain those products.
select products.product_name, orderdetails.order_id
from products
left join orderdetails
on products.product_id = orderdetails.product_id;

-- example 3
-- List each customer’s name and the names of products 
-- they have ordered
select customers.customer_name, products.product_name
from customers
inner join orders
on customers.customer_id =orders.customer_id
inner join orderdetails
on orders.order_id = orderdetails.order_id
inner join products
on products.product_id = orderdetails.product_id;


