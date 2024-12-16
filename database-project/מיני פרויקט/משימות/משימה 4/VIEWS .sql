--VIEW 1--

-- ����� ������ ������ ������ ���� ���� �� 6000 
-- �� ���� ��� ���� ������� �� 2 ������ �����

-- ��� ���� ���� �� �� ������� �������� ����� �6 ���

create view salery_check as
select w.id_waiter,
       w.dob,
       w.fname,
       w.lname,
       w.salery,
       i.id_order,
       i.date_order,
       d.id_dish,
       d.price,
       d.name,
       d.type_dish,
       c.amount
from waiter w,invite i,dish d,containing c
where(salery>6000 and 
      w.id_waiter=i.id_waiter and
      i.id_order=c.id_order and
      c.id_dish=d.id_dish)
order by salery

-- �����/����� �� ����

select * from salery_check
drop view salery_check

-- ������� ����� ����� �� ���� ������ ��� 6000 ���� ����� 2 ������

select id_waiter,
       extract(month from date_order) as "month",
       count(id_order) as "total orders"
from salery_check sc
group by extract(month from date_order) ,id_waiter
having (count(id_order)<2)

-- ������� ������ ��� ������ ������ "�����" ������� �� �����
--������ ����� 40 ��

select id_waiter,id_order,id_dish,price
from salery_check sc
where price>=40

-- ������ �� ����

update salery_check sc
set salery=6000
where id_waiter='203432117'

-- ����� ������ �����

delete from salery_check sc
where id_waiter='203432117'

                                                 
--VIEW 2--

--���� ������ �� �� ������ ������ ������� ����

create view profit_check as
select w.id_waiter,
       w.dob,
       w.fname,
       w.lname,
       w.salery,
       i.id_order,
       i.date_order,
       i.type_order,
       i.feedback,
       i.phone,
       p.date_pay,
       p.price
from waiter w, payment p, invite i
where w.id_waiter=i.id_waiter 
and   i.id_order=p.id_order

--�����/����� �� ����

select * from profit_check
drop view profit_check

-- ������� ����� ��� �� ���� ��� �� ����� ��� ��� ����� 2 ������ ������ ��� 100 ��

select date_order
from profit_check pc
where price>100
group by date_order
having count(id_order)>1



--������ ������ �� �� ������� ��� �������

select (select sum(price) 
        from profit_check pc) as "total incomes",
       (select sum (salery) 
        from (select distinct id_waiter, salery
              from profit_check pc))as "total expenses"
from profit_check pc              
where rownum<2

-- ������ �� ����

update profit_check 
set price=price+(price*0.10)

-- ����� ������ �����

delete from profit_check
where id_waiter='203432117' 
