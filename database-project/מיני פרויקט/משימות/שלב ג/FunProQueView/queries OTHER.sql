--select
--(1

select dish.id_dish,dish.name
from dish  
inner join sale 
on dish.idsale=sale.idsale 
and sale.datestartsale > to_date('01/01/2015','DD/MM/YYYY') and sale.dateendsale <= to_date('30/12/2019','DD/MM/YYYY');

--(2 

select w.id_waiter,w.fname,w.lname,w.salery
from waiter w
where w.salery> (select AVG(w2.salery)
                       from waiter w2); 

select count(w.id_waiter) countWorker
from waiter w
where w.salery> (select AVG(w2.salery)
                       from waiter w2);                        


--(3

SELECT  EXTRACT( MONTH FROM date_Order) monthOrder , Count(id_Order) numOrders
FROM invite
WHERE EXTRACT( YEAR FROM date_Order)>= EXTRACT(YEAR FROM sysdate)-5
GROUP BY EXTRACT( MONTH FROM date_Order);



--(4

SELECT dish.idchef, namechef, COUNT(id_dish)nummenu 
FROM dish join chef
on chef.idchef=dish.idchef
GROUP BY dish.idchef ,namechef
HAVING COUNT (dish.idchef)=( 
SELECT MAX(nummenu) 
FROM ( 
SELECT idchef, COUNT(id_dish) nummenu 
FROM dish 
WHERE idchef is not null
GROUP BY idchef));


--(5

SELECT waiter.lname,waiter.fname
FROM waiter
WHERE waiter.id_waiter IN (SELECT invite.id_waiter
  FROM invite,containing
  WHERE invite.id_order=containing.id_order AND containing.id_dish IN (SELECT dish.id_dish 
  FROM dish
  WHERE dish.idSale>0)); 
  
--(6

SELECT i.nameorderer,i.phoneorderer 
FROM invite i
WHERE id_Order IN (SELECT i.id_order
FROM containing,invite
where containing.id_order=invite.id_Order AND amount>4 );

--(7

SELECT i.id_order,i.nameorderer,i.phoneorderer,w.lname ,w.fname,waiter_phone.phone 
FROM invite i,waiter w,waiter_phone
WHERE w.id_waiter=i.id_waiter AND w.city=i.cityorderer 
GROUP BY i.id_order,i.nameorderer,i.phoneorderer, w.lname,w.fname, phone;

--(8

SELECT name 
FROM dish
WHERE idSale IN (SELECT idSale 
FROM sale 
WHERE discount > 15 AND dateStartSale=to_date('03/12/2010','DD/MM/YYYY'));

--update

--(1

UPDATE sale
SET sale.dateendsale=to_date('30/07/2020','DD/MM/YYYY') 
WHERE sale.datestartsale > to_date('01/05/2014','DD/MM/YYYY')
and sale.dateendsale <= to_date('30/07/2019','DD/MM/YYYY')
and sale.idsale IN(
SELECT S.idSale from dish inner join sale S
on dish.idsale=S.Idsale 
); 
commit;

--(2

update dish
set price=price*2
where id_dish in(
select id_dish
from (select (sum(amount)/30) avarage
      from invite i join containing c
      on i.id_order=c.id_order
      where extract(year from date_order)=EXTRACT(YEAR FROM sysdate)-1 )
     natural join 
      (select containing.id_dish ,sum(amount) summenu 
            from invite join containing
            on invite.id_order=containing.id_order
            where extract(month from date_order)>=EXTRACT(month FROM to_date('01/08/2015','DD/MM/YYYY'))-2
            and extract(year from date_order)=EXTRACT(YEAR FROM sysdate)-1 
            group by id_dish)           
where avarage<=summenu); 
commit;



--delete
--(1


delete from invite i
where i.id_order in (select i2.id_order from invite i2
              where i2.date_order<= all(select i3.date_order
                                       from invite i3
                                      where i2.id_order<>i3.id_order)); 
                                        
                                                                                           );
--(2

delete from invite
where EXTRACT( YEAR FROM date_Order)<=EXTRACT(YEAR FROM sysdate)-4;
commit;

