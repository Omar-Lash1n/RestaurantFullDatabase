CREATE TABLE STAFF(
sid CHAR(5) PRIMARY KEY,
sname VARCHAR(40) NOT NULL,
sgender CHAR(1) NOT NULL,
sssn CHAR(14) NOT NULL,
saddress VARCHAR(30) NOT NULL,
sjob_title VARCHAR(10) NOT NULL,
sjob_shift VARCHAR(7) NOT NULL,
sstart_date DATE,
sattendance CHAR(10),
sstatus VARCHAR(15),
swork_branch VARCHAR(10) NOT NULL,
ssalary INT NOT NULL,
sbonus INT,
stotal_salary INT,
stime_in CHAR(20),
stime_out Char(20),
smonthly_swot CHAR(5),
sbid CHAR(5),
wstart_date DATE                                       
)
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

ALTER TABLE STAFF
ADD CONSTRAINT FK_SBID FOREIGN KEY (sbid) REFERENCES BRANCHES(bid) 

INSERT INTO STAFF (sid, sname, sgender, sssn, saddress, sjob_title, sjob_shift, sstart_date, sattendance, sstatus, swork_branch, ssalary, sbonus, stotal_salary, stime_in, stime_out, smonthly_swot, wstart_date)
VALUES
  ('S001', 'John Doe', 'M', '12345678901234', '123 Main Street', 'Waiter', 'Morning', '2022-01-01', 'Full-time', 'Active', 'B001', 2000, 100, 2100, '08:00 AM', '04:00 PM', 'Good', '2022-01-01'),
  ('S002', 'Jane Smith', 'F', '98765432101234', '456 Elm Street', 'Chef', 'Evening', '2021-12-01', 'Full-time', 'Active', 'B001', 3000, 200, 3200, '02:00 PM', '10:00 PM', 'perf', '2021-12-01'),
  ('S003', 'David Johnson', 'M', '54321098701234', '789 Oak Street', 'Bartender', 'Night', '2023-03-15', 'Part-time', 'Active', 'B002', 1500, NULL, 1500, '07:00 PM', '11:00 PM', 'Fair', '2023-03-15'),
  ('S004', 'Emily Davis', 'F', '45678901231234', '321 Pine Street', 'Waitress', 'Morning', '2022-06-10', 'Full-time', 'Active', 'B002', 1800, 50, 1850, '09:00 AM', '05:00 PM', 'Good', '2022-06-10'),
  ('S005', 'Michael Wilson', 'M', '65432109871234', '987 Cedar Street', 'Manager', 'Morning', '2021-10-15', 'Full-time', 'Active', 'B003', 5000, 500, 5500, '08:00 AM', '06:00 PM', 'perf', '2021-10-15'),
  ('S006', 'Sarah Brown', 'F', '78901234561234', '654 Maple Street', 'Hostess', 'Evening', '2023-01-20', 'Part-time', 'Active', 'B003', 1200, NULL, 1200, '04:00 PM', '09:00 PM', 'Good', '2023-01-20'),
  ('S007', 'Christopher Lee', 'M', '21098765431234', '852 Spruce Street', 'Chef', 'Morning', '2022-09-05', 'Full-time', 'Active', 'B004', 3000, 200, 3200, '07:00 AM', '03:00 PM', 'perf', '2022-09-05'),
  ('S008', 'Olivia Taylor', 'F', '90123456781234', '369 Oak Street', 'Waitress', 'Evening', '2023-05-10', 'Full-time', 'Active', 'B004', 1800, 50, 1850, '03:00 PM', '11:00 PM', 'Good', '2023-05-10'),
  ('S009', 'Daniel Anderson', 'M', '54321098711234', '741 Elm Street', 'Bartender', 'Night', '2022-02-15', 'Part-time', 'Active', 'B005', 1500, NULL, 1500, '06:00 PM', '10:00 PM', 'Fair', '2022-02-15'),
  ('S010', 'Sophia Thomas', 'F', '45678901241234', '987 Pine Street', 'Waiter', 'Morning', '2023-08-10', 'Full-time', 'Active', 'B005', 2000, 100, 2100, '08:00 AM', '04:00 PM', 'Good', '2023-08-10');

  SELECT * FROM STAFF

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CREATE TABLE STAFF_PHONE(
spid CHAR(5),
stf_phone CHAR(11),
PRIMARY KEY(spid,stf_phone),
FOREIGN KEY (spid) REFERENCES STAFF(sid)
)

