/*
Problem Statement:- Create a trigger and procedure to update rating of a sailor
Name:- Jadhav Swapnil Jalindar
Batch:- AS4
Rno:- 67
PRN no. :- UCS21M1067
*/

Delimiter $$
create procedure update_rating(IN x int)
Begin
   update Sailors set
   srating = srating + 1
   where sid = x;
end $$
Delimiter ;

Delimiter $$
create trigger in_reserve
Before Insert
on reserve
for each row
Begin
call update_rating(new.sid);
end $$
Delimiter ;

/*
OUTPUT:
use BRS;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+---------------+
| Tables_in_BRS |
+---------------+
| Boats         |
| Sailors       |
| reserve       |
+---------------+
3 rows in set (0.00 sec)

mysql> insert into Boats values(1,'XYZ','Red');
Query OK, 1 row affected (0.01 sec)

mysql> insert into Boats values(2,'ABC','Black');
Query OK, 1 row affected (0.01 sec)

mysql> insert into Boats values(3,'LMN','Blue');
Query OK, 1 row affected (0.01 sec)

mysql> insert into Boats values(4,'ASD','Pink');
Query OK, 1 row affected (0.01 sec)

mysql> select *from Boats;
+------+-------+--------+
| bid  | bname | bcolor |
+------+-------+--------+
|    1 | XYZ   | Red    |
|    2 | ABC   | Black  |
|    3 | LMN   | Blue   |
|    4 | ASD   | Pink   |
+------+-------+--------+
4 rows in set (0.00 sec)

mysql> insert into Sailors values(101,'Abhi',5);
Query OK, 1 row affected (0.01 sec)

mysql> insert into Sailors values(102,'Chetan',8);
Query OK, 1 row affected (0.01 sec)

mysql> insert into Sailors values(103,'Tushar',11);
Query OK, 1 row affected (0.02 sec)

mysql> insert into Sailors values(104,'Sumit',14);
Query OK, 1 row affected (0.02 sec)

mysql> select *from Sailors;
+------+--------+---------+
| sid  | sname  | srating |
+------+--------+---------+
|  101 | Abhi   |       5 |
|  102 | Chetan |       8 |
|  103 | Tushar |      11 |
|  104 | Sumit  |      14 |
+------+--------+---------+
4 rows in set (0.00 sec)

mysql> source /home/sonu/trigger.sql
Query OK, 0 rows affected (0.03 sec)

Query OK, 0 rows affected (0.03 sec)

mysql> insert into reserve values(1,101,'2020-10-23');
Query OK, 1 row affected (0.04 sec)

mysql> insert into reserve values(2,102,'2021-04-13');
Query OK, 1 row affected (0.01 sec)

mysql> insert into reserve values(3,103,'2022-11-26');
Query OK, 1 row affected (0.01 sec)

mysql> insert into reserve values(4,104,'2012-07-09');
Query OK, 1 row affected (0.01 sec)

mysql> select *from Sailors;
+------+--------+---------+
| sid  | sname  | srating |
+------+--------+---------+
|  101 | Abhi   |       6 |
|  102 | Chetan |       9 |
|  103 | Tushar |      12 |
|  104 | Sumit  |      15 |
+------+--------+---------+
4 rows in set (0.00 sec)

mysql> 
*/
