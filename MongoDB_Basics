student@student-Veriton-M200-H61:~$ mongo
MongoDB shell version v3.6.8

> show dbs;
104        0.000GB
Adi        0.000GB

product    0.000GB
sample     0.000GB
test       0.000GB
> use xyz;
switched to db xyz
> show collections;

> use product;
switched to db product
> show collections;
Product
> use sample;
switched to db sample
> show collections;
bick
movie
product
> use xyz;
switched to db xyz
> db.emp.insert({eno:123,ename:"sai",esal:322.23});
WriteResult({ "nInserted" : 1 })
> db.emp.insert({eno:124,ename:"Sai ram",esal:522.23,edesg:"Asst Prof"},{eno:231,edept:"Comp",skillset:["c","c++","DBMS"]});
WriteResult({ "nInserted" : 1 })
> 
> db.emp.find();
{ "_id" : ObjectId("6449fff198d0188b1552fb6b"), "eno" : 123, "ename" : "sai", "esal" : 322.23 }
{ "_id" : ObjectId("644a00c698d0188b1552fb6c"), "eno" : 124, "ename" : "Sai ram", "esal" : 522.23, "edesg" : "Asst Prof" }
> db.emp.insert({eno:231,edept:"Comp",skillset:["c","c++","DBMS"]});
WriteResult({ "nInserted" : 1 })
> db.emp.find();
{ "_id" : ObjectId("6449fff198d0188b1552fb6b"), "eno" : 123, "ename" : "sai", "esal" : 322.23 }
{ "_id" : ObjectId("644a00c698d0188b1552fb6c"), "eno" : 124, "ename" : "Sai ram", "esal" : 522.23, "edesg" : "Asst Prof" }
{ "_id" : ObjectId("644a013298d0188b1552fb6d"), "eno" : 231, "edept" : "Comp", "skillset" : [ "c", "c++", "DBMS" ] }
> db.emp.find().pretty();
{
	"_id" : ObjectId("6449fff198d0188b1552fb6b"),
	"eno" : 123,
	"ename" : "sai",
	"esal" : 322.23
}
{
	"_id" : ObjectId("644a00c698d0188b1552fb6c"),
	"eno" : 124,
	"ename" : "Sai ram",
	"esal" : 522.23,
	"edesg" : "Asst Prof"
}
{
	"_id" : ObjectId("644a013298d0188b1552fb6d"),
	"eno" : 231,
	"edept" : "Comp",
	"skillset" : [
		"c",
		"c++",
		"DBMS"
	]
}
> db.emp.find();
{ "_id" : ObjectId("6449fff198d0188b1552fb6b"), "eno" : 123, "ename" : "sai", "esal" : 322.23 }
{ "_id" : ObjectId("644a00c698d0188b1552fb6c"), "eno" : 124, "ename" : "Sai ram", "esal" : 522.23, "edesg" : "Asst Prof" }
{ "_id" : ObjectId("644a013298d0188b1552fb6d"), "eno" : 231, "edept" : "Comp", "skillset" : [ "c", "c++", "DBMS" ] }
> db.emp.find().pretty();
{
	"_id" : ObjectId("6449fff198d0188b1552fb6b"),
	"eno" : 123,
	"ename" : "sai",
	"esal" : 322.23
}
{
	"_id" : ObjectId("644a00c698d0188b1552fb6c"),
	"eno" : 124,
	"ename" : "Sai ram",
	"esal" : 522.23,
	"edesg" : "Asst Prof"
}
{
	"_id" : ObjectId("644a013298d0188b1552fb6d"),
	"eno" : 231,
	"edept" : "Comp",
	"skillset" : [
		"c",
		"c++",
		"DBMS"
	]
}

> db.emp.find({eno:124},{ename:1});
{ "_id" : ObjectId("644a00c698d0188b1552fb6c"), "ename" : "Sai ram" }
> db.emp.find({eno:124});
{ "_id" : ObjectId("644a00c698d0188b1552fb6c"), "eno" : 124, "ename" : "Sai ram", "esal" : 522.23, "edesg" : "Asst Prof" }
> db.emp.find({eno:124}).pretty();
{
	"_id" : ObjectId("644a00c698d0188b1552fb6c"),
	"eno" : 124,
	"ename" : "Sai ram",
	"esal" : 522.23,
	"edesg" : "Asst Prof"
}
> db.emp.find({eno:124},{esal:1}).pretty();
{ "_id" : ObjectId("644a00c698d0188b1552fb6c"), "esal" : 522.23 }
> db.emp.find({eno:124},{esal:1,ename:1}).pretty();
{
	"_id" : ObjectId("644a00c698d0188b1552fb6c"),
	"ename" : "Sai ram",
	"esal" : 522.23
}
> db.emp.find({eno:124},{esal:0}).pretty();
{
	"_id" : ObjectId("644a00c698d0188b1552fb6c"),
	"eno" : 124,
	"ename" : "Sai ram",
	"edesg" : "Asst Prof"
}

> db.emp.remove({eno:124});
WriteResult({ "nRemoved" : 1 })
> db.emp.find().pretty();
{
	"_id" : ObjectId("6449fff198d0188b1552fb6b"),
	"eno" : 123,
	"ename" : "sai",
	"esal" : 322.23
}
{
	"_id" : ObjectId("644a013298d0188b1552fb6d"),
	"eno" : 231,
	"edept" : "Comp",
	"skillset" : [
		"c",
		"c++",
		"DBMS"
	]
}
> 

