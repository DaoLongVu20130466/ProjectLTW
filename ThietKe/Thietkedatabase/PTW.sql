SET DATEFORMAT dmy;  
CREATE TABLE ACCOUNT (
	ID_ACCOUNT CHAR(10) ,
	USERS VARCHAR(100) ,
	PASS TEXT,
	ID_USER CHAR(10),
	STATUSS VARCHAR(50),
	IS_BLOCK BIT,
	EMAIL CHAR(50),
	AVATAR CHAR(300),
	PRIMARY KEY(ID_ACCOUNT, ID_USER)
)
CREATE TABLE USER_INFORMATION(
	ID_USER CHAR(10) PRIMARY KEY,
	USER_NAMES VARCHAR(100),
	PHONE_NUMBER CHAR(10),
	ID_ADDRESS CHAR(10),
)
CREATE TABLE ADDRESSS (
	ID_ADDRESS CHAR(10) PRIMARY KEY,
	COMMUNE VARCHAR(50),
	DISTRICT VARCHAR(50),
	PROVINCE VARCHAR(50),
	ADDRESS_DETAILS VARCHAR(50),
)
CREATE TABLE VOUCHER_LIST(
	ID CHAR(10) PRIMARY KEY,
	ID_VOUCHER CHAR(10),
	START_DAY DATE,
	FINISH_DAY DATE,
	VOUCHER_NAME VARCHAR(50),
)
CREATE TABLE VOUCHER(
	ID_VOUCHER CHAR(10) PRIMARY KEY,
	CODE_VOUCHER CHAR(13),
	TYPE_VOUCHER VARCHAR(20),
	VALUESS INT,
	NAMES VARCHAR(20),
)
CREATE TABLE FAVOURITE(
	ID_FOOD CHAR(10) ,
	ID_ACCOUNT CHAR(10),
	PRIMARY KEY(ID_FOOD, ID_ACCOUNT),
)
CREATE TABLE ORDER_ACCOUNT_DETAILS(
	ID_ACCOUNT CHAR(10),
	ID_ORDER CHAR(10),
	PRIMARY KEY(ID_ACCOUNT, ID_ORDER)
)
CREATE TABLE ORDERS (
	ID_ORDER CHAR(10) PRIMARY KEY,
	ORDER_DATE DATE,
	PHONE_NUMBER CHAR(10),
	NAMES VARCHAR(30),
	NOTE VARCHAR(35),
	ID_VOUCHER CHAR(10),
	ID_ADDRESS CHAR(10),
)