CREATE TABLE BRANCHES
(
bid CHAR(5) PRIMARY KEY,
bmanager_name VARCHAR(40) NOT NULL,
btax_registered DECIMAL NOT NULL,
governament VARCHAR(10)NOT NULL,
area VARCHAR(10) NOT NULL,
bsid CHAR(5),
)
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ALTER TABLE BRANCHES
ADD CONSTRAINT FK_BSID FOREIGN KEY (bsid) REFERENCES STAFF(sid) 

INSERT INTO BRANCHES (bid, bmanager_name, btax_registered, governament, area)
VALUES
  ('B001', 'John Smith', 5000.00, 'XYZ123', 'ABC'),
  ('B002', 'Emily Johnson', 3000.00, 'PQR456', 'DEF'),
  ('B003', 'Michael Davis', 7000.00, 'LMN789', 'GHI'),
  ('B004', 'Sarah Wilson', 4000.00, 'UVW012', 'JKL'),
  ('B005', 'Christopher Brown', 6000.00, 'RST345', 'MNO'),
  ('B006', 'Olivia Anderson', 2500.00, 'FGH678', 'PQR'),
  ('B007', 'Daniel Thomas', 3500.00, 'IJK901', 'STU'),
  ('B008', 'Sophia Lee', 4500.00, 'CDE234', 'VWX'),
  ('B009', 'David Taylor', 5500.00, 'NOP567', 'YZA'),
  ('B010', 'Emma Harris', 2000.00, 'BCD890', 'EFG');

   SELECT * FROM BRANCHES
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CREATE TABLE BRANCH_PHONE 
(
bpid CHAR(5),
branch_phone CHAR(11),
PRIMARY KEY(bpid,branch_phone),
FOREIGN KEY (bpid) REFERENCES BRANCHES (bid)
)

CREATE TABLE CUSTOMERS (
cno CHAR(5) PRIMARY KEY ,
cname VARCHAR(15) NOT NULL,
ctype VARCHAR(10) NOT NULL,
carea VARCHAR(10),
cstreet VARCHAR(10),
chousenumber VARCHAR(10),
cemail VARCHAR(30),
cminame VARCHAR(15),
ctno VARCHAR(30),
cono INT,
)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


ALTER TABLE CUSTOMERS
ADD CONSTRAINT FK_CMINAME FOREIGN KEY (cminame) REFERENCES MENU_ITEMS (miname) 

ALTER TABLE CUSTOMERS
ALTER COLUMN ctno INT

ALTER TABLE CUSTOMERS
ADD CONSTRAINT FK_CTNO FOREIGN KEY (ctno) REFERENCES TABLES(tno) 

ALTER TABLE CUSTOMERS
ADD CONSTRAINT FK_CONO FOREIGN KEY (cono) REFERENCES ORDERS (ono) 

INSERT INTO CUSTOMERS (cno, cname, ctype, carea, cstreet, chousenumber, cemail)
VALUES
  ('C001', 'John Smith', 'Regular', 'ABC', 'Main', '123', 'john@example.com'),
  ('C002', 'Jane Anderson', 'VIP', 'DEF', 'Elm', '456', 'jane@example.com'),
  ('C003', 'David Johnson', 'Regular', 'GHI', 'Oak', '789', 'david@example.com'),
  ('C004', 'Emily Davis', 'Regular', 'JKL', 'Pine', '321', 'emily@example.com'),
  ('C005', 'Michael Wilson', 'VIP', 'MNO', 'Cedar', '987', 'michael@example.com'),
  ('C006', 'Sarah Brown', 'Regular', 'PQR', 'Maple', '654', 'sarah@example.com'),
  ('C007', 'Christopher Lee', 'Regular', 'STU', 'Spruce', '852', 'chris@example.com'),
  ('C008', 'Olivia Taylor', 'VIP', 'VWX', 'Oak', '369', 'olivia@example.com'),
  ('C009', 'Daniel Anderson', 'Regular', 'YZA', 'Elm', '741', 'daniel@example.com'),
  ('C010', 'Sophia Thomas', 'Regular', 'EFG', 'Pine', '987', 'sophia@example.com');

   SELECT * FROM  CUSTOMERS
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CREATE TABLE CUSTOMER_PHONE (
cpno CHAR(5),
cust_phone CHAR(11),
PRIMARY KEY (cpno,cust_phone),
FOREIGN KEY (cpno) REFERENCES CUSTOMERS (cno)
)

