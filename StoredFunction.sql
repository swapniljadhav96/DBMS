/* 
/*

Objective: Create a Fucntion  To Know the  Credit class of a cutomer
Based on Some Conditions
Author Name: Swapil Jadhav
Rno:67
PRN Number: UCS21M1067
Batch: AS4

*/

Delimiter $$
create function display(credit decimal(10,2)) Returns varchar(12) Deterministic
Begin
Declare cl varchar(12);
if credit > 50000 Then
set cl='Platinum';
elseif (credit <= 50000 and credit >=30000) Then
set cl='Gold';
elseif credit < 30000  Then
set cl='Silver';
end if;
Return (cl);
end $$
Delimiter ;


/* Output
mysql> show tables;
+------------------+
| Tables_in_sample |
+------------------+
| books_fine       |
| customer         |
| emp              |
| emp_dump         |
| student_books    |
+------------------+
5 rows in set (0.02 sec)

mysql> desc customer;
+---------+---------------+------+-----+---------+-------+
| Field   | Type          | Null | Key | Default | Extra |
+---------+---------------+------+-----+---------+-------+
| cid     | int           | NO   | PRI | NULL    |       |
| cname   | varchar(25)   | YES  |     | NULL    |       |
| camount | decimal(10,2) | YES  |     | NULL    |       |
+---------+---------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> select * from customer;
+-----+--------+----------+
| cid | cname  | camount  |
+-----+--------+----------+
|   1 | sai    | 34983.23 |
|   2 | Ram    | 64983.23 |
|   3 | Rahul  | 44983.23 |
|   4 | Rakesh | 24983.23 |
+-----+--------+----------+
4 rows in set (0.03 sec)

mysql> select cid,display(camount);
ERROR 1054 (42S22): Unknown column 'cid' in 'field list'
mysql> select cid,display(camount) from customer;
+-----+------------------+
| cid | display(camount) |
+-----+------------------+
|   1 | Gold             |
|   2 | Platinum         |
|   3 | Gold             |
|   4 | Silver           |
+-----+------------------+
4 rows in set (0.00 sec)

mysql> create view cr_level(cid,level) as select cid,display(camount) from customer;
Query OK, 0 rows affected (0.19 sec)

mysql> select * from cr_level;
+-----+----------+
| cid | level    |
+-----+----------+
|   1 | Gold     |
|   2 | Platinum |
|   3 | Gold     |
|   4 | Silver   |
+-----+----------+
4 rows in set (0.00 sec)


*/
