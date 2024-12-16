
--1--
--������� ������ ���� �� ���� �� �� ������� �����
-- ����� ���� ����� ����� ������ ����� ������ 

select extract(month from date_order) as "Month",
       count(id_order) as "Num of Orders",
       type_order
from invite
where id_order in (select id_order
                   from payment
                   where price >(&<name="enter a price"
                                   type="integer" 
                                   hint="price should be only numbers">))
and type_order in (&<name="choose type order"
                     list=" 'sitting',s , 'take away',t "
                     description="true"
                     required="true"
                     multiselect="true">)                         
group by extract(month from date_order),type_order
order by "Num of Orders" desc

--2--
--������� ������ �� ���� ����� ,�� ������ ��� ��� �� ����� �����
--���� ������� ���� �� ����� �� �� ������� �� �� ������ ��� ��� 100 �� 
--��� ���� ����� ��� ���� �����

select invite.id_order , price ,customer.phone , lname, fname 
from invite join customer
on invite.phone = customer.phone 
            join payment
on invite.id_order = payment.id_order
where price >(&<name="price>100?"
                checkbox="100,0">)
and lname like(&<name="choose last name from the list"
                 type="string"
                 list="select lname from customer"
                 ifempty="%">)                    

order by price

--3--
--������� ������ ������ �� ���� ��� ��� ��� �"� ����� ����� ����� ��� ����� ������ �����

select salery , id_waiter
from waiter
where id_waiter in(select id_waiter 
                   from invite
                   where date_order between to_date(&<name="from date"
                                                      type="date"
                                                      hint="date template dd/mm/yyyy">)
                                        and to_date(&<name="to date"
                                                      type="date"
                                                      hint="date template dd/mm/yyyy">))

and lname in (&<name="waiter name" 
                type="string" 
                list="select lname from waiter"
                multiselect="true"
                required="true">)                                                
                                                                                 
                                        
--4--
-- ������� ������ �� ���� ����� ������� ��� 
--��� �� ����� ������� ���� ���� ����� ������� ������
--����� ��� ���� ������� ���� ����� ����� ����

select payment.price ,
       containing.amount,
       containing.id_order,
       containing.id_dish
from payment join containing
on containing.id_order=payment.id_order
where containing.id_order in (&<name="enter num of order" 
                                type="integer" 
                                list="select id_order from invite" 
                                default="select id_order from invite">)
                            
                                          
                                        
                                              
                                  
