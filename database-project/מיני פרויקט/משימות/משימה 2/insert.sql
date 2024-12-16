insert into waiter (id_waiter, DOB, fname, lname, salery) 
values(203432117,to_date('01-02-1997','dd-mm-yyyy'),'shir','levi',9000);
insert into waiter (id_waiter, DOB, fname, lname, salery) 
values(433432117,to_date('02-08-1987','dd-mm-yyyy'),'elroyi','cohen',4900);
insert into waiter (id_waiter, DOB, fname, lname, salery) 
values(243432817,to_date('08-08-1996','dd-mm-yyyy'),'tamar','somech',6600);
insert into waiter (id_waiter, DOB, fname, lname, salery) 
values(261792117,to_date('09-05-1990','dd-mm-yyyy'),'lea','levi',6500);
insert into waiter (id_waiter, DOB, fname, lname, salery) 
values(203487217,to_date('07-06-2000','dd-mm-yyyy'),'moti','dan',7000);
insert into waiter (id_waiter, DOB, fname, lname, salery) 
values(303432117,to_date('05-11-2002','dd-mm-yyyy'),'miri','haron',5690);
insert into waiter (id_waiter, DOB, fname, lname, salery) 
values(203436948,to_date('08-10-1993','dd-mm-yyyy'),'nir','levi',5500);
insert into waiter (id_waiter, DOB, fname, lname, salery) 
values(947232117,to_date('18-05-1998','dd-mm-yyyy'),'shira','noach',6000);
insert into waiter (id_waiter, DOB, fname, lname, salery) 
values(264987515,to_date('10-12-2005','dd-mm-yyyy'),'moshe','cohen',9100);
insert into waiter (id_waiter, DOB, fname, lname, salery) 
values(216887584,to_date('10-05-2010','dd-mm-yyyy'),'dor','dadon',8000);



insert into customer (lname, fname, phone, email, club_member, address) 
values('shalom','michal',0506561604,'mic@gmail.com',898,'89 derech amelech');
insert into customer (lname, fname, phone, email, club_member, address) 
values('cohen','yonatan',0508496284,'yoni8@walla.com',54,'62 menachem begin');
insert into customer (lname, fname, phone, email, club_member, address) 
values('kadosh','yoel',0507496281,'yo228@walla.com',162,'5 yoni nethaniho');
insert into customer (lname, fname, phone, email, club_member, address) 
values('bloch','miri',0529456118,'miri@gmail.com',1187,'9 apalmach');
insert into customer(lname, fname, phone, email, club_member, address) 
values('cocavi','ela',0504592687,'elllla@walla.com',282,'62 ben guryon');
insert into customer (lname, fname, phone, email, club_member, address) 
values('levi','yonatan',0508126483,'yonlev@gmail.com',47,'1 simcha holtberg');
insert into customer (lname, fname, phone, email, club_member, address) 
values('cohen','rona',0524165985,'ronacohen@walla.com',124,'1 menachem begin');
insert into customer(lname, fname, phone, email, club_member, address) 
values('amitay','gali',0504168272,'galush@gmail.com',941,'81 asivim');
insert into customer (lname, fname, phone, email, club_member, address) 
values('shem-tov','nir',0541652973,'nirshemtov@gmail.com',601,'2 arishonim');
insert into customer (lname, fname, phone, email, club_member, address) 
values('hadad','noa',0501659426,'noa11h@walla.com',578,'22 harava');


insert into dish (id_dish, price, name, type_dish) 
values(1, 45, 'pasta', 'main dish');
insert into dish (id_dish, price, name, type_dish) 
values(2, 40, 'pizza', 'main dish');
insert into dish (id_dish, price, name, type_dish) 
values(3, 52, 'fish and chips', 'main dish');
insert into dish (id_dish, price, name, type_dish) 
values(4, 45, 'salad', 'main dish');
insert into dish (id_dish, price, name, type_dish) 
values(5, 31, 'soup', 'first dish');
insert into dish (id_dish, price, name, type_dish) 
values(6, 20, 'cheese bread', 'first dish');
insert into dish (id_dish, price, name, type_dish) 
values(7, 27, 'cheesecake', 'last dish');
insert into dish (id_dish, price, name, type_dish) 
values(8, 30, 'apple pie', 'last dish');
insert into dish (id_dish, price, name, type_dish) 
values(9, 10, 'ice creem', 'last dish');
insert into dish (id_dish, price, name, type_dish) 
values(10, 25, 'chocolate cake', 'last dish');



