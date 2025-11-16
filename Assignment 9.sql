
1) Write a query that lists each order number followed by the name of the customer who made the order. 

mysql> select o.onum as 'Order Number',c.cname as ' Customer Name' from orders o join customers c on o.snum=c.snum ;
+--------------+---------------+
| Order Number | Customer Name |
+--------------+---------------+
|         3001 | Cisneros      |
|         3003 | Clemens       |
|         3003 | Hoffman       |
|         3002 | Pereira       |
|         3005 | Grass         |
|         3005 | Liu           |
|         3006 | Cisneros      |
|         3009 | Giovanni      |
|         3007 | Grass         |
|         3007 | Liu           |
|         3008 | Clemens       |
|         3008 | Hoffman       |
|         3010 | Grass         |
|         3010 | Liu           |
|         3011 | Clemens       |
|         3011 | Hoffman       |
+--------------+---------------+

2) Write a query that gives the names of both the salesperson and the customer for each order along with the order number.

mysql> select o.onum as Orders, s.sname as 'Salespeoples name', c.cname as ' Customer Name'
    -> from orders o
    -> join customers c
    ->  on o.cnum=c.cnum
    -> join salespeople s
    ->  on o.snum=s.snum;
+--------+-------------------+---------------+
| Orders | Salespeoples name | Customer Name |
+--------+-------------------+---------------+
|   3003 | Peel              | Hoffman       |
|   3009 | Axelrod           | Giovanni      |
|   3005 | Serres            | Liu           |
|   3010 | Serres            | Grass         |
|   3007 | Serres            | Grass         |
|   3011 | Peel              | Clemens       |
|   3008 | Peel              | Clemens       |
|   3006 | Rifkin            | Cisneros      |
|   3001 | Rifkin            | Cisneros      |
|   3002 | Motika            | Pereira       |
+--------+-------------------+---------------+

3) Write a query that produces all customers serviced by salespeople with a 
commission above 12%. Output the customer’s name, the salesperson’s name, 
and the salesperson’s rate of commission.


mysql> select c.cname 'Customer name', s.sname 'Salesperson',s.comm 'Commission'
    -> from customers c
    -> join salespeople s
    -> on c.snum=s.snum
    -> where s.comm>0.12;
+---------------+-------------+------------+
| Customer name | Salesperson | Commission |
+---------------+-------------+------------+
| Liu           | Serres      |       0.13 |
| Grass         | Serres      |       0.13 |
| Cisneros      | Rifkin      |       0.15 |
+---------------+-------------+------------+


4) Write a query that calculates the amount of the salesperson’s commission on each order by a customer with a rating above 100.

mysql> select o.amt*s.comm
    -> from orders o
    -> join customers c
    -> on o.cnum=c.cnum
    -> join salespeople s
    -> on o.snum=s.snum
    -> where c.rating>100;
+--------------+
| o.amt*s.comm |
+--------------+
|       170.29 |
|         9.85 |
|       670.86 |
|       164.72 |
|         2.80 |
|       171.32 |
+--------------+
