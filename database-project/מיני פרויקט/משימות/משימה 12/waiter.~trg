create or replace trigger waiter
  before update
  on waiter 
  for each row
    
declare

 countOrders number;
 
begin
      
  select count(id_order) into countOrders
  from invite
  where id_waiter=:old.id_waiter;
  

  if(countOrders<2)
    then
      raise_application_error(-20202,'This waiter order number is less than 2'||:old.id_waiter);
  end if;
   
end waiter;
/
