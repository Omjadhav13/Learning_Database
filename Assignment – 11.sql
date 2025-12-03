Assignment – 11
 Subqueries.
 1) Write a query that uses a subquery to obtain all orders for the customer named 
Cisneros. Assume you do not know his customer number (cnum). 

mysql> select * from orders where cnum=(select cnum from customers where cname='cisneros');
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
+------+---------+------------+------+------+


2) Write a query that produces the names and ratings of all customers who have 
above-average orders. 

mysql> select cname,rating from customers where cnum IN
    -> (select cnum from orders where amt >(select avg(amt) from orders));
+---------+--------+
| cname   | rating |
+---------+--------+
| Liu     |    200 |
| Clemens |    100 |
+---------+--------+

3) Write a query that selects the total amount in orders for each salesperson for 
whom this total is greater than the amount of the largest order in the table.

mysql> select snum,sum(amt) as total from orders group by snum having sum(amt)>(select max(amt) from orders);
+------+----------+
| snum | total    |
+------+----------+
| 1001 | 15382.07 |
+------+----------+