CREATE TABLE ORDER_DETAILS(
	ID_ORDER CHAR(10) PRIMARY KEY,
	ID_FOOD CHAR(10),
	PRICE INT,
	QUANTITY INT,
	DELIVERY_CHARGES INT,
	STATUSS VARCHAR(30),
)
CREATE TABLE FOOD(
	ID_FOOD CHAR(10) ,
	FOOD_NAME VARCHAR(50),
	ID_SIZE CHAR(10),
	LISTED_PRICE INT,
	TYPE_FOOD VARCHAR(30),
	QUANTITY INT,
	STATUSS VARCHAR(30),
	IS_COMBO BIT,
	ID_SALE CHAR(10),
	DESCRIBE TEXT,
	PRIMARY KEY( ID_FOOD, ID_SIZE),
)
CREATE TABLE TYPE_FOOD(
	ID_FOOD CHAR(10) PRIMARY KEY,
	TYPE_NAMES VARCHAR(15),
)
CREATE TABLE SALE_DETAIL(
	ID_SALE CHAR(10) PRIMARY KEY,
	TYPE_SALE VARCHAR(30),
	VALUESS INT,
)
CREATE TABLE ROLE_FOOD(
	ID_STATUS CHAR(10) PRIMARY KEY,
	TYPE_R VARCHAR(30),
)
CREATE TABLE SIZE_DETAILS(
	ID_FOOD CHAR(10) PRIMARY KEY,
	MONNEY INT,
	ID_SIZE CHAR(10),
)
CREATE TABLE SIZE(
	ID_SIZE CHAR(10) PRIMARY KEY,
	TYPE_SIZE VARCHAR(10),
)
CREATE TABLE ASSESSMENT(
	ID_ASSESSMENT  CHAR(10) PRIMARY KEY,
	CONTENT TEXT,
	TYPE_EVALUATE VARCHAR(30),
	ID_FOOD CHAR(10),
)
CREATE TABLE ASSESSMENT_DETAIL(
	ID_ASSESSMENT CHAR(10),
	ID_ACCOUNT CHAR(10),
	ASSESSMENT_TIME  DATE,
)
/*--------------------FOOD-------------------- */
/*--------------------FOOD-------------------- */
INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA1','Cơm gà A Quảng','SIZE1',60000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE1','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA2','Cơm gà da giòn','SIZE1',60000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE1','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA3','Cơm gà Đệ Nhất','SIZE1',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA4','Cơm gà rán','SIZE1',60000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE1','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA5','Cơm gà mắm tỏi','SIZE1',60000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE1','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA6','Cơm gà ngon','SIZE1',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA7','Cơm gà nương tiêu xanh','SIZE1',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA8','Cơm gà xói mỡ','SIZE1',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA9','Cơm gà xói mỡ Ông địa','SIZE1',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA10','Cơm gà xối mỡ T99','SIZE1',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA11','Cơm gà xối mỡ TC','SIZE1',48000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA12','Cơm gà chiên nước mắm','SIZE1',47000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');
/*****************************************/
/*--------------------FOOD-------------------- */
INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA1','Cơm gà A Quảng','SIZE2',60000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE1','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA2','Cơm gà da giòn','SIZE2',60000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE1','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA3','Cơm gà Đệ Nhất','SIZE2',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA4','Cơm gà rán','SIZE2',60000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE1','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA5','Cơm gà mắm tỏi','SIZE2',60000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE1','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA6','Cơm gà ngon','SIZE2',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA7','Cơm gà nương tiêu xanh','SIZE2',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA8','Cơm gà xói mỡ','SIZE2',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA9','Cơm gà xói mỡ Ông địa','SIZE2',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA10','Cơm gà xối mỡ T99','SIZE2',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA11','Cơm gà xối mỡ TC','SIZE2',48000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE, DESCRIBE) 
VALUES ('COM_GA12','Cơm gà chiên nước mắm','SIZE2',47000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền');
/*****************************************/

/*   SALE*/
INSERT INTO SALE_DETAIL(ID_SALE, TYPE_SALE,VALUESS) VALUES ('SALE1','GIAMGIA',20);
INSERT INTO SALE_DETAIL(ID_SALE, TYPE_SALE,VALUESS) VALUES ('SALE2','KHONGGIA',0);

/* SIZE*/
INSERT INTO SIZE(ID_SIZE,TYPE_SIZE) VALUES('SALE1', 'THƯỜNG');
INSERT INTO SIZE(ID_SIZE,TYPE_SIZE) VALUES('SALE2', 'ĐẶC BIỆT');

/* SALE DETAIL */
INSERT INTO SIZE_DETAILS(ID_FOOD,ID_SIZE,MONNEY) VALUES ('COM_GA1','NULL',15000);

/*ACCCOUNT */
INSERT INTO ACCOUNT(ID_ACCOUNT,USERS,PASS,ID_USER,STATUSS,IS_BLOCK,EMAIL,AVATAR) VALUES
('ACC1','THOAIHUU','123456','USER1','HOẠT ĐỘNG',0,'NOBAE@GMAIL.COM','IMG/ANH.JPG');

/* USER_INFORMATION*/
INSERT INTO USER_INFORMATION(ID_USER,USER_NAMES, PHONE_NUMBER,ID_ADDRESS) VALUES 
('USER1','THOẠI ĐẸP TRAI','033775682','ADD1');

/*ADDRES*/
INSERT INTO ADDRESSS(ID_ADDRESS, COMMUNE,DISTRICT,PROVINCE,ADDRESS_DETAILS) VALUES
('ADD1','CẨM SƠN','MỎ CÀY NAM','BẾN TRE','ẤP 10');
/*VOUCHER_LIST*/
INSERT INTO VOUCHER_LIST(ID,ID_VOUCHER,START_DAY,FINISH_DAY,VOUCHER_NAME) VALUES 
('1','VOUCHER1','18/12/2022','18/1/2023','NOEL VUI VẺ');

/*VOUCHER*/
INSERT INTO VOUCHER(ID_VOUCHER,CODE_VOUCHER,TYPE_VOUCHER,VALUESS,NAMES) VALUES 
('VOUCHER1','NOELVV','%','20','NOEL VUI VẺ');


/*FAVOURITE*/
INSERT INTO FAVOURITE(ID_FOOD, ID_ACCOUNT) VALUES ('COM_GA1','ACC1');
/*ORDER*/
INSERT INTO ORDERS(ID_ORDER,ORDER_DATE,PHONE_NUMBER,NAMES,NOTE,ID_VOUCHER,ID_ADDRESS) VALUES
('OD1','18/12/2022','0337376582','THOẠI ĐẸP TRAI','   ','VOUCHER1','ADD1');
/*ORDER_ACCOUNT_DETAILS*/
INSERT INTO ORDER_ACCOUNT_DETAILS(ID_ACCOUNT,ID_ORDER) VALUES
('ACC1','OD1');

/*ASSESSMENT*/
INSERT INTO ASSESSMENT(ID_ASSESSMENT,CONTENT,TYPE_EVALUATE,ID_FOOD) VALUES
('ASS1','MÓN CƠM NÀY NGON CỰC','TOT','COMGA1');
/*ASSESSMENT_DETAILS*/
INSERT INTO ASSESSMENT_DETAIL(ID_ASSESSMENT,ID_ACCOUNT,ASSESSMENT_TIME) VALUES
('ASS1','ACC1','18/12/2022');