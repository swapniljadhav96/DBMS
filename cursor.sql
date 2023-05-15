/* Problem statement : 
   Creating a Cursor to copy procedure data of one table into another table;
   Name:- Jadhav Swapnil Jalindar
   Class:- S.Y.
   Div:- A
   Batch:- AS34
   Roll no:- 67
*/

Delimiter $$
create procedure cursor50()
begin
	declare vfinished int default 0;
	declare id1 int(3);
	declare name1 varchar(20);
	declare sal decimal(6,2);
	declare dg varchar(20);
	declare dn int(3);
	declare gr varchar(20);
	
declare emp_cursor cursor for select * from emp;
declare continue handler for not found set vfinished=1;

open emp_cursor;
getdata:loop
     fetch  emp_cursor into id1,name1,sal,dg,dn,gr;
     if vfinished=1 then
     leave getdata;
     end if;
    
    insert into emp_dump values(id1,name1,sal,dg,dn,gr);
    end loop getdata;
    close emp_cursor;
    end;
$$
Delimiter ;

/*
OUTPUT:
use sonu;
Database changed
mysql> show tables;
Empty set (0.00 sec)

mysql> create table emp(id int(3), name varchar(20), salary float(6,2), desg varchar(20), dno int(3), grade varchar(2));
Query OK, 0 rows affected, 3 warnings (5.51 sec)

mysql> show tables;
+-------------------+
| Tables_in_sonu |
+-------------------+
| emp               |
+-------------------+
1 row in set (0.00 sec)

mysql> desc emp;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| id     | int         | YES  |     | NULL    |       |
| name   | varchar(20) | YES  |     | NULL    |       |
| salary | float(6,2)  | YES  |     | NULL    |       |
| desg   | varchar(20) | YES  |     | NULL    |       |
| dno    | int         | YES  |     | NULL    |       |
| grade  | varchar(2)  | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
6 rows in set (0.24 sec)

mysql> insert into emp values(1,'abhi',3456.22,'clerk',101,'A');
Query OK, 1 row affected (0.15 sec)

mysql> insert into emp values(2,'chetan',5647.18,'manager',102,'A+');
Query OK, 1 row affected (0.04 sec)

mysql> insert into emp values(3,'piyush',2345.68,'A.engi',103,'B');
Query OK, 1 row affected (0.02 sec)

mysql> insert into emp values(4,'tushar',9999.99,'J.engi',104,'B+');
Query OK, 1 row affected (0.01 sec)

mysql> select *from emp;
+------+--------+---------+---------+------+-------+
| id   | name   | salary  | desg    | dno  | grade |
+------+--------+---------+---------+------+-------+
|    1 | abhi   | 3456.22 | clerk   |  101 | A     |
|    2 | chetan | 5647.18 | manager |  102 | A+    |
|    3 | piyush | 2345.68 | A.engi  |  103 | B     |
|    4 | tushar | 9999.99 | J.engi  |  104 | B+    |
+------+--------+---------+---------+------+-------+
4 rows in set (0.05 sec)

mysql> create table emp_dump(id int(3), name varchar(20), salary float(6,2), desg varchar(20), dno int(3), grade varchar(2));
Query OK, 0 rows affected, 3 warnings (2.87 sec)

mysql> select *from emp_dump;
Empty set (0.00 sec)

mysql> show tables;
+-------------------+
| Tables_in_sonu |
+-------------------+
| emp               |
| emp_dump          |
+-------------------+
2 rows in set (0.00 sec)

mysql> source /home/sonu/cursor.sql
Query OK, 0 rows affected, 2 warnings (0.29 sec)

mysql> call cursor50;
Query OK, 0 rows affected (0.15 sec)

mysql> select *from emp_dump;
+------+--------+---------+---------+------+-------+
| id   | name   | salary  | desg    | dno  | grade |
+------+--------+---------+---------+------+-------+
|    1 | abhi   | 3456.22 | clerk   |  101 | A     |
|    2 | chetan | 5647.18 | manager |  102 | A+    |
|    3 | piyush | 2345.68 | A.engi  |  103 | B     |
|    4 | tushar | 9999.99 | J.engi  |  104 | B+    |
+------+--------+---------+---------+------+-------+
4 rows in set (0.00 sec)

mysql> 


*/
