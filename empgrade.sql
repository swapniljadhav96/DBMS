/*

Objective: Create a Procedure To Update the Grade of an Employee
Based on Some Conditions
Author Name: Swapnil Jadhav
Rno: 67
PRN Number: UCS21M1067
Batch: AS4

*/

Delimiter $$
create procedure empgrade(IN e  int)
Begin 
Declare Temp Decimal(6,2);
select esal into Temp from emp where eno=e ;
IF Temp <= 1200 Then
update emp set grade='Three'  where eno=e;
elseif ( Temp > 1200 AND  Temp <=6500) Then
update emp set grade='Two'  where eno=e;
elseif ( Temp >6500 ) Then
update emp set grade='One'  where eno=e;
END IF; 
End$$
Delimiter ;

/* Out Put:
mysql> use sample;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> desc emp;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| eno   | int          | NO   | PRI | NULL    |       |
| ename | varchar(12)  | YES  |     | NULL    |       |
| esal  | decimal(6,2) | YES  |     | NULL    |       |
| edesg | varchar(12)  | YES  |     | NULL    |       |
| dno   | int          | YES  |     | NULL    |       |
| grade | varchar(12)  | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> source /home/student/empgrade.sql


mysql> select * from emp;
+-----+-------+---------+-----------+------+--------+
| eno | ename | esal    | edesg     | dno  | grade  |
+-----+-------+---------+-----------+------+--------+
| 101 | Sai   | 1234.12 | Prof      |  123 | First  |
| 102 | Rahul | 3223.21 | Prof      |  103 | Second |
| 256 | Rushi | 4321.34 | Prof      |  323 | NULL   |
| 265 | yash  | 1256.23 | proffesor |  125 | second |
| 432 | abhi  | 7654.00 | assoc     |   21 | first  |
| 562 | Sai   | 2343.34 | Asst      |  345 | First  |
| 652 | Sai   | 5454.65 | Assoc     |  342 | Two    |
+-----+-------+---------+-----------+------+--------+
7 rows in set (0.00 sec)

mysql> insert into emp (eno,ename,esal,edesg,dno) values(675,'Rakesh',3221.23,'Prof',232);
Query OK, 1 row affected (0.08 sec)

mysql> select * from emp;
+-----+--------+---------+-----------+------+--------+
| eno | ename  | esal    | edesg     | dno  | grade  |
+-----+--------+---------+-----------+------+--------+
| 101 | Sai    | 1234.12 | Prof      |  123 | First  |
| 102 | Rahul  | 3223.21 | Prof      |  103 | Second |
| 256 | Rushi  | 4321.34 | Prof      |  323 | NULL   |
| 265 | yash   | 1256.23 | proffesor |  125 | second |
| 432 | abhi   | 7654.00 | assoc     |   21 | first  |
| 562 | Sai    | 2343.34 | Asst      |  345 | First  |
| 652 | Sai    | 5454.65 | Assoc     |  342 | Two    |
| 675 | Rakesh | 3221.23 | Prof      |  232 | NULL   |
+-----+--------+---------+-----------+------+--------+
8 rows in set (0.00 sec)

mysql> call empgrade(675);
Query OK, 0 rows affected (0.05 sec)

mysql> select * from emp;
+-----+--------+---------+-----------+------+--------+
| eno | ename  | esal    | edesg     | dno  | grade  |
+-----+--------+---------+-----------+------+--------+
| 101 | Sai    | 1234.12 | Prof      |  123 | First  |
| 102 | Rahul  | 3223.21 | Prof      |  103 | Second |
| 256 | Rushi  | 4321.34 | Prof      |  323 | NULL   |
| 265 | yash   | 1256.23 | proffesor |  125 | second |
| 432 | abhi   | 7654.00 | assoc     |   21 | first  |
| 562 | Sai    | 2343.34 | Asst      |  345 | First  |
| 652 | Sai    | 5454.65 | Assoc     |  342 | Two    |
| 675 | Rakesh | 3221.23 | Prof      |  232 | Two    |
+-----+--------+---------+-----------+------+--------+
8 rows in set (0.00 sec)

Note: eno 675 Grade is updated to TWO


*/

