
Store			
CREATE TABLE Store (
  store_id int NOT NULL,
  country varchar(20),
  city varchar(100),
  address varchar(100),
  PRIMARY KEY (store_id)
);

create sequence seq_store
start with 1 
increment by 1 
minvalue 0 
maxvalue 100 
nocycle; 

INSERT INTO Store(store_id, country, city, address) VALUES (seq_store.nextval, 'USA', 'New York', '123 Main St');
INSERT INTO Store(store_id, country, city, address) VALUES (seq_store.nextval, 'UK', 'London', '456 High St');
INSERT INTO Store(store_id, country, city, address) VALUES (seq_store.nextval, 'France', 'Paris', '789 Rue de la Paix');
INSERT INTO Store(store_id, country, city, address) VALUES (seq_store.nextval, 'Germany', 'Berlin', '10 Unter den Linden');
INSERT INTO Store(store_id, country, city, address) VALUES (seq_store.nextval, 'Australia', 'Sydney', '555 George St');
INSERT INTO Store(store_id, country, city, address) VALUES (seq_store.nextval, 'Canada', 'Toronto', '789 Yonge St');
INSERT INTO Store(store_id, country, city, address) VALUES (seq_store.nextval, 'Japan', 'Tokyo', '1-2 Shibuya St');
INSERT INTO Store(store_id, country, city, address) VALUES (seq_store.nextval, 'Spain', 'Madrid', '123 Gran Via');
INSERT INTO Store(store_id, country, city, address) VALUES (seq_store.nextval, 'USA', 'Los Angeles', '789 Sunset Blvd');
INSERT INTO Store(store_id, country, city, address) VALUES (seq_store.nextval, 'Canada', 'Toronto', '123 Main St');



Employee
CREATE TABLE Employee (
  employee_id int NOT NULL,
  first_name varchar2(50) NOT NULL,
  last_name varchar2(50) NOT NULL,
  date_of_birth date,
  address varchar(100),
  email varchar2(100),
  phone_number varchar2(10),
  store_id int,
  job_id int,
  PRIMARY KEY (employee_id),
  FOREIGN KEY (store_id) REFERENCES Store(store_id),
  FOREIGN KEY (job_id) REFERENCES Jobs(job_id)
);

create sequence seq_employee
start with 1 
increment by 1 
minvalue 0 
maxvalue 100 
nocycle; 

INSERT INTO Employee (employee_id, first_name, last_name, date_of_birth, address, email, phone_number, store_id, job_id)
VALUES (seq_employee.nextval, 'John', 'Doe', DATE '1990-05-15', '123 Main St', 'john.doe@example.com', '1234567890', 1, 1);
INSERT INTO Employee (employee_id, first_name, last_name, date_of_birth, address, email, phone_number, store_id, job_id)
VALUES (seq_employee.nextval, 'Jane', 'Smith', DATE '1988-12-10', '456 High St', 'jane.smith@example.com', '9876543210', 2, 2);
INSERT INTO Employee (employee_id, first_name, last_name, date_of_birth, address, email, phone_number, store_id, job_id)
VAlUES (seq_employee.nextval, 'Michael', 'Johnson', DATE '1995-07-20', '789 Rue de la Paix', 'michael.johnson@example.com', '4561237890', 1, 2);
INSERT INTO Employee (employee_id, first_name, last_name, date_of_birth, address, email, phone_number, store_id, job_id)
VALUES (seq_employee.nextval, 'Emily', 'Johnson', DATE '1992-09-28', '10 Unter den Linden', 'emily.johnson@example.com', '1239874560', 2, 1);
INSERT INTO Employee (employee_id, first_name, last_name, date_of_birth, address, email, phone_number, store_id, job_id)
VALUES (seq_employee.nextval, 'David', 'Brown', DATE '1991-03-17', '555 George St', 'david.brown@example.com', '9876543219', 1, 2);
INSERT INTO Employee (employee_id, first_name, last_name, date_of_birth, address, email, phone_number, store_id, job_id)
VALUES (seq_employee.nextval, 'Sarah', 'Wilson', DATE '1994-11-05', '789 Yonge St', 'sarah.wilson@example.com', '4561237895', 2, 1);
INSERT INTO Employee (employee_id, first_name, last_name, date_of_birth, address, email, phone_number, store_id, job_id)
VALUES (seq_employee.nextval, 'Daniel', 'Miller', DATE '1989-07-12', '1-2 Shibuya St', 'daniel.miller@example.com', '7896541230', 1, 2);
INSERT INTO Employee (employee_id, first_name, last_name, date_of_birth, address, email, phone_number, store_id, job_id)
VALUES (seq_employee.nextval, 'Olivia', 'Anderson', DATE '1993-02-09', '123 Gran Via', 'olivia.anderson@example.com', '4567891230', 2, 1);



