--הוספת עמודות לטבלת מלצרים 

alter table waiter
add (city varchar2(15) not null,
     numHome number not null,
     street varchar2(15) not null); 
     
--יצירת טבלת שף    
 
CREATE TABLE chef
(
  idChef INT NOT NULL,
  nameChef varchar(10) NOT NULL,
  telChef INT NOT NULL,
  cityChef varchar (10) NOT NULL,
  streetChef varchar (10) NOT NULL,
  numHomeChef INT NOT NULL,
  salaryChef INT NOT NULL,
  PRIMARY KEY (idChef)
);

--יצירת טבלה חדשה

CREATE TABLE sale
(
  idSale INT NOT NULL,
  discount INT NOT NULL,
  dateStartSale date NOT NULL,
  dateEndSale date NOT NULL,
  PRIMARY KEY (idSale)
);

--הוספת עמודות לטבלת הזמנות

alter table invite
add (nameOrderer varchar(10) NOT NULL,
     numDiners INT,
     cityOrderer varchar(15),
     addressOrderer varchar(15));
  
--שינוי שם עמודה בטבלת הזמנות
     
alter table invite
rename column phone to phoneOrderer;      
   
--הוספת עמודות לטבלת תשלום
  
alter table payment
add (id_payment INT NOT NULL,
     PRIMARY KEY (id_payment),
     typePayment varchar(10) NOT NULL);
     
--הוספת עמודות לטבלת מנות 

alter table dish
add(idChef INT,
    idSale INT,    
    FOREIGN KEY (idChef) REFERENCES chef(idChef),
    FOREIGN KEY (idSale) REFERENCES sale(idSale)); 
    
--הוספת עמודה לטבלת לקוחות
    
alter table customer
add city varchar2(15) NOT NULL;
    
