1) Assume each salesperson has a 12% commission. Write a query on the orders 
table that will produce the order number, the salesperson number, and the amount 
of the salesperson’s commission for that order. 

mysql> select onum,snum,amt,amt*0.12 as Commission
    -> from orders;
+------+------+---------+------------+
| onum | snum | amt     | Commission |
+------+------+---------+------------+
| 3001 | 1007 |   18.69 |       2.24 |
| 3003 | 1001 |  767.19 |      92.06 |
| 3002 | 1004 | 1900.10 |     228.01 |
| 3005 | 1002 | 5160.45 |     619.25 |
| 3006 | 1007 | 1098.16 |     131.78 |
| 3009 | 1003 | 1713.23 |     205.59 |
| 3007 | 1002 |   75.75 |       9.09 |
| 3008 | 1001 | 4723.00 |     566.76 |
| 3010 | 1002 | 1309.95 |     157.19 |
| 3011 | 1001 | 9891.88 |    1187.03 |
+------+------+---------+------------+

2) Write a query on the Customers table that will find the highest rating in each city. 
Put the output in this form: 
For the city (city), the highest rating is : (rating). 

mysql> select concat ( 'For the city ',(city) ,'the highest rating is :', max(rating) ) as 'highest rating per city' 
 from customers group by city;
+-------------------------------------------------+
| highest rating per city                         |
+-------------------------------------------------+
| For the city Londonthe highest rating is :100   |
| For the city Romethe highest rating is :200     |
| For the city San Josethe highest rating is :300 |
| For the city Berlinthe highest rating is :300   |
+-------------------------------------------------+

3) Write a query that lists customers in descending order of rating. Output the rating field first, followed by the customer’s name and number. 

mysql> select rating ,cname,cnum from customers order by rating desc;
+--------+----------+------+
| rating | cname    | cnum |
+--------+----------+------+
|    300 | Grass    | 2004 |
|    300 | Cisneros | 2008 |
|    200 | Giovanni | 2002 |
|    200 | Liu      | 2003 |
|    100 | Hoffman  | 2001 |
|    100 | Clemens  | 2006 |
|    100 | Pereira  | 2007 |
+--------+----------+------+

4) Write a query that totals the orders for each day and places the results in descending order. 

mysql> select odate,sum(amt)
    -> from orders
    -> group by odate
    -> order by odate desc;
+------------+----------+
| odate      | sum(amt) |
+------------+----------+
| 1990-10-06 | 11201.83 |
| 1990-10-05 |  4723.00 |
| 1990-10-04 |  1788.98 |
| 1990-10-03 |  8944.59 |
