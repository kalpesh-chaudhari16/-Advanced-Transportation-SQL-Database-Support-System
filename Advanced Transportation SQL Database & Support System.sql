create database ola_uber;
use ola_uber;
CREATE TABLE CUSTOMER(
CUSTOMER_ID INT PRIMARY KEY,
NAME VARCHAR(20),
EMAIL VARCHAR(20),
DOB date,
RATING int
);
CREATE TABLE DRIVER(
DRIVER_ID INT PRIMARY KEY,
NAME VARCHAR(20),
EMAIL VARCHAR(20),
DOB date,
RATING int
);
CREATE TABLE PAYMENT_INFO(
PAYMENT_ID INT PRIMARY KEY,
PAYMENT_MODE VARCHAR(20)
);
CREATE TABLE VEHICLE(
VEHICLE_ID INT PRIMARY KEY,
MODEL VARCHAR(20),
CATEGORY VARCHAR(20),
YEAR DATE,
COLOR VARCHAR(20),
KM INT
);
CREATE TABLE COUPONS(
COUPON_ID INT PRIMARY KEY,
TEXT VARCHAR(20) UNIQUE,
VALUE VARCHAR(20),
VALIDITY INT,
START_DATE date
);
CREATE TABLE TRIPS(
TRIP_ID INT UNIQUE,
CUSTOMER_ID INT,
DRIVER_ID INT,
VEHICLE_ID INT,
PAYMENT_ID INT,
FARE INT,
STATUS VARCHAR(20),
DISTANCE INT,
START_LOCATION VARCHAR(20),
END_LOCATION VARCHAR(20),
START_DATE_TIME DATETIME,
END_DATE_TIME DATETIME,
COUPON_ID INT,
PAYMENT_MODE VARCHAR(20),
OTP INT,
primary key (TRIP_ID),
FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER (CUSTOMER_ID),
FOREIGN KEY (DRIVER_ID) REFERENCES DRIVER (DRIVER_ID),
FOREIGN KEY (VEHICLE_ID) REFERENCES VEHICLE (VEHICLE_ID),
FOREIGN KEY (COUPON_ID) REFERENCES COUPONS (COUPON_ID),
FOREIGN KEY (PAYMENT_ID) REFERENCES PAYMENT_INFO (PAYMENT_ID)
);
CREATE TABLE CUSTOMER_ADDRESS(
CUSTOMER_ADDRESS_ID INT UNIQUE NOT NULL,
CUSTOMER_ID INT,
ADDRESS_LINE1 VARCHAR(50),
ADDRESS_LINE2 VARCHAR(50),
ADDRESS_LINE3 VARCHAR(50),
LANDMARK VARCHAR(20),
PINCODE INT,
CITY VARCHAR(20),
STATE ENUM('Andhra Pradesh','Arunachal Pradesh','Assam','Bihar','Chhattisgarh','Goa','Gujarat','Haryana','Himachal Pradesh','Jharkhand','Karnataka','Kerala','Madhya Pradesh',
'Maharashtra','Manipur','Meghalaya','Mizoram','Nagaland','Odisha','Punjab','Rajasthan','Sikkim','Tamil Nadu','Telangana','Tripura','Uttar Pradesh','Uttarakhand','West Bengal',
'Andaman and Nicobar Islands','Chandigarh','Dadra and Nagar Haveli and Daman and Diu','Lakshadweep','Delhi','Puducherry','Jammu and Kashmir','Ladakh'),
PRIMARY KEY (CUSTOMER_ADDRESS_ID),
FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER (CUSTOMER_ID)
);
CREATE TABLE CUSTOMER_CONTACT(
CUSTOMER_CONTACT_ID INT UNIQUE NOT NULL,
CUSTOMER_ID INT,
CONTACT BIGINT,
PRIMARY KEY (CUSTOMER_CONTACT_ID),
FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER (CUSTOMER_ID)
);
CREATE TABLE DRIVER_CONTACT(
DRIVER_CONTACT_ID INT UNIQUE NOT NULL,
DRIVER_ID INT,
CONTACT BIGINT,
PRIMARY KEY (DRIVER_CONTACT_ID),
FOREIGN KEY (DRIVER_ID) REFERENCES DRIVER (DRIVER_ID)
);
CREATE TABLE DRIVER_ADDRESS(
DRIVER_ADDRESS_ID INT UNIQUE NOT NULL,
DRIVER_ID INT,
ADDRESS_LINE1 VARCHAR(50),
ADDRESS_LINE2 VARCHAR(50),
ADDRESS_LINE3 VARCHAR(50),
LANDMARK VARCHAR(20),
PINCODE INT,
CITY VARCHAR(20),
STATE ENUM('Andhra Pradesh','Arunachal Pradesh','Assam','Bihar','Chhattisgarh','Goa','Gujarat','Haryana','Himachal Pradesh','Jharkhand','Karnataka','Kerala','Madhya Pradesh',
'Maharashtra','Manipur','Meghalaya','Mizoram','Nagaland','Odisha','Punjab','Rajasthan','Sikkim','Tamil Nadu','Telangana','Tripura','Uttar Pradesh','Uttarakhand','West Bengal',
'Andaman and Nicobar Islands','Chandigarh','Dadra and Nagar Haveli and Daman and Diu','Lakshadweep','Delhi','Puducherry','Jammu and Kashmir','Ladakh'),
PRIMARY KEY (DRIVER_ADDRESS_ID),
FOREIGN KEY (DRIVER_ID) REFERENCES DRIVER (DRIVER_ID)
);
create table STOPS(
STOPs_ID INT unique not null,
trip_id int unique not null,
ADDRESS_LINE1 VARCHAR(50) Not null,
ADDRESS_LINE2 VARCHAR(50),
ADDRESS_LINE3 VARCHAR(50),
LANDMARK VARCHAR(20),
PINCODE INT,
CITY VARCHAR(20),
STATE ENUM('Andhra Pradesh','Arunachal Pradesh','Assam','Bihar','Chhattisgarh','Goa','Gujarat','Haryana','Himachal Pradesh','Jharkhand','Karnataka','Kerala','Madhya Pradesh',
'Maharashtra','Manipur','Meghalaya','Mizoram','Nagaland','Odisha','Punjab','Rajasthan','Sikkim','Tamil Nadu','Telangana','Tripura','Uttar Pradesh','Uttarakhand','West Bengal',
'Andaman and Nicobar Islands','Chandigarh','Dadra and Nagar Haveli and Daman and Diu','Lakshadweep','Delhi','Puducherry','Jammu and Kashmir','Ladakh'),
primary key (stops_id),
FOREIGN KEY (TRIP_ID) REFERENCES TRIPS(TRIP_ID)
);







    



   

          