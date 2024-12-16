CREATE TABLE waiter
(
  id_waiter VARCHAR2(10) NOT NULL,
  DOB DATE NOT NULL,
  fname VARCHAR2(20) NOT NULL,
  lname VARCHAR2(20) NOT NULL,
  salery NUMBER(10) NOT NULL,
  PRIMARY KEY (id_waiter)
);

CREATE TABLE customer
(
  lname VARCHAR2(20) NOT NULL,
  fname VARCHAR2(20) NOT NULL,
  phone NUMBER(10) NOT NULL,
  email VARCHAR2(20) NOT NULL,
  club_member NUMBER(10) NOT NULL,
  address VARCHAR2(20) NOT NULL,
  PRIMARY KEY (phone)
);

CREATE TABLE dish
(
  id_dish VARCHAR2(10) NOT NULL,
  price NUMBER(10) NOT NULL,
  name VARCHAR2(20) NOT NULL,
  type_dish VARCHAR(20) NOT NULL,
  PRIMARY KEY (id_dish)
);

CREATE TABLE waiter_phone
(
  phone NUMBER(10) NOT NULL,
  id_waiter VARCHAR2(10) NOT NULL,
  PRIMARY KEY (phone),
  FOREIGN KEY (id_waiter) REFERENCES waiter(id_waiter)
  on delete cascade
);

CREATE TABLE invite
(
  id_order VARCHAR2(10) NOT NULL,
  date_order DATE NOT NULL,
  type_order VARCHAR2(20) NOT NULL,
  feedback VARCHAR2(20) NOT NULL,
  id_waiter VARCHAR2(10) NOT NULL,
  phone NUMBER(10) NOT NULL,
  PRIMARY KEY (id_order),
  FOREIGN KEY (id_waiter) REFERENCES waiter(id_waiter)
  on delete cascade,
  FOREIGN KEY (phone) REFERENCES customer(phone)
  on delete cascade
);

CREATE TABLE payment
(
  date_pay DATE NOT NULL,
  price NUMBER(10) NOT NULL,
  id_order VARCHAR2(10) NOT NULL,
  FOREIGN KEY (id_order) REFERENCES invite(id_order )
  on delete cascade
);

CREATE TABLE containing
(
  amount NUMBER (20) NOT NULL,
  id_order VARCHAR2(10) NOT NULL,
  id_dish VARCHAR2(10) NOT NULL,
  PRIMARY KEY (id_order, id_dish),
  FOREIGN KEY (id_order) REFERENCES invite(id_order)
  on delete cascade,
  FOREIGN KEY (id_dish) REFERENCES dish(id_dish)
  on delete cascade
);
