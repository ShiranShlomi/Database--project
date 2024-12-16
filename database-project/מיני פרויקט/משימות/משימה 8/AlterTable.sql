--שינוי השם של טבלת הזמנות

alter table invite
rename to orders 

--שינוי שדה קיים לאילוץ

alter table invite
add constraint feedback_check
check (feedback between 1 and 5)

--שינוי טיפוס של עמודה

alter table dish
modify id_dish VARCHAR2(10) 

--שינוי טיפוס של עמודה

alter table invite
modify id_order number(10) NOT NULL

--שינוי טיפוס של 2 עמודות

alter table containing
modify (id_dish number(10),
        id_order number(10))

--הוספת עמודה לטבלת הזמנות

alter table invite
add num_members NUMBER(10) 

--הוספת עמודה לטבלת תשלום

alter table payment
add type_pay VARCHAR2(10)

--הוספת אילוץ לעמודה 

alter table payment
add constraint type_pay_check
check (type_pay in ('cash','credit'))

--הוספת עמודה לטבלת לקוחות

alter table customer
add city VARCHAR2(10) NOT NULL
