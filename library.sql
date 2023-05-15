/*
Problem Statement: Procedure to update book status using trigger
Name:- Jadhav Swapnil Jalindar
Batch:- AS4
PRN:- UCS21M1067
Rno:- 67
*/

/*Trigger*/
Delimiter $$ 
Create trigger Insert_student 
before Insert ON student_book
for each row
Begin
insert into book_fine(rno , bid , status) values(new.rno , new.bid , 'I');
end $$
Delimiter ;

/*Procedure*/
Delimiter $$
create procedure update_amount(IN r int(4), IN b int(4), IN dr date)
Begin
Declare di date;
Declare y int(5);
Declare fine int;
update student_book set dor=dr where rno=r and bid=b;
select doi into di from student_book where rno = r and bid=b;
set y = DATEDIFF(dr, di);
if y <= 30 Then
set fine=0;
update book_fine set amt = 0, status='R' where rno=r and bid=b;
elseif (y>30 and y<45) Then
update book_fine set amt = y*5, status='R' where rno=r and bid=b;
elseif y > 45 Then
update book_fine set amt = y*10, status='R' where rno=r and bid=b;
end if;
end $$
Delimiter ;

/*
OUTPUT:
mysql> use sonu;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+-------------------+
| Tables_in_sonu |
+-------------------+
| book_fine         |
| student_book      |
+-------------------+
2 rows in set (0.00 sec)

mysql> select *from student_book;
+------+------+------------+------------+
| rno  | bid  | doi        | dor        |
+------+------+------------+------------+
|    6 |  106 | 2020-04-12 | 2020-05-10 |
+------+------+------------+------------+
1 row in set (0.00 sec)

mysql> select *from book_fine;
+------+------+--------+------+
| rno  | bid  | status | amt  |
+------+------+--------+------+
|    6 |  106 | R      |    0 |
+------+------+--------+------+
1 row in set (0.00 sec)

mysql> insert into student_book(rno,bid,doi) values(4,104,'2020-05-24');
Query OK, 1 row affected (0.01 sec)

mysql> select *from student_book;
+------+------+------------+------------+
| rno  | bid  | doi        | dor        |
+------+------+------------+------------+
|    6 |  106 | 2020-04-12 | 2020-05-10 |
|    4 |  104 | 2020-05-24 | NULL       |
+------+------+------------+------------+
2 rows in set (0.00 sec)

mysql> select *from book_fine;
+------+------+--------+------+
| rno  | bid  | status | amt  |
+------+------+--------+------+
|    6 |  106 | R      |    0 |
|    4 |  104 | I      | NULL |
+------+------+--------+------+
2 rows in set (0.00 sec)

mysql> source /home/sonu/library.sql;
ERROR 1359 (HY000): Trigger already exists
ERROR 1304 (42000): PROCEDURE update_amount already exists
mysql> call update_amount(4,104,'2020-06-30');
Query OK, 1 row affected (0.02 sec)

mysql> select *from student_book;
+------+------+------------+------------+
| rno  | bid  | doi        | dor        |
+------+------+------------+------------+
|    6 |  106 | 2020-04-12 | 2020-05-10 |
|    4 |  104 | 2020-05-24 | 2020-06-30 |
+------+------+------------+------------+
2 rows in set (0.00 sec)

mysql> select *from book_fine;
+------+------+--------+------+
| rno  | bid  | status | amt  |
+------+------+--------+------+
|    6 |  106 | R      |    0 |
|    4 |  104 | R      |  185 |
+------+------+--------+------+
2 rows in set (0.00 sec)

mysql> insert into student_book(rno,bid,doi) values(1,101,'2021-10-15');
Query OK, 1 row affected (0.01 sec)

mysql> select *from student_book;
+------+------+------------+------------+
| rno  | bid  | doi        | dor        |
+------+------+------------+------------+
|    6 |  106 | 2020-04-12 | 2020-05-10 |
|    4 |  104 | 2020-05-24 | 2020-06-30 |
|    1 |  101 | 2021-10-15 | NULL       |
+------+------+------------+------------+
3 rows in set (0.00 sec)

mysql> select *from book_fine;
+------+------+--------+------+
| rno  | bid  | status | amt  |
+------+------+--------+------+
|    6 |  106 | R      |    0 |
|    4 |  104 | R      |  185 |
|    1 |  101 | I      | NULL |
+------+------+--------+------+
3 rows in set (0.00 sec)

mysql> call update_amount(1,101,'2021-11-30');
Query OK, 1 row affected (0.02 sec)

mysql> select *from student_book;
+------+------+------------+------------+
| rno  | bid  | doi        | dor        |
+------+------+------------+------------+
|    6 |  106 | 2020-04-12 | 2020-05-10 |
|    4 |  104 | 2020-05-24 | 2020-06-30 |
|    1 |  101 | 2021-10-15 | 2021-11-30 |
+------+------+------------+------------+
3 rows in set (0.00 sec)

mysql> select *from book_fine;
+------+------+--------+------+
| rno  | bid  | status | amt  |
+------+------+--------+------+
|    6 |  106 | R      |    0 |
|    4 |  104 | R      |  185 |
|    1 |  101 | R      |  460 |
+------+------+--------+------+
3 rows in set (0.00 sec)

mysql> insert into student_book(rno,bid,doi) values(3,103,'2021-01-10');
Query OK, 1 row affected (0.02 sec)

mysql> call update_amount(3,103,'2021-01-24');
Query OK, 1 row affected (0.02 sec)

mysql> select *from student_book;
+------+------+------------+------------+
| rno  | bid  | doi        | dor        |
+------+------+------------+------------+
|    6 |  106 | 2020-04-12 | 2020-05-10 |
|    4 |  104 | 2020-05-24 | 2020-06-30 |
|    1 |  101 | 2021-10-15 | 2021-11-30 |
|    3 |  103 | 2021-01-10 | 2021-01-24 |
+------+------+------------+------------+
4 rows in set (0.00 sec)

mysql> select *from book_fine;
+------+------+--------+------+
| rno  | bid  | status | amt  |
+------+------+--------+------+
|    6 |  106 | R      |    0 |
|    4 |  104 | R      |  185 |
|    1 |  101 | R      |  460 |
|    3 |  103 | R      |    0 |
+------+------+--------+------+
4 rows in set (0.00 sec)

mysql> insert into student_book(rno,bid,doi) values(5,105,'2022-07-05');
Query OK, 1 row affected (0.02 sec)

mysql> select *from student_book;
+------+------+------------+------------+
| rno  | bid  | doi        | dor        |
+------+------+------------+------------+
|    6 |  106 | 2020-04-12 | 2020-05-10 |
|    4 |  104 | 2020-05-24 | 2020-06-30 |
|    1 |  101 | 2021-10-15 | 2021-11-30 |
|    3 |  103 | 2021-01-10 | 2021-01-24 |
|    5 |  105 | 2022-07-05 | NULL       |
+------+------+------------+------------+
5 rows in set (0.00 sec)

mysql> select *from book_fine;
+------+------+--------+------+
| rno  | bid  | status | amt  |
+------+------+--------+------+
|    6 |  106 | R      |    0 |
|    4 |  104 | R      |  185 |
|    1 |  101 | R      |  460 |
|    3 |  103 | R      |    0 |
|    5 |  105 | I      | NULL |
+------+------+--------+------+
5 rows in set (0.01 sec)

mysql> call update_amount(5,105,'2022-08-10');
Query OK, 1 row affected (0.02 sec)

mysql> select *from student_book;
+------+------+------------+------------+
| rno  | bid  | doi        | dor        |
+------+------+------------+------------+
|    6 |  106 | 2020-04-12 | 2020-05-10 |
|    4 |  104 | 2020-05-24 | 2020-06-30 |
|    1 |  101 | 2021-10-15 | 2021-11-30 |
|    3 |  103 | 2021-01-10 | 2021-01-24 |
|    5 |  105 | 2022-07-05 | 2022-08-10 |
+------+------+------------+------------+
5 rows in set (0.00 sec)

mysql> select *from book_fine;
+------+------+--------+------+
| rno  | bid  | status | amt  |
+------+------+--------+------+
|    6 |  106 | R      |    0 |
|    4 |  104 | R      |  185 |
|    1 |  101 | R      |  460 |
|    3 |  103 | R      |    0 |
|    5 |  105 | R      |  180 |
+------+------+--------+------+
5 rows in set (0.01 sec)

mysql> insert into student_book(rno,bid,doi) values(7,107,'2022-09-15');
Query OK, 1 row affected (0.02 sec)

mysql> select *from student_book;
+------+------+------------+------------+
| rno  | bid  | doi        | dor        |
+------+------+------------+------------+
|    6 |  106 | 2020-04-12 | 2020-05-10 |
|    4 |  104 | 2020-05-24 | 2020-06-30 |
|    1 |  101 | 2021-10-15 | 2021-11-30 |
|    3 |  103 | 2021-01-10 | 2021-01-24 |
|    5 |  105 | 2022-07-05 | 2022-08-10 |
|    7 |  107 | 2022-09-15 | NULL       |
+------+------+------------+------------+
6 rows in set (0.00 sec)

mysql> select *from book_fine;
+------+------+--------+------+
| rno  | bid  | status | amt  |
+------+------+--------+------+
|    6 |  106 | R      |    0 |
|    4 |  104 | R      |  185 |
|    1 |  101 | R      |  460 |
|    3 |  103 | R      |    0 |
|    5 |  105 | R      |  180 |
|    7 |  107 | I      | NULL |
+------+------+--------+------+
6 rows in set (0.00 sec)

mysql> call update_amount(7,107,'2022-11-18');
Query OK, 1 row affected (0.02 sec)

mysql> select *from student_book;
+------+------+------------+------------+
| rno  | bid  | doi        | dor        |
+------+------+------------+------------+
|    6 |  106 | 2020-04-12 | 2020-05-10 |
|    4 |  104 | 2020-05-24 | 2020-06-30 |
|    1 |  101 | 2021-10-15 | 2021-11-30 |
|    3 |  103 | 2021-01-10 | 2021-01-24 |
|    5 |  105 | 2022-07-05 | 2022-08-10 |
|    7 |  107 | 2022-09-15 | 2022-11-18 |
+------+------+------------+------------+
6 rows in set (0.00 sec)

mysql> select *from book_fine;
+------+------+--------+------+
| rno  | bid  | status | amt  |
+------+------+--------+------+
|    6 |  106 | R      |    0 |
|    4 |  104 | R      |  185 |
|    1 |  101 | R      |  460 |
|    3 |  103 | R      |    0 |
|    5 |  105 | R      |  180 |
|    7 |  107 | R      |  640 |
+------+------+--------+------+
6 rows in set (0.00 sec)

mysql> insert into student_book(rno,bid,doi) values(8,108,'2023-03-05');
Query OK, 1 row affected (0.00 sec)

mysql> select *from student_book;
+------+------+------------+------------+
| rno  | bid  | doi        | dor        |
+------+------+------------+------------+
|    6 |  106 | 2020-04-12 | 2020-05-10 |
|    4 |  104 | 2020-05-24 | 2020-06-30 |
|    1 |  101 | 2021-10-15 | 2021-11-30 |
|    3 |  103 | 2021-01-10 | 2021-01-24 |
|    5 |  105 | 2022-07-05 | 2022-08-10 |
|    7 |  107 | 2022-09-15 | 2022-11-18 |
|    8 |  108 | 2023-03-05 | NULL       |
+------+------+------------+------------+
7 rows in set (0.00 sec)

mysql> select *from book_fine;
+------+------+--------+------+
| rno  | bid  | status | amt  |
+------+------+--------+------+
|    6 |  106 | R      |    0 |
|    4 |  104 | R      |  185 |
|    1 |  101 | R      |  460 |
|    3 |  103 | R      |    0 |
|    5 |  105 | R      |  180 |
|    7 |  107 | R      |  640 |
|    8 |  108 | I      | NULL |
+------+------+--------+------+
7 rows in set (0.00 sec)

mysql> call update_amount(8,108,'2023-04-28');
Query OK, 1 row affected (0.02 sec)

mysql> select *from student_book;
+------+------+------------+------------+
| rno  | bid  | doi        | dor        |
+------+------+------------+------------+
|    6 |  106 | 2020-04-12 | 2020-05-10 |
|    4 |  104 | 2020-05-24 | 2020-06-30 |
|    1 |  101 | 2021-10-15 | 2021-11-30 |
|    3 |  103 | 2021-01-10 | 2021-01-24 |
|    5 |  105 | 2022-07-05 | 2022-08-10 |
|    7 |  107 | 2022-09-15 | 2022-11-18 |
|    8 |  108 | 2023-03-05 | 2023-04-28 |
+------+------+------------+------------+
7 rows in set (0.00 sec)

mysql> select *from book_fine;
+------+------+--------+------+
| rno  | bid  | status | amt  |
+------+------+--------+------+
|    6 |  106 | R      |    0 |
|    4 |  104 | R      |  185 |
|    1 |  101 | R      |  460 |
|    3 |  103 | R      |    0 |
|    5 |  105 | R      |  180 |
|    7 |  107 | R      |  640 |
|    8 |  108 | R      |  540 |
+------+------+--------+------+
7 rows in set (0.01 sec)

mysql>

*/
