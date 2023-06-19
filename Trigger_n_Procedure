/* fine*/
1. trigger

delimiter $$ 
create trigger update_fine 
after insert on borrower 
for each row 
Begin
insert into fine(RollNo,dor,amt) values(new.rno,NULL,NULL);
end $$ 
delimiter ;

2. procedure
delimiter //
create procedure fine_amt(IN r int, IN dr date)
begin 
declare di date;
declare diff int;
declare fine_amt int;
select doi into di from borrower where rno = r;
set diff = DATEDIFF(dr,di);
if diff<=30 Then 
set fine_amt = 0;
update fine set amt = fine_amt,dor = dr where RollNo = r;
update borrower set status = 'R' where rno = r;
elseif(45>diff>30) then 
set fine_amt = 5*diff;
update fine set dor = dr,amt = fine_amt where RollNo = r;
update borrower set status = 'R' where rno = r;
elseif(diff > 45) then
set fine_amt = 30*diff; 
update fine set dor = dr,amt = fine_amt where RollNo = r;
update borrower set status = 'R' where rno = r;
end if;
end //
delimiter ;

mysql> desc borrower;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| rno    | int         | NO   | PRI | NULL    |       |
| name   | varchar(50) | YES  |     | NULL    |       |
| doi    | date        | YES  |     | NULL    |       |
| bname  | varchar(30) | YES  |     | NULL    |       |
| status | varchar(5)  | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+

mysql> desc fine;
+--------+------+------+-----+---------+-------+
| Field  | Type | Null | Key | Default | Extra |
+--------+------+------+-----+---------+-------+
| RollNo | int  | YES  |     | NULL    |       |
| dor    | date | YES  |     | NULL    |       |
| amt    | int  | YES  |     | NULL    |       |
+--------+------+------+-----+---------+-------+
3 rows in set (0.00 sec)

