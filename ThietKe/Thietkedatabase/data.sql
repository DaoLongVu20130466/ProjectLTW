SET DATEFORMAT dmy;   
CREATE TABLE ACCOUNT (
	ID_ACCOUNT CHAR(10) ,
	USERS VARCHAR(100) ,
	PASS TEXT,
	ID_USER CHAR(10) ,
	STATUSS VARCHAR(50),
	IS_BLOCK BIT,
	EMAIL CHAR(50),
	AVATAR CHAR(25),
	PRIMARY KEY(ID_ACCOUNT, ID_USER),
)
 

CREATE TABLE ADDRESSS (
	ID_ADDRESS CHAR(10) PRIMARY KEY,
	COMMUNE VARCHAR(50),
	DISTRICT VARCHAR(50),
	PROVINCE VARCHAR(50),
	ADDRESS_DETAILS VARCHAR(50)
)
CREATE TABLE VOUCHER_LIST(
	ID CHAR(10) PRIMARY KEY,
	ID_VOUCHER CHAR(10),
	START_DAY DATE,
	FINISH_DAY DATE,
	VOUCHER_NAME VARCHAR(50)
)
CREATE TABLE VOUCHER(
	ID_VOUCHER CHAR(10) PRIMARY KEY,
	CODE_VOUCHER CHAR(13),
	TYPE_VOUCHER VARCHAR(20),
	VALUESS INT,
	NAMES VARCHAR(20)
)
CREATE TABLE FAVOURITE(
	ID_FOOD CHAR(10) ,
	ID_ACCOUNT CHAR(10),
	PRIMARY KEY(ID_FOOD, ID_ACCOUNT)
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
	NAMEUSER CHAR(30),
	NOTE VARCHAR(35),
	ID_VOUCHER CHAR(10),
	ID_ADDRESS CHAR(10)
)

CREATE TABLE ORDER_DETAILS(
	ID_ORDER CHAR(10) PRIMARY KEY,
	ID_FOOD CHAR(10),
	ID_SIZE CHAR(10),
	PRICE INT,
	QUANTITY INT,
	DELIVERY_CHARGES INT,
	STATUSS VARCHAR(30)
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
	IS_HOT CHAR(15),
	DESCRIPTION TEXT,
	L_IMG TEXT,
	PRIMARY KEY( ID_FOOD, ID_SIZE)
)
CREATE TABLE TYPE_FOOD(
	ID_FOOD CHAR(10) PRIMARY KEY,
	TYPE_NAMES VARCHAR(15)
)
CREATE TABLE SALE_DETAIL(
	ID_SALE CHAR(10) PRIMARY KEY,
	TYPE_SALE VARCHAR(30),
	VALUESS INT
)
CREATE TABLE ROLE_FOOD(
	ID_STATUS CHAR(10) PRIMARY KEY,
	TYPE_R VARCHAR(30)
)
CREATE TABLE SIZE_DETAILS(
	ID_FOOD CHAR(10) PRIMARY KEY,
	MONNEY INT,
	ID_SIZE CHAR(10)
)
CREATE TABLE SIZE(
	ID_SIZE CHAR(10) PRIMARY KEY,
	TYPE_SIZE VARCHAR(10)
)
CREATE TABLE ASSESSMENT(
	ID_ASSESSMENT  CHAR(10) PRIMARY KEY,
	CONTENT TEXT,
	TYPE_EVALUATE VARCHAR(30),
	ID_FOOD CHAR(10)
)
CREATE TABLE ASSESSMENT_DETAIL(
	ID_ASSESSMENT CHAR(10),
	ID_ACCOUNT CHAR(10),
	ASSESSMENT_TIME  DATE
)
/*--------------------FOOD-------------------- */
/*--------------------FOOD-------------------- */
INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA1','Cơm gà A Quảng','SIZE1',60000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE1','HOT','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/GiamGia/1comga_aquang-min.jpeg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA2','Cơm gà da giòn','SIZE1',60000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE1','HOT','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/GiamGia/2comga_dagion-min.jpeg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA3','Cơm gà Đệ Nhất','SIZE1',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','NORMAL','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/3comga_denhat-min.jpeg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA4','Cơm gà rán','SIZE1',60000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE1','HOT','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/4comga_garanjpeg-min.jpeg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA5','Cơm gà mắm tỏi','SIZE1',60000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE1','HOT','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/5comga_mamtoi-min.jpeg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA6','Cơm gà ngon','SIZE1',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','NORMAL','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/6comga_ngon-min.jpg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA7','Cơm gà nương tiêu xanh','SIZE1',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','NORMAL','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/7comga_nuongtieuxanh-min.jpg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA8','Cơm gà xói mỡ','SIZE1',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','NORMAL','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/8Comga_xoimo142-min.jpeg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA9','Cơm gà xói mỡ Ông địa','SIZE1',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','NORMAL','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/9comga_xoimoongdia-min.jpg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA10','Cơm gà xối mỡ T99','SIZE1',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','NORMAL','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/10Comga_xoimoT99-min.jpeg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA11','Cơm gà xối mỡ TC','SIZE1',48000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','NORMAL','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/11Comga_xoimoTC-min.jpg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA12','Cơm gà chiên nước mắm','SIZE1',47000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','NORMAL','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/12comga_chiennuocmam-min.jpg');
/*****************************************/
/*--------------------FOOD-------------------- */
INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA1','Cơm gà A Quảng','SIZE2',60000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE1','HOT','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/GiamGia/1comga_aquang-min.jpeg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA2','Cơm gà da giòn','SIZE2',60000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE1','HOT','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/GiamGia/2comga_dagion-min.jpeg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA3','Cơm gà Đệ Nhất','SIZE2',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','NORMAL','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/3comga_denhat-min.jpeg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA4','Cơm gà rán','SIZE2',60000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE1','HOT','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/4comga_garanjpeg-min.jpeg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA5','Cơm gà mắm tỏi','SIZE2',60000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE1','HOT','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/5comga_mamtoi-min.jpeg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA6','Cơm gà ngon','SIZE2',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','NORMAL','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/6comga_ngon-min.jpg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA7','Cơm gà nương tiêu xanh','SIZE2',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','NORMAL','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/7comga_nuongtieuxanh-min.jpg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA8','Cơm gà xói mỡ','SIZE2',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','NORMAL','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/8Comga_xoimo142-min.jpeg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA9','Cơm gà xói mỡ Ông địa','SIZE2',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','NORMAL','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/9comga_xoimoongdia-min.jpg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA10','Cơm gà xối mỡ T99','SIZE2',45000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','NORMAL','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/10Comga_xoimoT99-min.jpeg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA11','Cơm gà xối mỡ TC','SIZE2',48000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','NORMAL','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/11Comga_xoimoTC-min.jpg');

INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG) 
VALUES ('COM_GA12','Cơm gà chiên nước mắm','SIZE2',47000,'CƠM GÀ',50,'CÒN HÀNG',0,'SALE2','NORMAL','Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền 
Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền','img/Data/ComGa/12comga_chiennuocmam-min.jpg');
/*****************************************/

/*   SALE*/
INSERT INTO SALE_DETAIL(ID_SALE, TYPE_SALE,VALUESS) VALUES ('SALE1','GIAMGIA',20);
INSERT INTO SALE_DETAIL(ID_SALE, TYPE_SALE,VALUESS) VALUES ('SALE2','KHONGGIA',0);

/* SIZE*/
INSERT INTO SIZE(ID_SIZE,TYPE_SIZE) VALUES('SIZE1', 'THƯỜNG');
INSERT INTO SIZE(ID_SIZE,TYPE_SIZE) VALUES('SIZE2', 'ĐẶC BIỆT');

/* SIZE DETAIL */
INSERT INTO SIZE_DETAILS(ID_FOOD,ID_SIZE,MONNEY) VALUES ('COM_GA1','NULL',15000);

/*ACCCOUNT */
INSERT INTO ACCOUNT(ID_ACCOUNT,USERS,PASS,ID_USER,STATUSS,IS_BLOCK,EMAIL,AVATAR) VALUES
('ACC1','THOAIHUU','123456','USER1','HOẠT ĐỘNG',0,'NOBAE@GMAIL.COM','IMG/ANH.JPG');
INSERT INTO ACCOUNT(ID_ACCOUNT,USERS,PASS,ID_USER,STATUSS,IS_BLOCK,EMAIL,AVATAR) VALUES
('ACC2','QUANGVU','123456','USER2','HOẠT ĐỘNG',0,'YESBAE@GMAIL.COM','IMG/ANH.JPG');
INSERT INTO ACCOUNT(ID_ACCOUNT,USERS,PASS,ID_USER,STATUSS,IS_BLOCK,EMAIL,AVATAR) VALUES
('ACC3','LONGVU','123456','USER3','HOẠT ĐỘNG',0,'NOBAE2@GMAIL.COM','IMG/ANH.JPG');

/* USER_INFORMATION*/
INSERT INTO USER_INFORMATION(ID_USER,USER_NAMES, PHONE_NUMBER,ID_ADDRESS) VALUES 
('USER1','THOẠI ĐẸP TRAI','033775682','ADD1');
INSERT INTO USER_INFORMATION(ID_USER,USER_NAMES, PHONE_NUMBER,ID_ADDRESS) VALUES 
('USER2','QUANG VU TRAN','0784736553','ADD1');
INSERT INTO USER_INFORMATION(ID_USER,USER_NAMES, PHONE_NUMBER,ID_ADDRESS) VALUES 
('USER3','LONG VU DAO','0736452734','ADD1');

/*ADDRES*/
INSERT INTO ADDRESSS(ID_ADDRESS, COMMUNE,DISTRICT,PROVINCE,ADDRESS_DETAILS) VALUES
('ADD1','CẨM SƠN','MỎ CÀY NAM','BẾN TRE','ẤP 10');
INSERT INTO ADDRESSS(ID_ADDRESS, COMMUNE,DISTRICT,PROVINCE,ADDRESS_DETAILS) VALUES
('ADD2','XXX','XXX','ĐỒNG NAI','ẤP 6');
INSERT INTO ADDRESSS(ID_ADDRESS, COMMUNE,DISTRICT,PROVINCE,ADDRESS_DETAILS) VALUES
('ADD3','XXX','XXX','BÌNH PHƯỚC','ẤP 7');

/*VOUCHER_LIST*/
INSERT INTO VOUCHER_LIST(ID,ID_VOUCHER,START_DAY,FINISH_DAY,VOUCHER_NAME) VALUES 
('1','VOUCHER1','18/12/2022','18/1/2023','NOEL VUI VẺ');
INSERT INTO VOUCHER_LIST(ID,ID_VOUCHER,START_DAY,FINISH_DAY,VOUCHER_NAME) VALUES 
('2','VOUCHER1','18/12/2022','18/1/2023','NOEL VUI VẺ');
INSERT INTO VOUCHER_LIST(ID,ID_VOUCHER,START_DAY,FINISH_DAY,VOUCHER_NAME) VALUES 
('3','VOUCHER1','18/12/2022','18/1/2023','NOEL VUI VẺ');

/*VOUCHER*/
INSERT INTO VOUCHER(ID_VOUCHER,CODE_VOUCHER,TYPE_VOUCHER,VALUESS,NAMES) VALUES 
('VOUCHER1','NOELVV','%','20','NOEL VUI VẺ');


/*FAVOURITE*/
INSERT INTO FAVOURITE(ID_FOOD, ID_ACCOUNT) VALUES ('COM_GA1','ACC1');
/*ORDER*/
INSERT INTO ORDERS(ID_ORDER,ORDER_DATE,PHONE_NUMBER,NAMEUSER,NOTE,ID_VOUCHER,ID_ADDRESS) VALUES
('OD1','18/12/2022','0337376582','THOAI','   ','VOUCHER1','ADD1');
INSERT INTO ORDERS(ID_ORDER,ORDER_DATE,PHONE_NUMBER,NAMEUSER,NOTE,ID_VOUCHER,ID_ADDRESS) VALUES
('OD2','18/12/2022','0337376582','THOAI','   ','VOUCHER1','ADD1');
INSERT INTO ORDERS(ID_ORDER,ORDER_DATE,PHONE_NUMBER,NAMEUSER,NOTE,ID_VOUCHER,ID_ADDRESS) VALUES
('OD3','18/12/2022','0337376582','THOAI','   ','VOUCHER1','ADD1');
/*ORDER_ACCOUNT_DETAILS*/
INSERT INTO ORDER_ACCOUNT_DETAILS(ID_ACCOUNT,ID_ORDER) VALUES
('ACC1','OD1');

/*ASSESSMENT*/
INSERT INTO ASSESSMENT(ID_ASSESSMENT,CONTENT,TYPE_EVALUATE,ID_FOOD) VALUES
('ASS1','MÓN CƠM NÀY NGON CỰC','TOT','COMGA1');
/*ASSESSMENT_DETAILS*/
INSERT INTO ASSESSMENT_DETAIL(ID_ASSESSMENT,ID_ACCOUNT,ASSESSMENT_TIME) VALUES
('ASS1','ACC1','18/12/2022');

/*ORDER_DETAILS*/
INSERT INTO ORDER_DETAILS(ID_ORDER,ID_FOOD,	ID_SIZE,PRICE,QUANTITY,DELIVERY_CHARGES,STATUSS)
VALUES ('OD1','COM_GA4','SIZE1',180000,3,20000,'ĐÃ GIAO');
INSERT INTO ORDER_DETAILS(ID_ORDER,ID_FOOD,	ID_SIZE,PRICE,QUANTITY,DELIVERY_CHARGES,STATUSS)
VALUES ('OD2','COM_GA4','SIZE1',180000,2,20000,'ĐÃ GIAO');
INSERT INTO ORDER_DETAILS(ID_ORDER,ID_FOOD,	ID_SIZE,PRICE,QUANTITY,DELIVERY_CHARGES,STATUSS)
VALUES ('OD3','COM_GA4','SIZE1',180000,3,20000,'ĐÃ GIAO');
