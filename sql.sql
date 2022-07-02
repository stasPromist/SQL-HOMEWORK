create database realEstate;
use realEstate;
create table houses
  (id int not null auto_increment primary key,
  rooms_number int,
  balconies_number int,
  age_of_house int,
  price int,
  realtor_id int
  );


insert into houses values
(0,3,1,15,1000000,1),
(0,4,1,10,1500000,2),
(0,5,2,5,2000000,3),
(0,6,2,1,3000000,4),
  
 (0,3,0,40,900000,1),
 (0,4,1,20,1700000,2),
 (0,5,2,5,2000000,3),
 (0,7,2,1,5000000,4);
  
  
  
 create table realtors
  (id int not null auto_increment primary key,
  realtor_name varchar (15),
    seniority int,
  phone_number varchar(20)
   );

insert into realtors values
(0,"Alexander",10,"055-222-33-44"),
(0,"Vladimir",5,"054-111-33-55"),
(0,"Nir",15,"052-222-88-99"),
(0,"Rony",30,"054-545-65-87");

select * from houses;
select *from realtors;


alter table houses add constraint real_house foreign key(realtor_id) references realtors(id);



select realtor_id, price from houses where realtor_id = 1 and price = greatest(0,1);
select realtor_id, price from houses where price = (select max(price) from houses);
-- select realtor_name, max(price) max_price from houses p
-- inner join realtors b on b.id = p.realtor_id group by realtor_id having max(price)  order by max_price desc;
--  CALL `realestate`.`new_procedure`();

 
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`()
BEGIN
declare x int;
set x =1;
while x <= 4 do
 select realtor_id, price from houses p
  inner join realtors b on b.id = p.realtor_id where price = (select max(price) from houses where realtor_id = x);
  set x = x +1;
 end while;
END