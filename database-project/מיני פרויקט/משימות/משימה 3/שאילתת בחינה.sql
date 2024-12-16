                                         
select (select count(id_order) 
        from invite
        where id_order in (select id_order
                           from payment
                           where price between 0 and 30)) as "0-30",
        (select count(id_order) 
         from invite 
         where id_order in (select id_order
                            from payment
                            where price between 30 and 100))as "30-100",
        (select count(id_order) 
         from invite 
         where id_order in (select id_order
                            from payment
                            where price between 100 and 300))as "100-300"      
                            
from invite                                                            
where (rownum <2)                                                             
-----                  
                   
     
                   
                   
                   
                   
                   
                   
                   
                   
                   