CREATE TABLE ORDERS(
ono INT PRIMARY KEY NOT NULL,
odata_time DATE,
otype CHAR NOT NULL,                                                     
osid CHAR(5) ,
FOREIGN KEY(osid) REFERENCES STAFF (sid),
)
///////////////////////////////////////////////////////////////////////////
ALTER TABLE ORDERS
ALTER COLUMN otype VARCHAR (20) not null

INSERT INTO ORDERS (ono, odata_time, otype)
VALUES
  (1, '2023-01-01', 'Dine-in'),
  (2, '2023-01-02', 'Takeout'),
  (3, '2023-01-03', 'Delivery'),
  (4, '2023-01-04', 'Dine-in'),
  (5, '2023-01-05', 'Takeout'),
  (6, '2023-01-06', 'Delivery'),
  (7, '2023-01-07', 'Dine-in'),
  (8, '2023-01-08', 'Takeout'),
  (9, '2023-01-09', 'Delivery'),
  (10, '2023-01-10', 'Dine-in');

   SELECT * FROM  ORDERS
///////////////////////////////////////////////////////////////////////////
CREATE TABLE ORDERS_OF_ITEMS_ORDERED(
oono INT  ,
items_orderd INT NOT NULL,
PRIMARY KEY(items_orderd,oono),
FOREIGN KEY (oono) REFERENCES ORDERS (ono),
)

 CREATE TABLE MENU_ITEMS
(
miname VARCHAR(15) PRIMARY KEY,
micategory varchar(20),
misize CHAR(10) ,
midescription varchar(100) ,
miprice DECIMAL NOT NULL,
 )
 ////////////////////////////////////////////////////////////////////////
 
INSERT INTO MENU_ITEMS (miname, micategory, misize, midescription, miprice)
VALUES
  ('Burger', 'Main Course', 'Regular', 'Delicious beef burger with lettuce and tomato', 8.99),
  ('Pizza', 'Main Course', 'Large', 'Classic margherita pizza with fresh mozzarella and basil', 12.99),
  ('Salad', 'Appetizer', 'Small', 'Mixed greens with cherry tomatoes, cucumber, and balsamic dressing', 6.99),
  ('Pasta', 'Main Course', 'Regular', 'Spaghetti with marinara sauce and meatballs', 10.99),
  ('Soup', 'Appetizer', 'Small', 'Creamy tomato soup with garlic croutons', 5.99),
  ('Steak', 'Main Course', 'Large', 'Grilled ribeye steak served with mashed potatoes and vegetables', 19.99),
  ('Sushi', 'Main Course', 'Regular', 'Assorted sushi rolls with fresh fish and avocado', 14.99),
  ('Fries', 'Side Dish', 'Regular', 'Crispy french fries with ketchup', 3.99),
  ('Ice Cream', 'Dessert', 'Small', 'Vanilla ice cream with chocolate sauce and whipped cream', 4.99),
  ('Coffee', 'Beverage', 'Regular', 'Freshly brewed coffee', 2.99);

   SELECT * FROM  MENU_ITEMS

 /////////////////////////////////////////////////////////////////////////
  CREATE TABLE MENU_OFFERS
( 
mioname VARCHAR(15),
 offers varchar(20),
PRIMARY KEY (mioname,offers),
FOREIGN KEY (mioname) REFERENCES MENU_ITEMS (miname)
 )

 CREATE TABLE TABLES(
tno INT PRIMARY KEY ,
tcapacity INT NOT NULL,
tstatues varchar(10) NOT NULL,
tfloor INT NOT NULL,
tcontent VARCHAR(50) not null,
tmname VARCHAR(15) ,
tsid CHAR(5),
FOREIGN KEY (tsid) REFERENCES STAFF (sid),
FOREIGN KEY (tmname) REFERENCES MENU_ITEMS (miname)
)


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ALTER TABLE TABLES
ADD CONSTRAINT FK_TSID FOREIGN KEY (tsid) REFERENCES STAFF(sid) 