insert into waiter_phone (phone, id_waiter) 
values(0506561602, 203432117);
insert into waiter_phone (phone, id_waiter) 
values(0526495812, 433432117);
insert into waiter_phone (phone, id_waiter) 
values(0523694587, 243432817);
insert into waiter_phone (phone, id_waiter) 
values(054985164, 261792117);
insert into waiter_phone (phone, id_waiter) 
values(0549852362, 203487217);
insert into waiter_phone (phone, id_waiter) 
values(0521462587, 303432117);
insert into waiter_phone (phone, id_waiter) 
values(052316492, 203436948);
insert into waiter_phone (phone, id_waiter) 
values(0506249855, 947232117);
insert into waiter_phone (phone, id_waiter) 
values(0503659954, 264987515);
insert into waiter_phone (phone, id_waiter) 
values(0549659999, 216887584);


insert into invite (id_order, date_order, type_order, feedback, id_waiter, phone) 
values(1, to_date('01-04-2020','dd-mm-yyyy'), 'sitting', 5, 203432117, 0506561604);
insert into invite (id_order, date_order, type_order, feedback, id_waiter, phone) 
values(2, to_date('01-04-2020','dd-mm-yyyy'), 'sitting', 5, 433432117, 0508496284);
 insert into invite (id_order, date_order, type_order, feedback, id_waiter, phone) 
values(3, to_date('02-04-2020','dd-mm-yyyy'), 'sitting', 4, 243432817, 0507496281); 
insert into invite (id_order, date_order, type_order, feedback, id_waiter, phone) 
values(4, to_date('11-02-2020','dd-mm-yyyy'), 'sitting', 4, 261792117, 0529456118);
insert into invite (id_order, date_order, type_order, feedback, id_waiter, phone) 
values(5, to_date('08-01-2020','dd-mm-yyyy'), 'sitting', 3, 203487217, 0504168272);
insert into invite (id_order, date_order, type_order, feedback, id_waiter, phone) 
values(6, to_date('01-01-2020','dd-mm-yyyy'), 'take away', 3, 303432117, 0524165985);
insert into invite (id_order, date_order, type_order, feedback, id_waiter, phone) 
values(7, to_date('10-02-2020','dd-mm-yyyy'), 'take away', 2, 203436948, 0508126483);
insert into invite (id_order, date_order, type_order, feedback, id_waiter, phone) 
values(8, to_date('03-03-2020','dd-mm-yyyy'), 'take away', 1, 947232117, 0504592687);
insert into invite (id_order, date_order, type_order, feedback, id_waiter, phone) 
values(9, to_date('20-04-2020','dd-mm-yyyy'), 'take away', 5, 264987515, 0541652973);
insert into invite (id_order, date_order, type_order, feedback, id_waiter, phone) 
values(10, to_date('15-01-2020','dd-mm-yyyy'), 'take away', 5, 216887584, 0501659426);
insert into invite (id_order, date_order, type_order, feedback, id_waiter, phone) 
values(11, to_date('10-02-2020','dd-mm-yyyy'), 'take away', 2, 203436948, 0508126483);
insert into invite (id_order, date_order, type_order, feedback, id_waiter, phone) 
values(12, to_date('03-03-2020','dd-mm-yyyy'), 'take away', 1, 947232117, 0504592687);
insert into invite (id_order, date_order, type_order, feedback, id_waiter, phone) 
values(13, to_date('20-04-2020','dd-mm-yyyy'), 'take away', 5, 264987515, 0541652973);
insert into invite (id_order, date_order, type_order, feedback, id_waiter, phone) 
values(14, to_date('15-01-2020','dd-mm-yyyy'), 'take away', 5, 216887584, 0504592687);
insert into invite (id_order, date_order, type_order, feedback, id_waiter, phone) 
values(15, to_date('05-04-2020','dd-mm-yyyy'), 'sitting', 5, 203432117, 0504592687);
insert into invite (id_order, date_order, type_order, feedback, id_waiter, phone) 
values(16, to_date('01-04-2020','dd-mm-yyyy'), 'sitting', 5, 216887584, 0508496284);
insert into invite (id_order, date_order, type_order, feedback, id_waiter, phone) 
values(17, to_date('01-07-2019','dd-mm-yyyy'), 'sitting', 4, 216887584, 0504592687);




