/*
Problem Statement: Perform different operations on student and dept table.
Name:- Jadhav Swapnil Jalindar
Batch:- AS4
Rno:- 67
PRN no. :- UCS21M1067
*/
mysql> use Operations;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> select *from student;
+------+---------+---------+
| rno  | name    | sfees   |
+------+---------+---------+
|    1 | kaushal | 1234.56 |
|    2 | abhi    | 4534.67 |
|    3 | sagar   | 2321.78 |
|    4 | adesh   | 5653.45 |
|    5 | tushar  |  700.00 |
|    6 | om      | 1000.99 |
|    7 | krishna | 2223.67 |
+------+---------+---------+
7 rows in set (0.00 sec)

mysql> insert into student values(8,'sumit',1298.91);
Query OK, 1 row affected (0.05 sec)

mysql> delete from student where rno=3;
Query OK, 1 row affected (0.08 sec)

mysql> update student set sfees=2001.63 where name='om';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select *from student;
+------+---------+---------+
| rno  | name    | sfees   |
+------+---------+---------+
|    1 | kaushal | 1234.56 |
|    2 | abhi    | 4534.67 |
|    4 | adesh   | 5653.45 |
|    5 | tushar  |  700.00 |
|    6 | om      | 2001.63 |
|    7 | krishna | 2223.67 |
|    8 | sumit   | 1298.91 |
+------+---------+---------+
7 rows in set (0.01 sec)

mysql> select count(rno) from student;
+------------+
| count(rno) |
+------------+
|          7 |
+------------+
1 row in set (0.00 sec)

mysql> select count(*) from student;
+----------+
| count(*) |
+----------+
|        7 |
+----------+
1 row in set (0.05 sec)

mysql> select avg(rno) from student;
+----------+
| avg(rno) |
+----------+
|   4.7143 |
+----------+
1 row in set (0.00 sec)

mysql> select avg(sfees) from student;
+-------------+
| avg(sfees)  |
+-------------+
| 2520.984305 |
+-------------+
1 row in set (0.00 sec)

mysql> select min(sfees) from student;
+------------+
| min(sfees) |
+------------+
|     700.00 |
+------------+
1 row in set (0.00 sec)

mysql> select max(sfees) from student;
+------------+
| max(sfees) |
+------------+
|    5653.45 |
+------------+
1 row in set (0.00 sec)

mysql> select name from student where sfees=(select max(sfees) from student);
+-------+
| name  |
+-------+
| adesh |
+-------+
1 row in set (1.25 sec)

mysql> select name from student where sfees=(select min(sfees) from student);
+--------+
| name   |
+--------+
| tushar |
+--------+
1 row in set (0.00 sec)

mysql> select *from student;
+------+---------+---------+
| rno  | name    | sfees   |
+------+---------+---------+
|    1 | kaushal | 1234.56 |
|    2 | abhi    | 4534.67 |
|    4 | adesh   | 5653.45 |
|    5 | tushar  |  700.00 |
|    6 | om      | 2001.63 |
|    7 | krishna | 2223.67 |
|    8 | sumit   | 1298.91 |
+------+---------+---------+
7 rows in set (0.00 sec)

mysql> create table dept(rno int(3),dno int(3),dname varchar(20));
Query OK, 0 rows affected, 2 warnings (0.38 sec)

mysql> select *from dept;
+------+------+-------+
| rno  | dno  | dname |
+------+------+-------+
|    1 |   10 | comp  |
|    2 |   11 | mech  |
|    3 |   12 | civil |
|    4 |   13 | ece   |
|    5 |   14 | mtx   |
|    7 |   16 | it    |
|    8 |   17 | str   |
+------+------+-------+
7 rows in set (0.00 sec)

mysql> select student.name, dept.dname from student inner join dept on dept.rno=student.rno;
+---------+-------+
| name    | dname |
+---------+-------+
| kaushal | comp  |
| abhi    | mech  |
| adesh   | ece   |
| tushar  | mtx   |
| krishna | it    |
| sumit   | str   |
+---------+-------+
6 rows in set (0.00 sec)

mysql> select student.name, dept.dname from student left join dept on dept.rno=student.rno;
+---------+-------+
| name    | dname |
+---------+-------+
| kaushal | comp  |
| abhi    | mech  |
| adesh   | ece   |
| tushar  | mtx   |
| om      | NULL  |
| krishna | it    |
| sumit   | str   |
+---------+-------+
7 rows in set (0.00 sec)

mysql> select student.name, dept.dname from student right join dept on dept.rno=student.rno;
+---------+-------+
| name    | dname |
+---------+-------+
| kaushal | comp  |
| abhi    | mech  |
| NULL    | civil |
| adesh   | ece   |
| tushar  | mtx   |
| krishna | it    |
| sumit   | str   |
+---------+-------+
7 rows in set (0.00 sec)

mysql> create view sfees as select *from student where sfees<=1500;
Query OK, 0 rows affected (0.10 sec)

mysql> select *from sfees;
+------+---------+---------+
| rno  | name    | sfees   |
+------+---------+---------+
|    1 | kaushal | 1234.56 |
|    5 | tushar  |  700.00 |
|    8 | sumit   | 1298.91 |
+------+---------+---------+
3 rows in set (0.00 sec)

mysql>
