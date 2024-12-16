--VIEW 1--

-- מנהלי המסעדה החליטו להוריד לשכר בסיס של 6000 
-- כל עובד שלא מבצע מינימום של 2 הזמנות בחודש

-- לכן נעשה הצגה של כל המלצרים שמשכורתם גדולה מ6 אלף

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

-- שליפה/מחיקה של המבט

select * from salery_check
drop view salery_check

-- השאילתה בודקת שבאמת כל מלצר שמשתכר מעל 6000 מבצע לפחות 2 הזמנות

select id_waiter,
       extract(month from date_order) as "month",
       count(id_order) as "total orders"
from salery_check sc
group by extract(month from date_order) ,id_waiter
having (count(id_order)<2)

-- השאילתה מחזירה אלו מלצרים דואגים "לדחוף" ללקוחות את המנות
--שמחירן לפחות 40 שח

select id_waiter,id_order,id_dish,price
from salery_check sc
where price>=40

-- עידכון על המבט

update salery_check sc
set salery=6000
where id_waiter='203432117'

-- מחיקת נתונים מהמבט

delete from salery_check sc
where id_waiter='203432117'

                                                 
--VIEW 2--

--טבלה המשקפת את כל הדברים במסעדה שקשורים בכסף

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

--שליפה/מחיקה של המבט

select * from profit_check
drop view profit_check

-- השאילתה בודקת לפי כל חודש אלו את הימים בהם היו לפחות 2 הזמנות שמחירן מעל 100 שח

select date_order
from profit_check pc
where price>100
group by date_order
having count(id_order)>1



--שאילתה שמחשבת את סך ההכנסות וסך ההוצאות

select (select sum(price) 
        from profit_check pc) as "total incomes",
       (select sum (salery) 
        from (select distinct id_waiter, salery
              from profit_check pc))as "total expenses"
from profit_check pc              
where rownum<2

-- עידכון על המבט

update profit_check 
set price=price+(price*0.10)

-- מחיקת נתונים מהמבט

delete from profit_check
where id_waiter='203432117' 