INSERT INTO TABLES (tno, tcapacity, tstatues, tfloor, tcontent)
VALUES
  (1, 4, 'Occupied', 1, 'Standard'),
  (2, 2, 'Vacant', 1, 'High Chair'),
  (3, 6, 'Occupied', 1, 'Booth'),
  (4, 4, 'Vacant', 2, 'Standard'),
  (5, 2, 'Vacant', 2, 'High Chair'),
  (6, 6, 'Occupied', 2, 'Booth'),
  (7, 4, 'Vacant', 3, 'Standard'),
  (8, 2, 'Vacant', 3, 'High Chair'),
  (9, 6, 'Occupied', 3, 'Booth'),
  (10, 4, 'Vacant', 4, 'Standard');

   SELECT * FROM TABLES
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


 CREATE TABLE SERVE
( 
ssid CHAR(5),
scno CHAR(5),
PRIMARY KEY (scno,ssid),
FOREIGN KEY (ssid) REFERENCES STAFF(sid),
FOREIGN KEY (scno) REFERENCES CUSTOMERS(cno)
 )

 CREATE TABLE BILLS(
biid VARCHAR(9) PRIMARY KEY ,
bitype varchar(30) NOT NULL,
bidate_time varchar(30),
bicustomer_address VARCHAR(50),
biitem_price DECIMAL NOT NULL,
biemployee_name VARCHAR(20) NOT NULL,
bitax DECIMAL NOT NULL,
bitable_no INT,
bidelevery_cost DECIMAL,
bisid CHAR(5) ,
bicno CHAR(5),
FOREIGN KEY (bisid) REFERENCES STAFF (sid),
FOREIGN KEY (bicno) REFERENCES CUSTOMERS (cno)
)
////////////////////////////////////////////////////////////////////////////////
ALTER TABLE BILLS
ADD bitotal_price DECIMAL

INSERT INTO BILLS (biid, bitype, bidate_time, bicustomer_address, biitem_price, biemployee_name, bitax, bitable_no, bidelevery_cost)
VALUES
  ('BI001', 'Dine-in', '2023-01-01 18:30:00', '123 Main Street', 50.00, 'John Smith', 5.00, 1, NULL),
  ('BI002', 'Takeout', '2023-01-02 20:15:00', '456 Elm Avenue', 25.00, 'Emily Johnson', 2.50, NULL, NULL),
  ('BI003', 'Dine-in', '2023-01-03 19:45:00', '789 Oak Lane', 40.00, 'Michael Davis', 4.00, 3, NULL),
  ('BI004', 'Delivery', '2023-01-04 12:00:00', '321 Pine Street', 30.00, 'Sarah Wilson', 3.00, NULL, 5.00),
  ('BI005', 'Dine-in', '2023-01-05 17:30:00', '987 Cedar Road', 60.00, 'Christopher Brown', 6.00, 2, NULL),
  ('BI006', 'Takeout', '2023-01-06 19:00:00', '654 Maple Avenue', 35.00, 'Olivia Anderson', 3.50, NULL, NULL),
  ('BI007', 'Delivery', '2023-01-07 20:45:00', '852 Spruce Street', 45.00, 'Daniel Thomas', 4.50, NULL, 7.50),
  ('BI008', 'Dine-in', '2023-01-08 18:15:00', '369 Oak Lane', 55.00, 'Sophia Lee', 5.50, 4, NULL),
  ('BI009', 'Takeout', '2023-01-09 21:30:00', '741 Elm Avenue', 30.00, 'David Taylor', 3.00, NULL, NULL),
  ('BI010', 'Dine-in', '2023-01-10 19:30:00', '987 Pine Street', 40.00, 'Emma Harris', 4.00, 5, NULL);

   SELECT * FROM BILLS
////////////////////////////////////////////////////////////////////////////////
CREATE TABLE BILLS_DISCOUNT(
bdid VARCHAR (9) ,
bill_discounts varchar(30),
PRIMARY KEY(bdid,bill_discounts),
FOREIGN KEY (bdid) REFERENCES BILLS (biid)
)

