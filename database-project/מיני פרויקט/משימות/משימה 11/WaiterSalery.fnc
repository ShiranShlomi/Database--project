create or replace function WaiterSalery(IdWaiter in varchar2,AmountOrder in number) return number
is
  
  --declare error #1
  waiter_invalid exception;
  pragma exception_init(waiter_invalid,-20202); 
  --declare error #2
  error_input exception;
  pragma exception_init(error_input,-20203); 
  
  --cursor for use if the waiter does exists
  cursor allWaiter (Parmter in varchar2) is
  select IdWaiter
  from waiter
  where id_waiter=Parmter;
  
  FunctionResult number;
  countOrder number;
  NewSalery number;
  Thewaiter varchar2(15);
  strLN varchar2(15) NOT NULL :='ln';
  strFN varchar2(15) NOT NULL :='fn';
  ThePhone varchar2(15);   
  
begin
  --Check if the waiter exists
  open allWaiter (IdWaiter);
  fetch allWaiter into Thewaiter;
  if (allWaiter%notfound)
    then
      --if the waiter does not exist he throws us to declare #1
      raise waiter_invalid;
  end if;
  close allWaiter;
  --select the detalies of the waiter
  select lname,fname into strLN,strFN 
  from waiter
  where id_waiter=IdWaiter;
  
  select phone into ThePhone 
  from waiter_phone
  where id_waiter=IdWaiter;
  --print the detalies
  dbms_output.put_line('The name of waiter is:' || strLN || ' ' || strFN );
  dbms_output.put_line('The phone number is:0' || thephone );

  --if the parameter that the user entered<1 he throws him to declare #2
  if(AmountOrder<1)
    then
      raise error_input;
  end if;
          
  --select the num of orders of last year
  select count(id_order) into countOrder
  from invite
  where(id_waiter=IdWaiter) and (date_order between to_date('01-01-2020','dd-mm-yyyy')
                                                and to_date('31-12-2020','dd-mm-yyyy'));
 
  --if the count<=2 the waiter is fired
  if(countOrder<=2)
    then
      delete
      from waiter
      where id_waiter=IdWaiter;
      dbms_output.put_line('The num of orders is:'||' '||countOrder);  
      dbms_output.put_line('The waiter should to leave.');     
  end if;
  --if the count>2 the waiter receives an extra salary
  if(countOrder>2)
    then
      dbms_output.put_line('The num of orders is:'||' '||countOrder); 
      update waiter
      set salery=salery+250;
      
      select salery into NewSalery
      from waiter
      where id_waiter=IdWaiter;
  end if; 
   
  --the function returen the update salery    
  FunctionResult:=NewSalery;
  return(FunctionResult);
  
  --functions raise with the message
  exception
    when waiter_invalid
      then
         raise_application_error(-20200,'the waiter does not exist');    
           
    when error_input
      then
         raise_application_error(-20201,'the amount of orders should be more then 1');            

end WaiterSalery;
/