Account
CREATE TABLE Account(
 account_id int NOT NULL,
 username varchar(10) NOT NULL,
 password varchar(30) NOT NULL,
 customer_id int,
 PRIMARY KEY (account_id),
 FOREIGN KEY (customer_id) REFERENCES Account_info(customer_id)
);

create sequence seq_account.nextval
start with 1 
increment by 1 
minvalue 0 
maxvalue 100 
nocycle;

INSERT INTO Account (account_id, username, password, customer_id)
VALUES (seq_account.nextval, 'johnsmith', 'p@ssw0rd1', 1);
INSERT INTO Account (account_id, username, password, customer_id)
VALUES (seq_account.nextval, 'janedoe', 'securepass', 2);
INSERT INTO Account (account_id, username, password, customer_id)
VALUES (seq_account.nextval, 'mikejones', 'abc123!', 3);
INSERT INTO Account (account_id, username, password, customer_id)
VALUES (seq_account.nextval, 'emilywilson', 'pass1234', 4);
INSERT INTO Account (account_id, username, password, customer_id)
VALUES (seq_account.nextval, 'davidbrown', 'secretword', 5);
INSERT INTO Account (account_id, username, password, customer_id)
VALUES (seq_account.nextval, 'sarahmiller', 'mysecretpass', 6);
INSERT INTO Account (account_id, username, password, customer_id)
VALUES (seq_account.nextval, 'robertthomas', 'passw0rd!', 7);
INSERT INTO Account (account_id, username, password, customer_id)
VALUES (seq_account.nextval, 'laurawalker', '12345678', 8);
INSERT INTO Account (account_id, username, password, customer_id)
VALUES (seq_account.nextval, 'alexandercruz', 'secure1!', 9);
INSERT INTO Account (account_id, username, password, customer_id)
VALUES (seq_account.nextval, 'mollyallen', 'mypass123', 10);


	
Account_info
CREATE TABLE Account_info (
  customer_id int NOT NULL,
  first_name varchar2(50),
  last_name varchar2(50),
  date_of_birth date,
  customer_address varchar(100),
  customer_email varchar2(100),
  phone_number varchar2(10),
  PRIMARY KEY (customer_id)
);

create sequence seq_customer
start with 1 
increment by 1 
minvalue 0 
maxvalue 100 
nocycle; 