CREATE TABLE BILLS_NO_OF_REP_ITEMS(
bnid VARCHAR(9),
no_of_repeated_items INT,
PRIMARY KEY(bnid,no_of_repeated_items),
FOREIGN KEY (bnid) REFERENCES BILLS (biid)
)

CREATE TABLE ROOMS(
rid CHAR(5) PRIMARY KEY,
rname VARCHAR(40) NOT NULL,
rtype VARCHAR(40) NOT NULL,
rbid CHAR(5),
wstart_date DATE,
FOREIGN KEY (rbid) REFERENCES BRANCHES(bid)
)
///////////////////////////////////////////////////////////////////
INSERT INTO ROOMS (rid, rname, rtype, wstart_date)
VALUES
  ('R001', 'Private Dining Room 1', 'Private', '2023-01-01'),
  ('R002', 'Private Dining Room 2', 'Private', '2023-01-02'),
  ('R003', 'Party Hall A', 'Event', NULL),
  ('R004', 'Party Hall B', 'Event', NULL),
  ('R005', 'Conference Room 1', 'Meeting', NULL),
  ('R006', 'Conference Room 2', 'Meeting', NULL),
  ('R007', 'Outdoor Terrace', 'Outdoor', NULL),
  ('R008', 'Bar Lounge', 'Lounge', NULL),
  ('R009', 'VIP Lounge', 'Lounge', '2023-01-03'),
  ('R010', 'Game Room', 'Entertainment', NULL);

   SELECT * FROM ROOMS
///////////////////////////////////////////////////////////////////

CREATE TABLE ROOM_CONTENT(
rcid CHAR(5),
rm_content CHAR(50),
PRIMARY KEY(rcid,rm_content),
FOREIGN KEY (rcid ) REFERENCES ROOMS(rid)
)

CREATE TABLE INVENTORY
( 
iid INT PRIMARY KEY,
iquantity varchar(20),
icost DECIMAL,
imeasuring_unit varchar(20) ,
irid CHAR(5),
FOREIGN KEY (irid) REFERENCES ROOMS (rid),
 )
 /////////////////////////////////////////////////////////////////////////
 INSERT INTO INVENTORY (iid, iquantity, icost, imeasuring_unit)
VALUES
  (1, '50 units', 10.99, 'Pounds'),
  (2, '100 units', 5.99, 'Liters'),
  (3, '200 units', 3.99, 'Pieces'),
  (4, '30 units', 8.99, 'Pounds'),
  (5, '80 units', 4.99, 'Liters'),
  (6, '150 units', 2.99, 'Pieces'),
  (7, '40 units', 7.99, 'Pounds'),
  (8, '60 units', 3.49, 'Liters'),
  (9, '100 units', 1.99, 'Pieces'),
  (10, '20 units', 6.99, 'Pounds');

   SELECT * FROM INVENTORY
 /////////////////////////////////////////////////////////////////////////

  CREATE TABLE INVENT_ING_NEEDED
( iiid INT,
ingredients_needed varchar(100),
PRIMARY KEY (iiid,ingredients_needed),
FOREIGN KEY (iiid) REFERENCES INVENTORY(iid)
)
///////////////////////////////////////////////////////////////

INSERT INTO INVENT_ING_NEEDED (iiid, ingredients_needed)
VALUES
  (1, 'Ground Beef'),
  (2, 'Tomatoes'),
  (3, 'Flour'),
  (4, 'Chicken Breast'),
  (5, 'Milk'),
  (6, 'Eggs'),
  (7, 'Onions'),
  (8, 'Sugar'),
  (9, 'Cheese'),
  (10, 'Potatoes');

   SELECT * FROM INVENT_ING_NEEDED
///////////////////////////////////////////////////////////////
CREATE TABLE GET
(
gsid CHAR(5),
giid INT,
PRIMARY KEY(gsid,giid),
FOREIGN KEY(gsid) REFERENCES STAFF(sid),
FOREIGN KEY(giid) REFERENCES INVENTORY(iid),
)

CREATE TABLE WORK_IN(
wsid CHAR(5),
wrid CHAR(5),
PRIMARY KEY(wsid,wrid),
FOREIGN KEY (wsid) REFERENCES STAFF(sid),
FOREIGN KEY (wrid) REFERENCES ROOMS(rid)
)