insert into payment (date_pay, price, id_order) 
values(to_date('08-01-2020','dd-mm-yyyy'),225 , 5 );
insert into payment (date_pay, price, id_order) 
values(to_date('02-04-2020','dd-mm-yyyy'),52 , 3 );
insert into payment (date_pay, price, id_order) 
values(to_date('01-04-2020','dd-mm-yyyy'),175 , 2 );
insert into payment (date_pay, price, id_order) 
values(to_date('01-04-2020','dd-mm-yyyy'),160 , 1 );
insert into payment (date_pay, price, id_order) 
values(to_date('11-02-2020','dd-mm-yyyy'),124 , 4 );
insert into payment (date_pay, price, id_order) 
values(to_date('01-01-2020','dd-mm-yyyy'),260 , 6 );
insert into payment (date_pay, price, id_order) 
values(to_date('10-02-2020','dd-mm-yyyy'),60 , 7 );
insert into payment (date_pay, price, id_order) 
values(to_date('20-04-2020','dd-mm-yyyy'),225 , 9 );
insert into payment (date_pay, price, id_order) 
values(to_date('15-01-2020','dd-mm-yyyy'),80 , 10 );
insert into payment (date_pay, price, id_order) 
values(to_date('10-02-2020','dd-mm-yyyy'),340 , 11 );
insert into payment (date_pay, price, id_order) 
values(to_date('03-03-2020','dd-mm-yyyy'),60 , 12 );
insert into payment (date_pay, price, id_order) 
values(to_date('15-01-2020','dd-mm-yyyy'),160 , 14);
insert into payment (date_pay, price, id_order) 
values(to_date('01-04-2020','dd-mm-yyyy'),135 , 16 );
insert into payment (date_pay, price, id_order) 
values(to_date('01-07-2019','dd-mm-yyyy'),155 , 17 );
insert into payment (date_pay, price, id_order) 
values(to_date('03-03-2020','dd-mm-yyyy'),137 , 8);
insert into payment (date_pay, price, id_order) 
values(to_date('05-04-2020','dd-mm-yyyy'),195 , 15 );
insert into payment (date_pay, price, id_order) 
values(to_date('20-04-2020','dd-mm-yyyy'),200 , 13 );


insert into containing (amount, id_order, id_dish) 
values(1, 2, 2 );
insert into containing (amount, id_order, id_dish) 
values(3, 2, 1 );
insert into containing (amount, id_order, id_dish) 
values(1, 3, 3 );
insert into containing (amount, id_order, id_dish) 
values(2, 4, 5 );
insert into containing (amount, id_order, id_dish) 
values(5, 5, 4 );
insert into containing (amount, id_order, id_dish) 
values(4, 10, 6 );
insert into containing (amount, id_order, id_dish) 
values(2, 7, 8 );
insert into containing (amount, id_order, id_dish) 
values(1, 8, 9);
insert into containing (amount, id_order, id_dish) 
values(3, 9, 10 );
insert into containing (amount, id_order, id_dish) 
values(2, 6, 2 );

insert into containing (amount, id_order, id_dish) 
values(3, 9, 6);
insert into containing (amount, id_order, id_dish) 
values(4, 6, 1 );
insert into containing (amount, id_order, id_dish) 
values(1, 8, 3);
insert into containing (amount, id_order, id_dish) 
values(3, 9, 8 );

insert into containing (amount, id_order, id_dish) 
values(3, 12, 6);
insert into containing (amount, id_order, id_dish) 
values(4, 11, 1 );
insert into containing (amount, id_order, id_dish) 
values(1, 16, 3);
insert into containing (amount, id_order, id_dish) 
values(3, 16, 8 );
insert into containing (amount, id_order, id_dish) 
values(4, 11, 2 );
insert into containing (amount, id_order, id_dish) 
values(4, 14, 2 );
insert into containing (amount, id_order, id_dish) 
values(2, 1, 10 );

commit;
