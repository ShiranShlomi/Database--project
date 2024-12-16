--����� ��� �� ���� ������

alter table invite
rename to orders 

--����� ��� ���� ������

alter table invite
add constraint feedback_check
check (feedback between 1 and 5)

--����� ����� �� �����

alter table dish
modify id_dish VARCHAR2(10) 

--����� ����� �� �����

alter table invite
modify id_order number(10) NOT NULL

--����� ����� �� 2 ������

alter table containing
modify (id_dish number(10),
        id_order number(10))

--����� ����� ����� ������

alter table invite
add num_members NUMBER(10) 

--����� ����� ����� �����

alter table payment
add type_pay VARCHAR2(10)

--����� ����� ������ 

alter table payment
add constraint type_pay_check
check (type_pay in ('cash','credit'))

--����� ����� ����� ������

alter table customer
add city VARCHAR2(10) NOT NULL
