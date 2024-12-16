create or replace function Orders(NumMem in number,NameDish in varchar2) return integer
is
  YourIdOrder integer;
  
  TheMember number;
  TheDish varchar2(15);
  TheDate date:=sysdate;
  ThePrice number;
  flag number:=1;
  rand varchar2(15);
  strLN varchar2(15) NOT NULL :='ln';
  strFN varchar2(15) NOT NULL :='fn';
  ThePhone varchar2(15);
  
  
  cursor allMembers (NumMemParmter in integer) is
  select NumMem
  from customer
  where club_member=NumMemParmter;
  
  cursor allDish (NameDishParmter in varchar2) is
  select NameDish
  from dish
  where name=NameDishParmter;
  
  cursor allOrders is
  select id_order
  from payment;
  
  orderRec allOrders%rowtype;
  
begin
  
  open allMembers (NumMem);
  fetch allMembers into TheMember;
  if (allMembers%notfound)
    then
      raise_application_error(-20020,'The club num member does not exist');
  end if;
  close allMembers;
  
  select lname,fname,phone into strLN,strFN,ThePhone
  from customer
  where club_member=NumMem;
  
  dbms_output.put_line('The name of customer is:' || strLN || ' ' || strFN );
  dbms_output.put_line('The num phone is:' || ThePhone );
  dbms_output.put_line('The club num member is:' || NumMem );  
 
  
  open allDish (NameDish);
  fetch allDish into TheDish;
  if (allDish%notfound)
    then
      raise_application_error(-20021,'The dish does not exist');
  end if;
  close allDish;
  
  
  --if (DateOrder<>TheDate)
  --  then
  --    raise_application_error(-20022,'You need to enter the date of today');
  --end if;
  
  select price into ThePrice
  from dish
  where name=NameDish; 
  
 
  loop
        
    select round(dbms_random.value(1,1000))rnum
    into rand
    from dual;
    
    if(rand=orderRec.Id_Order)
      then flag:=0;
    end if;
    exit when flag=1;   
  end loop;  
  
  insert into invite (id_order,date_order,type_order,feedback,id_waiter,phone)
  values(rand,TheDate,'take away',5,'203432117',ThePhone);
                      

  insert into payment(date_pay, price,id_order) 
  values(TheDate,ThePrice,rand);  
  
  YourIdOrder:=rand;
  dbms_output.put_line('________________________');
  dbms_output.put_line('    Your order is:'); 
  dbms_output.new_line;
  dbms_output.put_line('  Name dish | Price');
  dbms_output.put_line('  '||NameDish||'       '|| ThePrice);
  

  return(YourIdOrder);
end Orders;
/