INSERT INTO Account_info (customer_id, first_name, last_name, date_of_birth, customer_address, customer_email, phone_number)
VALUES (seq_customer.nextval, 'John', 'Doe', DATE '1990-05-15', '123 Main St', 'john.doe@example.com', '1234567890');
INSERT INTO Account_info (customer_id, first_name, last_name, date_of_birth, customer_address, customer_email, phone_number)
VAlUES (seq_customer.nextval, 'Jane', 'Smith', DATE '1988-12-10', '456 High St', 'jane.smith@example.com', '9876543210');
INSERT INTO Account_info (customer_id, first_name, last_name, date_of_birth, customer_address, customer_email, phone_number)
VALUES (seq_customer.nextval, 'Michael', 'Johnson', DATE '1995-07-20', '789 Rue de la Paix', 'michael.johnson@example.com', '4561237890');
INSERT INTO Account_info (customer_id, first_name, last_name, date_of_birth, customer_address, customer_email, phone_number)
VALUES (seq_customer.nextval, 'Emily', 'Johnson', DATE '1992-09-28', '10 Unter den Linden', 'emily.johnson@example.com', '1239874560');
INSERT INTO Account_info (customer_id, first_name, last_name, date_of_birth, customer_address, customer_email, phone_number)
VALUES (seq_customer.nextval, 'David', 'Brown', DATE '1991-03-17', '555 George St', 'david.brown@example.com', '9876543219');
INSERT INTO Account_info (customer_id, first_name, last_name, date_of_birth, customer_address, customer_email, phone_number)
VALUES (seq_customer.nextval, 'Sarah', 'Wilson', DATE '1994-11-05', '789 Yonge St', 'sarah.wilson@example.com', '4561237895');
INSERT INTO Account_info (customer_id, first_name, last_name, date_of_birth, customer_address, customer_email, phone_number)
VALUES (seq_customer.nextval, 'Daniel', 'Miller', DATE '1989-07-12', '1-2 Shibuya St', 'daniel.miller@example.com', '7896541230');
INSERT INTO Account_info (customer_id, first_name, last_name, date_of_birth, customer_address, customer_email, phone_number)
VALUES (seq_customer.nextval, 'Olivia', 'Anderson', DATE '1993-02-09', '123 Gran Via', 'olivia.anderson@example.com', '4567891230');
INSERT INTO Account_info (customer_id, first_name, last_name, date_of_birth, customer_address, customer_email, phone_number)
VALUES (seq_customer.nextval, 'Sophia', 'Garcia', DATE '1994-09-17', '789 Oak St', 'sophia.garcia@example.com', '1234567890');
INSERT INTO Account_info (customer_id, first_name, last_name, date_of_birth, customer_address, customer_email, phone_number)
VALUES (seq_customer.nextval, 'Liam', 'Martinez', DATE '1993-07-23', '456 Maple Ave', 'liam.martinez@example.com', '9876543210');



Stocks
CREATE TABLE Stocks (
  store_id int NOT NULL,
  product_id int NOT NULL,
  quantity int,
  PRIMARY KEY (store_id, product_id)
);

INSERT INTO Stocks (store_id, product_id, quantity) VALUES (1, 1, 50);
INSERT INTO Stocks (store_id, product_id, quantity) VALUES (6, 2, 50);
INSERT INTO Stocks (store_id, product_id, quantity) VALUES (8, 1, 75);
INSERT INTO Stocks (store_id, product_id, quantity) VALUES (2, 2, 120);
INSERT INTO Stocks (store_id, product_id, quantity) VALUES (3, 1, 60);
INSERT INTO Stocks (store_id, product_id, quantity) VALUES (3, 2, 80);
INSERT INTO Stocks (store_id, product_id, quantity) VALUES (7, 1, 90);
INSERT INTO Stocks (store_id, product_id, quantity) VALUES (4, 2, 110);
INSERT INTO Stocks (store_id, product_id, quantity) VALUES (5, 1, 70);
INSERT INTO Stocks (store_id, product_id, quantity) VALUES (9, 2, 130);



Payment
CREATE TABLE Payment (
  order_id int NOT NULL,
  amount int,
  payment_date date,
  PRIMARY KEY (order_id)
);

