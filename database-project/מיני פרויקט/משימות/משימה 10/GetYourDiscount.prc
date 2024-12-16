create or replace procedure GetYourDiscount(CustomerPhone in number,Thedate out date)
is

    strLN varchar2(15) NOT NULL :='ln';
    strFN varchar2(15) NOT NULL :='fn';
    
    countOrders number;
   
    thePrice payment.price%type;
    NewPrice number;
     
    cursor allId_order is
    select *
    from invite
    where phone=CustomerPhone;
   
    --record type of exsist table
    id_orderRec allId_order%rowtype;
    
    TheOrder varchar2 (15);
    
begin
  
   --for evrey record in invite table
   for id_orderRec in allId_order
     loop
       if(id_orderRec.Phone=CustomerPhone)
        then
        --select the name of customer that the user entered as a parameter
        select lname,fname into strLN,strFN 
        from customer
        where phone=CustomerPhone;
       end if;
     end loop; 
    --if the customer exists do-
    if(SQL%found)
    then
        --print the detailes of the customer
        Thedate:=sysdate;
        dbms_output.put_line('The date is:'|| Thedate);
        dbms_output.put_line('The name of customer is:' || strLN || ' ' || strFN );
        dbms_output.put_line('The phone number is:' || CustomerPhone );       
        dbms_output.put_line('****************');      
        
        --count the num of orders for that customer
        select count(id_order)into countOrders
        from invite
        where phone=CustomerPhone;
        
        --if there is at least 1 order do-                               
        if (countOrders>1)
          then
            --print some messages to the user
            dbms_output.put_line('Your amount of orders is'||' '|| countOrders );
            dbms_output.put_line('Maybe you will deserve a discount...');
            dbms_output.put_line('****************');
            dbms_output.put_line('After testing:');
            dbms_output.new_line;
            --for every record it takes the id_order and puts in new var
            
            for id_orderRec in allId_order
               loop
                 TheOrder:=id_orderRec.Id_Order;    
                 --select the price of the order
                 select price into thePrice
                 from payment 
                 where id_order=TheOrder;
                 --if the price>150 do-
                 if thePrice>150
                    then
                       --print the price befor the discount 
                       dbms_output.put_line('You deserve a discount for order '||TheOrder
                                            ||' '|| 'that costs is'||' '||thePrice||' '|| 'shekels');
               
                       --update the prce for this order
                       update payment
                       set price=price-(price*0.2)
                       where id_order=TheOrder;
                       --commit;
                       --select the price after the update/discount
                       select price into NewPrice
                       from payment
                       where id_order=TheOrder; 
                       
                       --print the price after the discount                                                       
                       dbms_output.put_line('Your price after the discount is' ||' '||NewPrice||' '|| 'shekels');
               
                 --if the price<150
                 else
                       --print
                       --dbms_output.put_line('*------------------------*'); 
                       dbms_output.put_line('We are sorry. you do not deserve a discount for order '||TheOrder); 
                 end if;
                 dbms_output.put_line('*------------------------*'); 
              end loop;
             else
               --count of the orders<1
               dbms_output.put_line('We are sorry. you do not deserve a discount for your order');  
         end if;
  --if the customer does not exists do-       
  else
   dbms_output.put_line('We are sorry.The customer does not exist'); 
       
 end if;
  
end GetYourDiscount;
/
