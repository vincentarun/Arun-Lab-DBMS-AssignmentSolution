create database ECom;
use Ecom;
create table supplier (SUPP_ID INT PRIMARY KEY, SUPP_NAME varchar(50) NOT NULL, SUPP_CITY VARCHAR(50) NOT NULL, SUPP_PHONE VARCHAR(50) NOT NULL);
create table customer (CUS_ID INT PRIMARY KEY, 
					   CUS_NAME varchar(20) NOT NULL, 
                       CUS_PHONE VARCHAR(10) NOT NULL, 
                       CUS_CITY VARCHAR(30) NOT NULL, 
                       CUS_GENDER CHAR
                       );
create table category (CAT_ID INT PRIMARY KEY, 
                       CAT_NAME varchar(20) NOT NULL
                       );
create table product (PRO_ID INT PRIMARY KEY, 
                      PRO_NAME varchar(20) NOT NULL default "Dummy", 
                      PRO_DESC VARCHAR(60), 
                      CAT_ID INT NOT NULL,
                      FOREIGN KEY(CAT_ID) references category(CAT_ID)
                      );
create table supplier_pricing (PRICING_ID INT PRIMARY KEY, 
                               PRO_ID INT NOT NULL, SUPP_ID INT NOT NULL, 
                               foreign key (PRO_ID) references PRODUCT(PRO_ID), 
                               foreign key (SUPP_ID) references supplier (SUPP_ID), SUPP_PRICE int default 0
                               );
create table `order` (ORD_ID INT PRIMARY KEY, 
                     ORDER_AMOUNT INT NOT NULL, 
                     ORDER_DATE date NOT NULL, 
                     CUS_ID INT NOT NULL, 
                     PRICING_ID INT NOT NULL,
                     foreign key (CUS_ID) references customer (CUS_ID), 
                     foreign key (PRICING_ID) references supplier_pricing (PRICING_ID)
                     );
create table rating (RAT_ID INT PRIMARY KEY, 
                     ORD_ID INT NOT NULL, 
                     foreign key (ORD_ID) references `order` (ORD_ID), 
                     RAT_RATSTARS INT NOT NULL
                     );

/*/Supplier table/*/
insert into supplier values (1,"Rajest Retails", "Delhi", "1234567890");
insert into supplier values (2,"Appario Ltd.", "Mumbai", "2589631470");
insert into supplier values (3,"Knome Products", "Bangalore", "9785462315");
insert into supplier values (4,"Bansal Retails", "Kochi", "8975463285");
insert into supplier values (5,"Mittal Ltd.", "Lucknow", "7998456532");

/*/Customer table/*/
insert into customer values (1,"AAKASH","9999999999", "DELHI", "M");
insert into customer values (2,"AMAN","9785463215", "NOIDA","M" );
insert into customer values (3,"NEHA","9999999998", "MUMBAI", "F");
insert into customer values (4,"MEGHA","9994562399", "KOLKATA", "F");
insert into customer values (5,"PULKIT","7895999999", "LUCKNOW", "M");

/*/Category table/*/
insert into category values (1,"BOOKS");
insert into category values (2,"GAMES");
insert into category values (3,"GROCERIES");
insert into category values (4,"ELECTRONICS");
insert into category values (5,"CLOTHES");