INSERT INTO Payment (order_id, amount, payment_date) VALUES (1, 1, 100, DATE '2023-06-01');
INSERT INTO Payment (order_id, amount, payment_date) VALUES (1, 2, 150, DATE '2023-06-02');
INSERT INTO Payment (order_id, amount, payment_date) VALUES (2, 3, 200, DATE '2023-06-03');
INSERT INTO Payment (order_id, amount, payment_date) VALUES (2, 4, 75, DATE '2023-06-04');
INSERT INTO Payment (order_id, amount, payment_date) VALUES (3, 5, 120, DATE '2023-06-05');
INSERT INTO Payment (order_id, amount, payment_date) VALUES (3, 6, 90, DATE '2023-06-06');
INSERT INTO Payment (order_id, amount, payment_date) VALUES (4, 7, 180, DATE '2023-06-07');
INSERT INTO Payment (order_id, amount, payment_date) VALUES (8, 8, 110, DATE '2023-06-08');
INSERT INTO Payment (order_id, amount, payment_date) VALUES (5, 9, 140, DATE '2023-06-09');
INSERT INTO Payment (order_id, amount, payment_date) VALUES (9, 10, 200, DATE '2023-06-10');



Products
CREATE TABLE Products (
  product_id int NOT NULL,
  product_name varchar(50),
  categories_id int,
  supplier_id int,
  PRIMARY KEY (product_id),
  FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id),
  FOREIGN KEY (categories_id) REFERENCES Categories(categories_id)
);

create sequence seq_product
start with 1 
increment by 1 
minvalue 0 
maxvalue 100 
nocycle; 


INSERT INTO Products (product_id, product_name, subcategories_id, supplier_id) VALUES (seq_product.nextval, 'iPhone 12', 1, 1);
INSERT INTO Products (product_id, product_name, subcategories_id, supplier_id) VALUES (seq_product.nextval, 'Samsung Galaxy S21', 2, 2);
INSERT INTO Products (product_id, product_name, subcategories_id, supplier_id) VALUES (seq_product.nextval, 'Sony PlayStation 5', 3, 3);
INSERT INTO Products (product_id, product_name, subcategories_id, supplier_id) VALUES (seq_product.nextval, 'Nike Air Max 90', 4, 4);
INSERT INTO Products (product_id, product_name, subcategories_id, supplier_id) VALUES (seq_product.nextval, 'Canon EOS R6', 5, 3);
INSERT INTO Products (product_id, product_name, subcategories_id, supplier_id) VALUES (seq_product.nextval, 'Apple MacBook Pro', 6, 2);
INSERT INTO Products (product_id, product_name, subcategories_id, supplier_id) VALUES (seq_product.nextval, 'Dell XPS 13', 4, 4);
INSERT INTO Products (product_id, product_name, subcategories_id, supplier_id) VALUES (seq_product.nextval, 'Adidas Superstar', 2, 1);
INSERT INTO Products (product_id, product_name, subcategories_id, supplier_id) VALUES (seq_product.nextval, 'Sony WH-1000XM4', 9, 3);
INSERT INTO Products (product_id, product_name, subcategories_id, supplier_id) VALUES (seq_product.nextval, 'LG OLED CX Series', 3, 2);






