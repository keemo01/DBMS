-- Akeem Jokosenumi
-- G00366442

Drop database if exists vetinaryDb;
show databases;
create database vetinaryDb CHARACTER SET utf8 COLLATE UTF8_GENERAL_CI ;
Use vetinaryDb;

Drop table if exists appointment;

-- creating appointment table
create table appointment (
   appointmentId tinyint unsigned NOT NULL auto_increment,
   patno Int(6) unsigned zerofill,  
   patname varchar(45) NOT NULL, -- maximum column length is 45 characters
   apt_madeby ENUM ('online', 'post', 'phone','dropping in') Not Null,  -- default value is first element in list
   appointmentDate date NOT NULL,
   symptoms ENUM('Vaccination', 'Allergies', 'Limp', 'Fever', 'Sneezing'),
   medication ENUM('Aspirin', 'Ibuprofen', 'Penicillin'),
PRIMARY KEY (appointmentId)
)Engine=InnoDB;
 

-- inserting data into appointment table
select * from appointment;
insert into appointment values (01, 9850, 'Akeem', 'online', '2023-08-20', 'Limp', 'Ibuprofen'), 
(02, 9851, 'Izuku', 'post', '2023-08-20', 'Fever', 'Penicillin');
ALTER TABLE appointment
ADD FOREIGN KEY (patno) REFERENCES animal(patno);

Drop table if exists animal;

create table animal (
  patno Int(6) unsigned zerofill auto_increment, -- see Numbers.sql next week
  pet ENUM ('Dog', 'Cat', 'Hamster', 'Snake','Fish'), --  constraint on values entered into the column, default value is first element in list, if wrong data entered MySQL truncates the illegal value to  ' ' (an empty string).
  petname varchar(45) not null,
  vet varchar(45) not null default 'Dr Pantu Pandeya',
  picture LONGBLOB DEFAULT NULL,           # Picture in DATABASE as BLOB (up to 4.2GB)
  picture_path varchar(20) DEFAULT NULL,   # Path to where picture is stored in file system,
PRIMARY KEY (patno)
)Engine=InnoDB;

INSERT INTO animal (patno, pet, petname, vet, picture, picture_path) VALUES
(8932, 'Dog', 'Kiku', 'Dr Pantu Pandeya', load_file('c:/patients/avatar3.jpg'),'/avatar1.jpg'),
(8740, 'Cat', 'Max', 'Dr Pantu Pandeya', load_file('c:/patients/avatar3.jpg'),'/avatar2.jpg'),
(8150, 'Hamster', 'Link', 'Dr Pantu Pandeya', load_file('c:/patients/avatar3.jpg'),'/avatar3.jpg'),
(8491, 'Fish', 'Azul', 'Dr Pantu Pandeya', load_file('c:/patients/avatar3.jpg'),'/avatar4.jpg');

Drop table if exists billing;

-- creating billing table
create table billing (
  payid tinyint unsigned NOT NULL auto_increment ,
  patno Int(6) unsigned zerofill, 
  paymentForm ENUM ('Credit Card', 'Bitcoin', 'Cash', 'Post', 'Dropping in') Not Null, -- default value is first element in list
  paymentDate DATE NOT NULL,
  total Int(6) unsigned zerofill,
  PRIMARY KEY (payid)
  )Engine=InnoDB;
  ALTER TABLE billing
  ADD FOREIGN KEY (patno) REFERENCES animal(patno);

-- inserting data into billing table
select * from billing;
INSERT into billing values (2000,0100, 'Credit Card', '2023-02-18', '300'), (2001,0101, 'Cash', '2023-06-09', '250'),(2002,0102, 'Bitcoin', '2023-12-30', '120'),(2003,0103, 'Dropping in', '2023-05-29', '200');


Drop TABLE if EXISTS medication;

-- creating medication table
create table medication (
  invoice_no int unsigned NOT NULL auto_increment ,
  medname ENUM('Aspirin', 'Ibuprofen', 'Penicillin', 'Other') NOT NULL,
  price Int(6) unsigned zerofill,
  PRIMARY KEY (invoice_no)
)  Engine=InnoDB;
ALTER TABLE medication
ADD FOREIGN KEY (patno) REFERENCES animal(patno); 

-- inserting data into medication table
select * from medication;
Insert into medication values (999,'Aspirin', '700'), (998,'Ibuprofen', '90'),(997,'Penicillin', '160'),(996, 'Other', '200');


Drop TABLE if EXISTS staff;

-- creating staff table
create table staff (
   staff_id tinyint unsigned NOT NULL auto_increment ,
   staff_name varchar(45) NOT NULL, -- maximum column length is 45 characters
   staff_addy varchar(45) NOT NULL,
   salary DECIMAL(10, 2) NOT NULL,
   staff_pic LONGBLOB DEFAULT NULL,           # Picture in DATABASE as BLOB (up to 4.2GB)
   xray_path varchar(20) DEFAULT NULL,   # Path to where picture is stored in file system,
   PRIMARY KEY (staff_id)
   )Engine=InnoDB;
ALTER TABLE staff
ADD FOREIGN KEY (patno) REFERENCES animal(patno);


-- inserting data into staff table
INSERT into staff VALUES 
(4110, 'Rocks D Xebec', 'Meath', 85000, load_file('c:/staff/xray1.jpg'),'/xray1.jpg'),
(4111, 'Edward Newgate', 'Leitrim', 27000, load_file('c:/staff/xray2.jpg'),'/xray2.jpg'),
(4112, 'Linlin Charlotte', 'Waterford', 15000, load_file('c:/staff/xray3.jpg'),'/xray3.jpg');

Drop table if exists petowners;
-- creating petowners table
create table petowners (
  ownerID int unsigned NOT NULL auto_increment ,
  name varchar(50) NOT NULL, -- maximum column length is 50 characters
  addy varchar(50) NOT NULL,
  ccdetails varchar(50) NOT NULL,
  PRIMARY KEY (ownerID)
  )Engine=InnoDB;
ALTER TABLE petowners
ADD FOREIGN KEY (patno) REFERENCES animal(patno);

Insert into petowners values (2251,'Yakubu Salam,', 'Longford','4319392080569011'),
(2252,'Marks Adams,', 'Meath','4319472810501910'),
(2253,'Yhwatch Zabazu,', 'Dublin','43193920809287612'),
(2254,'Eren Yeager,', 'Cork','4319352881552016');


-- Queries
 select patno,pet,petname,vet from animal;
 
update staff set salary = 27000 where staff_id = 4111;

delete from animal where petname = 'Kiku';
 
 
