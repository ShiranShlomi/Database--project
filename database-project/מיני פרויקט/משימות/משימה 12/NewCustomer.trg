create or replace trigger NewCustomer
  before insert
  on customer
  for each row 
  
declare

  cursor allCustomer is
  select phone
  from customer;
  
  phoneRec allCustomer%rowtype;
  
begin
  
  for phoneRec in allcustomer
    loop
      if(phoneRec.Phone=:new.phone)
        then
           raise_application_error(-20202,'The customer is already exists');
      end if;
    end loop;
    
end NewCustomer;
/
