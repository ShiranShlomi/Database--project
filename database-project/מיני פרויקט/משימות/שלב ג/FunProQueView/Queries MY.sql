--1--
-- ��� ���� ��� 2020 �� ��' �������

select count(id_order) as "total order"
from invite
where date_order between to_date('01-01-2020','dd-mm-yyyy')
                    and  to_date('31-12-2020','dd-mm-yyyy');
               
--2--

--���� ���� �������� ���� 2019

select sum(salery) as "2019 salery"
from waiter
where id_waiter in (select id_waiter from invite
                    where date_order between to_date('01-01-2019','dd-mm-yyyy')
                                        and  to_date('30-12-2019','dd-mm-yyyy'));
                             
                    
--3--
--���� ���� ���� ����� ��� 100 ����� ���� �����
--  ������� ������ ����� ��� ���� ���� ����� ������ ���� �� 100 ����� ��� �� ����� �����

select invite.id_order , price ,customer.phone , lname, fname 
from invite join customer
on invite.phoneorderer = customer.phone 
            join payment
on invite.id_order = payment.id_order
where(price>100)
order by price;

--4--
-- ������ ������ ���� ������ ���
-- ������� ���� �� �� ����� , ��' ������� ������ ��� ��� �� ������ ������ ������ ���� �����  
                

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
-- ����� ������ ���� ���� ����� ��� ������
--������� ������ �� ���� ������� ������ ��� 100 ����� ���
--�� ������ �����

select count(invite.id_order)as "total order",
       sum(price) as "total price"
      
from invite join payment 
on invite.id_order = payment.id_order
where (price > 100) ;

            
 --6--                                            
-- ������ ������� �� ������� ���� ���� �� ����� ������ ���� ���� �����

select *
from dish 
where price < (select price
               from dish
               where id_dish = 8)
               
order by price       ;      
 
--7--
--������� ������ ���� ������� ������ ����� ���� 2019 �� ���� ����� ���� ����� ������� ����� �����
--�� �� ����� ������ ����� ��� �� �� �����
--�� ����� ������� ������ ����� ��� 20 ����� 
 

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
--������� ������ �� �� ������� ���� �� ���� ������ ��� 100 �� ��� ��� ������ �����

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
--����� ����� �� 500 ����� ������� ������ ���� ������ ���


update waiter
set salery = salery+500
where id_waiter in (select id_waiter
                    from invite
                    group by id_waiter
                    having(count(id_order)>1))  ;                 


--2--
--������� �� 10 ����� ���� ���� ������ ������ ���� ����� �2 ����� �����

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
-- ������� ����� ���� ���� ����� ������ 
-- �� ������ ������ ���� �150 ����� ��� ����� ������ �� ��� 2
-- ���� ���� ����� / ������

delete
from containing
where id_order in (select id_order
                   from payment
                   where (price>150)) 
                   and id_dish = 2 ; 
                                                      


--2--
-- ������� ����� ������ �� ��������� ,�"� ������ ��� ���� 2020 
-- ��� ������ ���� �� 100 ��

delete
from invite
where id_order in (select id_order
                   from payment
                   where (date_pay between to_date('01-01-2010','dd-mm-yyyy')
                                       and to_date('31-12-2019','dd-mm-yyyy'))
                   and payment.price>100);