/*/Product table/*/
insert into product values (1,"GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2);
insert into product values (2,"TSHIRT", "SIZE-L with Black, Blue and White variations", 5);
insert into product values (3,"ROG LAPTOP", "Windows 10 with 15inch screen, i7 processor, 1TB SSD", 4);
insert into product values (4,"OATS", "Highly Nutritious from Nestle", 3);
insert into product values (5,"HARRY POTTER", "Best Collection of all time by J.K Rowling", 1);
insert into product values (6,"MILK", "1L Toned MIlk", 3);
insert into product values (7,"Boat Earphones", "1.5Meter long Dolby Atmos", 4);
insert into product values (8,"Jeans", "Stretchable Denim Jeans with various sizes and color", 5);
insert into product values (9,"Project IGI", "compatible with windows 7 and above", 2);
insert into product values (10,"Hoodie", "Black GUCCI for 13 yrs and above", 5);
insert into product values (11,"Rich Dad Poor Dad", "Written by RObert Kiyosaki", 1);
insert into product values (12,"Train Your Brain", "By Shireen Stephen", 1);

/*/Supplier_pricing table/*/
insert into supplier_pricing  values (1,1,2,1500);
insert into supplier_pricing  values (2,3,5,30000);
insert into supplier_pricing  values (3,5,1,3000);
insert into supplier_pricing  values (4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);



/*/Order table/*/
insert into `order` values (101,1500,'2021-10-06', 2, 1);
insert into `order` values (102,1000,'2021-10-12', 3, 5);
insert into `order` values (103,30000,'2021-09-16', 5, 2);
insert into `order` values (104,1500,'2021-10-05', 1, 1);
insert into `order` values (105,3000,'2021-08-16', 4, 3);
insert into `order` values (106,1450,'2021-08-18', 1, 9);
insert into `order` values (107,789,'2021-09-01', 3, 7);
insert into `order` values (108,780,'2021-09-07', 5, 6);
insert into `order` values (109,3000,'2021-08-10', 5, 3);
insert into `order` values (110,2500,'2021-09-10', 2, 4);
insert into `order` values (111,1000,'2021-09-15', 4, 5);
insert into `order` values (112,789,'2021-09-16', 4, 7);
insert into `order` values (113,31000,'2021-09-16', 1, 8);
insert into `order` values (114,1000,'2021-09-16', 3, 5);
insert into `order` values (115,3000,'2021-09-16', 5, 3);
insert into `order` values (116,99,'2021-09-17', 2, 14);

/*/Rating table/*/
insert into rating values (1,101,4);
insert into rating values (2,102,3);
insert into rating values (3,103,1);
insert into rating values (4,104,2);
insert into rating values (5,105,4);
insert into rating values (6,106,3);
insert into rating values (7,107,4);
insert into rating values (8,108,4);
insert into rating values (9,109,3);
insert into rating values (10,110,5);
insert into rating values (11,111,3);
insert into rating values (12,112,4);
insert into rating values (13,113,2);
insert into rating values (14,114,1);
insert into rating values (15,115,1);
insert into rating values (16,116,0);


/*3*/
select CUS_GENDER as GENDER, count(distinct(CUS_ID)) as NoOfCustomers from
(select customer.CUS_ID, customer.CUS_GENDER from customer inner join 
(select CUS_ID from ECom.order where order_amount >=3000) as filter_order
on customer.CUS_ID = filter_order.CUS_ID) as filter_customer group by CUS_GENDER;


/*4*/
select order_details.*, prod.pro_name from product as prod inner join
(select ord.*, price.PRO_ID from Ecom.order as ord inner join supplier_pricing as price on
ord.PRICING_ID = price.PRICING_ID where ord.CUS_ID = 2) as order_details on
order_details.PRO_ID = prod.PRO_ID;


/*5*/
select supplier.* from supplier where supplier.supp_id in 
(select supp_id from supplier_pricing group by supp_id having
count(supp_id)>1);


/*6*/
select category.cat_id, category.cat_name, min(t3.min_price) as Min_Price from category inner join
(select product.cat_id, product.pro_name, t2.* from product inner join 
(select pro_id, min(supp_price) as Min_Price from supplier_pricing group by pro_id)
as t2 where t2.pro_id = product.pro_id)
as t3 where t3.cat_id = category.cat_id group by t3.cat_id;


/*7*/
select pro_id, pro_name from product where pro_id in
(select pro_id from supplier_pricing where pricing_id in
(select pricing_id from Ecom.order where order_date > '2021-10-05'));


/*8*/
select customer.cus_name, customer.cus_gender from customer where
customer.cus_name like 'A%' or customer.cus_name like '%A';


/*9*/
DELIMITER &&
create procedure proc()
begin
select report.supp_id, report.supp_name, report.Average,
case
when report.Average = 5 then 'Excellent Service'
when report.Average > 4 then 'Good Service' 
when report.Average > 2 then 'Average Service'
else 'Poor Service'
end as Type_Of_Service from
(select	final.supp_id, supplier.supp_name, final.Average from
(select test2.supp_id, sum(test2.rat_ratstars)/ count(test2.rat_ratstars) as Average from 
(select supplier_pricing.SUPP_ID, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing inner join
(select `order`.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS from `order` inner join rating on rating.`ord_id` = `order`.ord_id) as test 
on test.pricing_id = supplier_pricing.pricing_id)
as test2 group by supplier_pricing.supp_id)
as final inner join supplier where final.supp_id = supplier.supp_id) as report; 
end &&
DELIMITER ;


call proc()
	



