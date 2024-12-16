--דוגמא 1

--הצגת פרטי לקוח ששילם מעל 100 שקלים עבור הזמנה
--השאילתה מחזירה טלפון ושם לקוח שעשה הזמנה שסכומה עולה על 100 שקלים וכן את הסכום ששילם

select invite.id_order , price ,customer.phone , lname, fname 
from invite join customer
on invite.phone = customer.phone 
            join payment
on invite.id_order = payment.id_order
where(price>100)
order by price

--עידכון על תוצאת השאילתה
update payment
set price=price+10

--פקודה
rollback

commit
rollback

--דוגמא 2

-- הצגת סכום המשכורות לחודש אפריל

select sum(salery) as "April salery"
from waiter
where id_waiter in (select id_waiter from invite
                    where date_order between to_date('01-04-2020','dd-mm-yyyy')
                                        and  to_date('30-04-2020','dd-mm-yyyy'))
                             


--מחיקת רשומה

delete from waiter
where id_waiter='203432117'

--

rollback
select sum(salery) as "April salery"
from waiter
where id_waiter in (select id_waiter from invite
                    where date_order between to_date('01-04-2020','dd-mm-yyyy')
                                        and  to_date('30-04-2020','dd-mm-yyyy'))
                                        

--

delete from waiter
where id_waiter='203432117'

commit;
rollback;

select sum(salery) as "April salery"
from waiter
where id_waiter in (select id_waiter from invite
                    where date_order between to_date('01-04-2020','dd-mm-yyyy')
                                        and  to_date('30-04-2020','dd-mm-yyyy'))
                                        



--דוגמא 3


insert into payment (date_pay, price, id_order) 
values(to_date('03-03-2020','dd-mm-yyyy'),60 , 12 );
insert into payment (date_pay, price, id_order) 
values(to_date('15-01-2020','dd-mm-yyyy'),160 , 14);

 
savepoint save1


insert into payment (date_pay, price, id_order) 
values(to_date('01-04-2020','dd-mm-yyyy'),135 , 16 );
insert into payment (date_pay, price, id_order) 
values(to_date('01-07-2019','dd-mm-yyyy'),155 , 17 );

rollback to save1

select * from payment