Orders
CREATE TABLE Orders (
  order_id int NOT NULL,
  order_date DATE,
  account_id int,
  product_id int,
  PRIMARY KEY (order_id),
  FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

create sequence seq_order
start with 1 
increment by 1 
minvalue 0 
maxvalue 100 
nocycle; 


INSERT INTO Orders (order_id, order_date, account_id,product_id) VALUES (seq_order.nextval, '2023-06-01', 1, 1);
INSERT INTO Orders (order_id, order_date, account_id,product_id) VALUES (seq_order.nextval, '2023-06-02', 2, 2);
INSERT INTO Orders (order_id, order_date, account_id,product_id) VALUES (seq_order.nextval, '2023-06-03', 3, 3);
INSERT INTO Orders (order_id, order_date, account_id,product_id) VALUES (seq_order.nextval, '2023-06-04', 4, 4);
INSERT INTO Orders (order_id, order_date, account_id,product_id) VALUES (seq_order.nextval, '2023-06-05', 5, 5);
INSERT INTO Orders (order_id, order_date, account_id,product_id) VALUES (seq_order.nextval, '2023-06-06', 1, 6);
INSERT INTO Orders (order_id, order_date, account_id,product_id) VALUES (seq_order.nextval, '2023-06-07', 2, 7);
INSERT INTO Orders (order_id, order_date, account_id,product_id) VALUES (seq_order.nextval, '2023-06-08', 3, 8);
INSERT INTO Orders (order_id, order_date, account_id,product_id) VALUES (seq_order.nextval, '2023-06-09', 4, 9);
INSERT INTO Orders (order_id, order_date, account_id,product_id) VALUES (seq_order.nextval, '2023-06-10', 5, 10);

 

Categories
CREATE TABLE Categories (
  categories_id int NOT NULL,
  category_name varchar(50),
  PRIMARY KEY (categories_id)
);

create sequence seq_categories
start with 1 
increment by 1 
minvalue 0 
maxvalue 100 
nocycle; 

INSERT INTO Categories (categories_id, category_name) VALUES (seq_categories.nextval, 'Electronics');
INSERT INTO Categories (categories_id, category_name) VALUES (seq_categories.nextval, 'Clothing');
INSERT INTO Categories (categories_id, category_name) VALUES (seq_categories.nextval, 'Home Decor');
INSERT INTO Categories (categories_id, category_name) VALUES (seq_categories.nextval, 'Shoes');
INSERT INTO Categories (categories_id, category_name) VALUES (seq_categories.nextval, 'Appliances');
INSERT INTO Categories (categories_id, category_name) VALUES (seq_categories.nextval, 'Furniture');
INSERT INTO Categories (categories_id, category_name) VALUES (seq_categories.nextval, 'Books');
INSERT INTO Categories (categories_id, category_name) VALUES (seq_categories.nextval, 'Beauty');
INSERT INTO Categories (categories_id, category_name) VALUES (seq_categories.nextval, 'Sports');
INSERT INTO Categories (categories_id, category_name) VALUES (seq_categories.nextval, 'Jewelry');





Product_review
CREATE TABLE Product_review (
  product_id int NOT NULL,
  account_id int NOT NULL,
  title varchar(50),
  description varchar(200),
  rating int,
  published date,
  PRIMARY KEY (product_id, customer_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id),
  FOREIGN KEY (account_id) REFERENCES Account(Account_id)
);

INSERT INTO Product_review (product_id, account_id,title, description, rating, published) 
VALUES (1, 1, 'Great Phone', 'I love this phone!', 5, DATE '2023-06-01');
INSERT INTO Product_review (product_id, account_id,title, description, rating, published) 
VALUES (2, 2, 'Excellent Quality', 'The product exceeded my expectations.', 4, DATE '2023-06-02');
INSERT INTO Product_review (product_id, account_id,title, description, rating, published) 
VALUES (3, 3, 'Beautiful Home Decor', 'Adds a touch of elegance to my home.', 5, DATE '2023-06-03');
INSERT INTO Product_review (product_id, account_id,title, description, rating, published) 
VALUES (4, 4, 'Comfortable Shoes', 'Perfect fit and very comfortable.', 4, DATE '2023-06-04');
INSERT INTO Product_review (product_id, account_id,title, description, rating, published) 
VALUES (5, 7, 'Highly Recommended', 'Great performance and features.', 5, DATE '2023-06-05');
INSERT INTO Product_review (product_id, account_id,title, description, rating, published) 
VALUES (6, 8, 'Impressive Laptop', 'Fast and reliable for my work.', 4, DATE '2023-06-06');
INSERT INTO Product_review (product_id, account_id,title, description, rating, published) 
VALUES (7, 2, 'Sleek Design', 'Looks stylish and performs well.', 4, DATE '2023-06-07');
INSERT INTO Product_review (product_id, account_id,title, description, rating, published) 
VALUES (8, 9, 'Classic Sneakers', 'Iconic design and comfortable to wear.', 5, DATE  '2023-06-08');
INSERT INTO Product_review (product_id, account_id,title, description, rating, published) 
VALUES (9, 4, 'Great Sound Quality', 'Noise-canceling feature works amazingly.', 4, DATE '2023-06-09');
INSERT INTO Product_review (product_id, account_id,title, description, rating, published) 
VALUES (10, 5, 'Impressive Display', 'Vivid colors and excellent picture quality.', 5, DATE '2023-06-10');


						 
Supplier
CREATE TABLE Supplier (
  supplier_id int NOT NULL,
  supplier_name varchar(100),
  supplier_address varchar(100),
  supplier_email varchar(100),
  supplier_phone varchar(10),
  PRIMARY KEY (supplier_id)
);

create sequence seq_supplier
start with 1 
increment by 1 
minvalue 0 
maxvalue 100 
nocycle; 

INSERT INTO Supplier (supplier_id, supplier_name, supplier_address, supplier_email, supplier_phone)
VALUES (seq_supplier.nextval, 'ABC Electronics', '123 Main Street', 'abc@example.com', '1234567890');
INSERT INTO Supplier (supplier_id, supplier_name, supplier_address, supplier_email, supplier_phone)
VALUES (seq_supplier.nextval, 'XYZ Fashion', '456 Elm Avenue', 'xyz@example.com', '9876543210');
INSERT INTO Supplier (supplier_id, supplier_name, supplier_address, supplier_email, supplier_phone)
VALUES (seq_supplier.nextval, 'Global Home Decor', '789 Oak Lane', 'global@example.com', '5678901234');
INSERT INTO Supplier (supplier_id, supplier_name, supplier_address, supplier_email, supplier_phone)
VALUES (seq_supplier.nextval, 'ShoeMart', '321 Maple Road', 'shoemart@example.com', '8901234567');
INSERT INTO Supplier (supplier_id, supplier_name, supplier_address, supplier_email, supplier_phone)
VALUES (seq_supplier.nextval, 'Appliance World', '654 Pine Street', 'appliance@example.com', '3456789012');
INSERT INTO Supplier (supplier_id, supplier_name, supplier_address, supplier_email, supplier_phone)
VALUES (seq_supplier.nextval, 'Furniture Direct', '987 Cedar Avenue', 'furniture@example.com', '6789012345');
INSERT INTO Supplier (supplier_id, supplier_name, supplier_address, supplier_email, supplier_phone)
VALUES (seq_supplier.nextval, 'BookWorm Publishers', '234 Birch Lane', 'bookworm@example.com', '9012345678');
INSERT INTO Supplier (supplier_id, supplier_name, supplier_address, supplier_email, supplier_phone)
VALUES (seq_supplier.nextval, 'Beauty Essentials', '567 Walnut Street', 'beauty@example.com', '4321098765');
INSERT INTO Supplier (supplier_id, supplier_name, supplier_address, supplier_email, supplier_phone)
VALUES (seq_supplier.nextval, 'Sports Unlimited', '890 Oak Avenue', 'sports@example.com', '7654321098');
INSERT INTO Supplier (supplier_id, supplier_name, supplier_address, supplier_email, supplier_phone)
VALUES (seq_supplier.nextval, 'JewelCraft', '123 Elm Lane', 'jewelry@example.com', '2109876543');



Jobs
CREATE TABLE Jobs (
  job_id int NOT NULL,
  job_title varchar(100),
  min_salary int,
  max_salary int,
  PRIMARY KEY (job_id)
);

create sequence seq_jobs
start with 1 
increment by 1 
minvalue 0 
maxvalue 100 
nocycle; 


INSERT INTO Jobs (job_id, job_title, min_salary, max_salary)
VALUES (seq_jobs.nextval, 'Software Engineer', 50000, 100000);
INSERT INTO Jobs (job_id, job_title, min_salary, max_salary)
VALUES (seq_jobs.nextval, 'Sales Manager', 60000, 120000);
INSERT INTO Jobs (job_id, job_title, min_salary, max_salary)
VALUES (seq_jobs.nextval, 'Marketing Specialist', 45000, 90000);
INSERT INTO Jobs (job_id, job_title, min_salary, max_salary)
VALUES (seq_jobs.nextval, 'Financial Analyst', 55000, 110000);
INSERT INTO Jobs (job_id, job_title, min_salary, max_salary)
VALUES (seq_jobs.nextval, 'HR Coordinator', 40000, 80000);
INSERT INTO Jobs (job_id, job_title, min_salary, max_salary)
VALUES (seq_jobs.nextval, 'Operations Supervisor', 48000, 96000);
INSERT INTO Jobs (job_id, job_title, min_salary, max_salary)
VALUES (seq_jobs.nextval, 'Customer Service Representative', 35000, 70000);
INSERT INTO Jobs (job_id, job_title, min_salary, max_salary)
VALUES (seq_jobs.nextval, 'Graphic Designer', 42000, 84000);
INSERT INTO Jobs (job_id, job_title, min_salary, max_salary)
VALUES (seq_jobs.nextval, 'Quality Assurance Engineer', 52000, 104000);
INSERT INTO Jobs (job_id, job_title, min_salary, max_salary)
VALUES (seq_jobs.nextval, 'Administrative Assistant', 38000, 76000);


						
Shipment
CREATE TABLE Shipment (
  shipment_id int NOT NULL,
  shipping_company varchar(100),
  delivery_time date,
  order_id int,
  PRIMARY KEY (shipment_id),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

create sequence seq_shipment
start with 1 
increment by 1 
minvalue 0 
maxvalue 100 
nocycle; 

INSERT INTO Shipment (shipment_id, shipping_company, delivery_time, order_id)
VALUES (seq_shipment.nextval, 'ABC Shipping', DATE '2023-06-15', 1);
INSERT INTO Shipment (shipment_id, shipping_company, delivery_time, order_id)
VALUES (seq_shipment.nextval, 'XYZ Logistics', DATE '2023-06-16', 2);
INSERT INTO Shipment (shipment_id, shipping_company, delivery_time, order_id)
VALUES (seq_shipment.nextval, 'Global Couriers', DATE '2023-06-17', 3);
INSERT INTO Shipment (shipment_id, shipping_company, delivery_time, order_id)
VALUES (seq_shipment.nextval, 'Express Shipping', DATE '2023-06-18', 4);
INSERT INTO Shipment (shipment_id, shipping_company, delivery_time, order_id)
VALUES (seq_shipment.nextval, 'FastTrack Logistics', DATE '2023-06-19', 5);
INSERT INTO Shipment (shipment_id, shipping_company, delivery_time, order_id)
VALUES (seq_shipment.nextval, 'Swift Couriers', DATE '2023-06-20', 6);
INSERT INTO Shipment (shipment_id, shipping_company, delivery_time, order_id)
VALUES (seq_shipment.nextval, 'QuickShip Express', DATE '2023-06-21',  7);
INSERT INTO Shipment (shipment_id, shipping_company, delivery_time, order_id)
VALUES (seq_shipment.nextval, 'Rapid Dispatch', DATE '2023-06-22' , 8);
INSERT INTO Shipment (shipment_id, shipping_company, delivery_time, order_id)
VALUES (seq_shipment.nextval, 'Speedy Delivery', DATE '2023-06-23' , 9);
INSERT INTO Shipment (shipment_id, shipping_company, delivery_time, order_id)
VALUES (seq_shipment.nextval, 'Prime Movers', DATE '2023-06-24' , 10);







