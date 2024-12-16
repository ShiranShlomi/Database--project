create or replace procedure TryToWin (Thedate out date,TheWinner out number)
is
  --declare the variables:

  ThePrice number;

  i number;
  rand number;

  DishCount number;
  numParticipants number; 


  cursor allOrders is
  select date_order,customer.phone,fname,lname,id_order
  from invite join customer
  on invite.phone=customer.phone
  where date_order between to_date('01-01-2020','dd-mm-yyyy')
                       and to_date('31-12-2020','dd-mm-yyyy')
  order by id_order;
  --record type of exsist table                   
  orderRec allOrders%rowtype;  
                
          
begin
  
  dbms_output.put_line('__________________________________________');
  dbms_output.put_line('        Welcome to the lottery');
  dbms_output.put_line('__________________________________________');
  
  select count(phone) into numParticipants
  from customer;
  --Check that the customers existing
  if(SQL%found)
    then
      dbms_output.put_line('The total number of participants in the lottery is: '||numParticipants);
      dbms_output.put_line('                     * * *');    
      dbms_output.put_line('           The lottery participants are:');
      dbms_output.put_line(''); 
      
      Thedate:=sysdate;
      i:=0;
      --for evrey record (id_order) it takes the amount of dishes 
      for orderRec in allOrders
        loop
          select sum(amount) into DishCount
          from containing
          where id_order=orderRec.Id_Order;
          --if the total amount>1 do-                  
          if(DishCount>=2)
            then
             --take the total sum
             select sum(price) into ThePrice
             from payment
             where id_order=orderRec.Id_Order;
             --if the price>200 do-
             if(ThePrice>200)
               then
                 --print the customers who entered the final stage of the lottery
                 i:=i+1;
                 dbms_output.put_line(i||')The order number'||' ' ||orderRec.Id_Order||' ' || 'of customer:');
                 dbms_output.put_line('  0'||orderRec.Phone||' '|| orderRec.Lname||' '|| orderRec.Fname);
                 dbms_output.put_line('');
      
             end if;    
          end if;
       end loop;
       --select random num between 1 to the num of customers
       select round(dbms_random.value(1,i))rnum
       into rand
       from dual;    
       --print the num of winner
       dbms_output.put_line('____________________________________________');
       dbms_output.put_line('        Congratulations to the winner   ');
       dbms_output.put_line('                   * * *');
       dbms_output.put_line('  The winner is lottery candidate number:'||' '|| rand);
      
       
       TheWinner:=rand;
         

 end if;
end TryToWin;
/
