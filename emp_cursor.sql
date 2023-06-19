delimiter //
create procedure proc_copy()
begin
	declare vfinished int default 0;
	declare i int;
	declare n varchar(10);
	declare s decimal(6,2);
	declare dg varchar(12);
	declare dn int;
	declare gr varchar(12);
	
declare emp_cursor cursor for select * from emp;
declare continue handler for not found set vfinished=1;

open emp_cursor;
getdata:loop
     fetch  emp_cursor into i,n,s,dg,dn,gr;
     if vfinished=1 then
     leave getdata;
     end if;
    
    insert into emp_dump values(i,n,s,dg,dn,gr);
    end loop getdata;
    close emp_cursor;
    end;
    //
    
  /* 
  
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
6 rows in set (0.01 sec)

mysql> create table emp_dump(eno int,ename varchar(12),esal decimal(6,2),edesg varchar(12),dno int,grade varchar(12));
Query OK, 0 rows affected (0.68 sec)

mysql> source /home/student/emp_cursor.sql
Query OK, 0 rows affected (0.14 sec)

mysql> call proc_copy();
    -> //
Query OK, 0 rows affected (0.87 sec)

mysql> select * from emp_dump;
    -> //
+------+-------+---------+-----------+------+--------+
| eno  | ename | esal    | edesg     | dno  | grade  |
+------+-------+---------+-----------+------+--------+
|  101 | Sai   | 1234.12 | Prof      |  123 | First  |
|  102 | Rahul | 3223.21 | Prof      |  103 | Second |
|  256 | Rushi | 4321.34 | Prof      |  323 | NULL   |
|  265 | yash  | 1256.23 | proffesor |  125 | second |
|  432 | abhi  | 7654.00 | assoc     |   21 | first  |
|  562 | Sai   | 2343.34 | Asst      |  345 | First  |
|  652 | Sai   | 5454.65 | Assoc     |  342 | Two    |
+------+-------+---------+-----------+------+--------+
7 rows in set (0.00 sec)


*/
