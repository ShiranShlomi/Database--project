--����� ������ ����� ������ 

alter table waiter
add (city varchar2(15) not null,
     numHome number not null,
     street varchar2(15) not null); 
     
--����� ���� ��    
 
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

--����� ���� ����

CREATE TABLE sale
(
  idSale INT NOT NULL,
  discount INT NOT NULL,
  dateStartSale date NOT NULL,
  dateEndSale date NOT NULL,
  PRIMARY KEY (idSale)
);

--����� ������ ����� ������

alter table invite
add (nameOrderer varchar(10) NOT NULL,
     numDiners INT,
     cityOrderer varchar(15),
     addressOrderer varchar(15));
  
--����� �� ����� ����� ������
     
alter table invite
rename column phone to phoneOrderer;      
   
--����� ������ ����� �����
  
alter table payment
add (id_payment INT NOT NULL,
     PRIMARY KEY (id_payment),
     typePayment varchar(10) NOT NULL);
     
--����� ������ ����� ���� 

alter table dish
add(idChef INT,
    idSale INT,    
    FOREIGN KEY (idChef) REFERENCES chef(idChef),
    FOREIGN KEY (idSale) REFERENCES sale(idSale)); 
    
--����� ����� ����� ������
    
alter table customer
add city varchar2(15) NOT NULL;
    
