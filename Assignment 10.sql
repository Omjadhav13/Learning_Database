1) Write a query that produces all pairs of salespeople who are living in the same city. Exclude combinations of salespeople with themselves as well as duplicate rows with the order reversed. 

mysql> select s.sname,s1.sname
    ->  from salespeople s
    ->  join salespeople s1
    ->  on s.city=s1.city
    -> where s.sname!=s1.sname and s.snum<s1.snum;
+-------+--------+
| sname | sname  |
+-------+--------+
| Peel  | Motika |
+-------+--------+


2) Write a query that produces the names and cities of all customers with the same rating as Hoffman. 

mysql> select cname,city from customers where rating =
    ->  (select rating from customers where cname='hoffman');
+---------+--------+
| cname   | city   |
+---------+--------+
| Hoffman | London |
| Clemens | London |
| Pereira | Rome   |
+---------+--------+
