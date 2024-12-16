--1--
-- הצג עבור שנת 2020 את מס' ההזמנות

select count(id_order) as "total order"
from invite
where date_order between to_date('01-01-2020','dd-mm-yyyy')
                    and  to_date('31-12-2020','dd-mm-yyyy');
               
--2--

--הצגת סכום המשכורות לשנת 2019

select sum(salery) as "2019 salery"
from waiter
where id_waiter in (select id_waiter from invite
                    where date_order between to_date('01-01-2019','dd-mm-yyyy')
                                        and  to_date('30-12-2019','dd-mm-yyyy'));
                             
                    
--3--
--הצגת פרטי לקוח ששילם מעל 100 שקלים עבור הזמנה
--  השאילתה מחזירה טלפון ושם לקוח שעשה הזמנה שסכומה עולה על 100 שקלים וכן את הסכום ששילם

select invite.id_order , price ,customer.phone , lname, fname 
from invite join customer
on invite.phoneorderer = customer.phone 
            join payment
on invite.id_order = payment.id_order
where(price>100)
order by price;

--4--
-- עובדים שביצעו יותר מהזמנה אחת
-- השאילתה תציג את שם העובד , מס' ההזמנות שהעובד לקח וכן את התאריך האחרון שהעובד ביצע הזמנה  
                

select lname,
       fname,
       waiter.id_waiter,
       count(id_order) as "total order",
       max(date_order) as "last order"
from waiter join invite 
     on waiter.id_waiter = invite.id_waiter
group by waiter.lname , waiter.fname ,waiter.id_waiter
having (count(id_order)>1);

--5--
-- הזמנה שמחירה גבוה ממאה שקלים היא רווחית
--השאילתה מחזירה את מספר ההזמנות שמחירן מעל 100 שקלים וכן
--את התשלום הכולל

select count(invite.id_order)as "total order",
       sum(price) as "total price"
      
from invite join payment 
on invite.id_order = payment.id_order
where (price > 100) ;

            
 --6--                                            
-- שאילתה שמחזירה את המחירים בסדר עולה של המנות הזולות יותר ממנה שמונה

select *
from dish 
where price < (select price
               from dish
               where id_dish = 8)
               
order by price       ;      
 
--7--
--השאילתה מחיזרה מבין ההזמנות שבוצעו בחודש בשנת 2019 את המנה היקרה מבין המנות שהוזמנו באותה הזמנה
--את סך המנות שהכילה הזמנה וכן את מס הזמנה
--כל המנות שהוזמנו צריכות להיות מעל 20 שקלים 
 

select max(dish.price)as "max price",
       count(dish.id_dish)as "total dishes" ,
       containing.id_order
       
from dish join containing
     on dish.id_dish = containing.id_dish
          join invite
     on containing.id_order = invite.id_order
where (date_order between to_date('01-01-2018','dd-mm-yyyy')
                      and to_date('30-12-2020','dd-mm-yyyy'))

group by containing.id_order
having min(dish.price) >20;
  

--8--
--השאילתה מחזירה את מס ההזמנות עבור כל חודש שמחירן מעל 100 שח וכן היו הזמנות ישיבה

select extract(month from date_order) as "Month",
       count(id_order) as "Num of Orders"
from invite
where id_order in (select id_order
                   from payment
                   where price>100)
and type_order='sitting'                  
group by extract(month from date_order)
order by "Num of Orders" desc;



--UPDATE Queries

--1--
--תוספת בונוס של 500 שקלים לעובדים שביצעו יותר מהזמנה אחת


update waiter
set salery = salery+500
where id_waiter in (select id_waiter
                    from invite
                    group by id_waiter
                    having(count(id_order)>1))  ;                 


--2--
--התיקרות של 10 שקלים עבור מנות שממוצע המכירה שלהן גדולה מ2 בחודש אפריל

update dish
set price = price+10
where id_dish in (select id_dish
                  from containing 
                  where id_order in (select id_order
                                     from invite
                                     where (date_order between to_date('01-04-2017','dd-mm-yyyy')
                                                           and to_date('30-04-2020','dd-mm-yyyy')))
                  group by id_dish
                  having avg(amount)>2);



--DELETE QUERIES

--1--
-- השאילתה מוחקת מתוך פרוט תכולת ההזמנה 
-- את ההזמנה שמחירה גבוה מ150 שקלים וכן הזמנה שמכילה את מנה 2
-- מתוך טבלת המנות / התפריט

delete
from containing
where id_order in (select id_order
                   from payment
                   where (price>150)) 
                   and id_dish = 2 ; 
                                                      


--2--
-- השאילתה מוחקת הזמנות לא רלוונטיות ,ז"א הזמנות שלא משנת 2020 
-- וכן שמחירן עולה על 100 שח

delete
from invite
where id_order in (select id_order
                   from payment
                   where (date_pay between to_date('01-01-2010','dd-mm-yyyy')
                                       and to_date('31-12-2019','dd-mm-yyyy'))
                   and payment.price>100);









