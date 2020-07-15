CREATE DATABASE CASESTUDY_ADV
USE CASESTUDY_ADV
CREATE TABLE DIM_MANUFACTURER (
IDManufacturer INT PRIMARY KEY IDENTITY(11, 1),
Manufacturer_Name VARCHAR (20)
)

CREATE TABLE DIM_MODEL (
IDModel INT PRIMARY KEY IDENTITY(101, 1),
Model_Name VARCHAR(20),
Unit_price MONEY ,
IDManufacturer INT REFERENCES DIM_Manufacturer(IDManufacturer)
)

CREATE TABLE DIM_CUSTOMER (
IDCustomer INT PRIMARY KEY IDENTITY(10001, 1),
Customer_Name VARCHAR(30),
Email VARCHAR (40),
Phone BIGINT
)

CREATE TABLE DIM_LOCATION (
IDLocation INT PRIMARY KEY IDENTITY(2001, 1),
ZipCode INT ,
Country VARCHAR (20),
[State] VARCHAR (20),
City VARCHAR (20)
)

CREATE TABLE DIM_DATE (
[DATE] DATE PRIMARY KEY,
[YEAR] AS YEAR([DATE]),
[QUARTER] AS DATEPART(QUARTER, [DATE]),
[MONTH] AS MONTH([DATE])
)

CREATE TABLE FACT_TRANSACTIONS (
IDModel INT REFERENCES DIM_MODEL(IDModel),
IDCustomer INT REFERENCES DIM_CUSTOMER(IDCustomer),
IDLocation INT REFERENCES DIM_LOCATION(IDLocation),
Date DATE REFERENCES DIM_DATE([DATE]),
TotalPrice MONEY,
Quantity INT,
)


INSERT INTO DIM_Manufacturer VALUES 
('Apple'), ('Samsung'), ('One Plus'), ('Nokia'), ('Motorola'), ('HTC')

INSERT INTO DIM_MODEL VALUES
('iPhone 4', 377, '11'), 
('iPhone 4S', 414, '11'), 
('iPhone 5', 456, '11'), 
('iPhone 6', 501, '11'), 
('iPhone 7', 552, '11'), 
('Thunderbolt', 201, '16'), 
('C139', 121, '15'), 
('C200', 148, '15'), 
('Droid Bionic', 155, '15'), 
('RAZR V3', 81, '15'), 
('Motorola Z', 283, '15'), 
('3210', 14, '14'), 
('5230', 31, '14'), 
('6600', 47, '14'), 
('3310 (3330)', 28, '14'), 
('6010�(6020/6030)', 55, '14'), 
('6230 (6233)', 52, '14'), 
('E1100', 148, '12'), 
('E250', 168, '12'), 
('Galaxy Note II', 216, '12'), 
('Galaxy S', 175, '12'), 
('Galaxy S4', 283, '12'), 
('Galaxy S5', 391, '12'), 
('Galaxy S7', 432, '12'), 
('Galaxy S8', 662, '12'), 
('OnePlus X', 168, '13'), 
('OnePlus 2', 189, '13'), 
('OnePlus 5', 317, '13'), 
('OnePlus 5T', 405, '13'), 
('OnePlus 6T', 495, '13') 

INSERT INTO dim_Customer VALUES
('Kallie Blackwood', 'kallie.blackwood@abc.com', '4159170276'), 
('Johnetta Abdallah', 'johnetta_abdallah@abc.com', '9196014934'), 
('Bobbye Rhym', 'brhym@abc.com', '6505905578'), 
('Micaela Rhymes', 'micaela_rhymes@abc.com', '9251192329'), 
('Tamar Hoogland', 'tamar@abc.com', '7401061857'), 
('Moon Parlato', 'moon@abc.com', '5859253831'), 
('Laurel Reitler', 'laurel_reitler@abc.com', '4108683483'), 
('Delisa Crupi', 'delisa.crupi@abc.com', '9737571204'), 
('Viva Toelkes', 'viva.toelkes@abc.com', '7736528556'), 
('Elza Lipke', 'elza@abc.com', '9733365344'), 
('Devorah Chickering', 'devorah@abc.com', '5056458855'), 
('Timothy Mulqueen', 'timothy_mulqueen@abc.org', '7186066652'), 
('Arlette Honeywell', 'ahoneywell@abc.com', '9047469448'), 
('Dominque Dickerson', 'dominque.dickerson@abc.org', '5103067375'), 
('Lettie Isenhower', 'lettie_isenhower@abc.com', '2167709766'), 
('Myra Munns', 'mmunns@abc.net', '8174448751'), 
('Stephaine Barfield', 'stephaine@abc.com', '3108962764'), 
('Lai Gato', 'lai.gato@abc.org', '8479778728'), 
('Stephen Emigh', 'stephen_emigh@abc.com', '3305530535'), 
('Tyra Shields', 'tshields@abc.com', '2153025164'), 
('Tammara Wardrip', 'twardrip@abc.net', '6505352193'), 
('Cory Gibes', 'cory.gibes@abc.com', '6268825109'), 
('Danica Bruschke', 'danica_bruschke@abc.com', '2548757856'), 
('Wilda Giguere', 'wilda@abc.net', '9076724553'), 
('Elvera Benimadho', 'elvera.benimadho@abc.net', '4088708850'), 
('Carma Vanheusen', 'carma@abc.net', '5106621716'), 
('Malinda Hochard', 'malinda.hochard@abc.com', '3177685506'), 
('Natalie Fern', 'natalie.fern@abc.com', '3078620871'), 
('Lisha Centini', 'lisha@abc.org', '7035377393'), 
('Arlene Klusman', 'arlene_klusman@abc.com', '5043316584'), 
('Alease Buemi', 'alease@abc.com', '3034327494'), 
('Louisa Cronauer', 'louisa@abc.com', '5106921704'), 
('Angella Cetta', 'angella.cetta@abc.com', '8084650794'), 
('Cyndy Goldammer', 'cgoldammer@abc.net', '9527376940'), 
('Rosio Cork', 'rosio.cork@abc.com', '3363288565'), 
('Celeste Korando', 'ckorando@abc.com', '5167712234'), 
('Twana Felger', 'twana.felger@abc.org', '5037481315'), 
('Estrella Samu', 'estrella@abc.com', '6086058719'), 
('Donte Kines', 'dkines@abc.com', '5086044857'), 
('Tiffiny Steffensmeier', 'tiffiny_steffensmeier@abc.net', '3059857969'), 
('Edna Miceli', 'emiceli@abc.org', '8148087265'), 
('Sue Kownacki', 'sue@abc.com', '9727745341'), 
('Jesusa Shin', 'jshin@abc.com', '9315838870'), 
('Rolland Francescon', 'rolland@abc.net', '9735816292'), 
('Pamella Schmierer', 'pamella.schmierer@abc.org', '3055164897'), 
('Glory Kulzer', 'gkulzer@abc.org', '4108235946'), 
('Shawna Palaspas', 'shawna_palaspas@abc.org', '8051098356'), 
('Brandon Callaro', 'brandon_callaro@abc.com', '8088254683'), 
('Scarlet Cartan', 'scarlet.cartan@abc.com', '2292374337'), 
('Oretha Menter', 'oretha_menter@abc.com', '6172307504')

INSERT INTO DIM_LOCATION VALUES
(85086, 'US', 'Arizona', 'Anthem'), (85117, 'US', 'Arizona', 'Apache Jct'), 
(94005, 'US', 'California', 'Brisbane'), (92703, 'US', 'California', 'Bristol'), 
(21163, 'US', 'Maryland', 'Woodstock'), (21648, 'US', 'Maryland', 'Woolford'), 
(122002, 'India', 'Haryana', 'Gurgaon'), (530068, 'India', 'Karnataka', 'Bangalore'), 
(110004, 'India', 'Delhi', 'Delhi'), (400006, 'India', 'Maharashtra', 'Mumbai')

INSERT INTO DIM_DATE VALUES
('02/15/2005'), ('10/23/2005'), ('02/26/2003'), ('05/25/2009'), ('04/16/2003'), ('11/03/2003'), 
('01/01/2010'), ('04/21/2007'), ('10/19/2010'), ('10/03/2010'), ('10/13/2010'), ('05/20/2003'), 
('02/04/2004'), ('10/22/2010'), ('03/23/2005'), ('02/11/2005'), ('10/08/2008'), ('10/06/2008'), 
('05/14/2006'), ('04/22/2010'), ('12/12/2005'), ('03/27/2010'), ('03/07/2007'), ('04/17/2006'), 
('10/01/2005'), ('09/18/2010'), ('10/06/2004'), ('03/27/2009'), ('07/09/2010'), ('05/04/2010'), 
('04/22/2004'), ('09/21/2005'), ('01/08/2008'), ('02/15/2009'), ('03/14/2007'), ('11/09/2009'), 
('02/21/2010'), ('10/04/2009'), ('07/05/2003'), ('01/04/2005'), ('08/04/2008'), ('08/02/2010'), 
('07/26/2009'), ('02/18/2006'), ('02/21/2009'), ('03/10/2004'), ('01/20/2007'), ('07/22/2006'), 
('05/19/2009'), ('04/14/2008'), ('08/09/2008'), ('07/18/2007'), ('03/26/2007'), ('08/06/2006'), 
('02/11/2003'), ('01/06/2005'), ('01/10/2006'), ('07/10/2004'), ('01/15/2004'), ('01/09/2005'), 
('07/25/2007'), ('04/21/2003'), ('05/19/2010'), ('02/15/2004'), ('06/04/2009'), ('08/12/2005'), 
('04/09/2010'), ('04/11/2008'), ('09/18/2003'), ('06/28/2005'), ('11/28/2003'), ('02/04/2010'), 
('09/04/2004'), ('05/05/2007'), ('05/07/2010'), ('07/16/2008'), ('02/05/2007'), ('10/20/2006'), 
('03/07/2008'), ('02/09/2005'), ('01/27/2007'), ('06/12/2006'), ('10/03/2008'), ('02/12/2005'), 
('05/15/2009'), ('08/27/2003'), ('10/19/2008'), ('02/26/2005'), ('09/05/2006'), ('04/03/2004'), 
('06/20/2004'), ('03/05/2008'), ('04/19/2008'), ('10/11/2007'), ('05/18/2010'), ('05/08/2007'), 
('02/08/2004'), ('04/27/2007'), ('09/03/2006'), ('03/19/2009'), ('11/01/2008'), ('08/01/2008'), 
('04/27/2006'), ('04/05/2005'), ('02/10/2009'), ('07/14/2006'), ('07/16/2005'), ('09/17/2006'), 
('04/02/2004'), ('10/24/2005'), ('05/18/2005'), ('05/25/2003'), ('03/09/2010'), ('02/18/2004'), 
('10/03/2006'), ('06/05/2003'), ('09/03/2007'), ('11/06/2007'), ('02/09/2006'), ('11/03/2006'), 
('07/23/2008'), ('06/24/2010'), ('11/13/2006'), ('08/18/2008'), ('05/06/2005'), ('12/21/2004'), 
('10/06/2006'), ('04/19/2009'), ('11/18/2004'), ('08/03/2006'), ('11/19/2005'), ('07/23/2010'), 
('01/21/2005'), ('09/13/2005'), ('06/22/2010'), ('06/02/2010'), ('10/13/2006'), ('08/01/2007'), 
('09/07/2006'), ('03/28/2009'), ('05/18/2007'), ('05/04/2005'), ('07/23/2004'), ('03/27/2007'),
('05/27/2006'), ('08/14/2010'), ('09/23/2010'), ('12/15/2006'), ('10/21/2004'), ('08/15/2003'), 
('08/19/2009'), ('01/16/2008'), ('09/24/2009'), ('07/17/2006'), ('01/27/2005'), ('10/08/2005'), 
('03/05/2007'), ('12/13/2006'), ('11/15/2007'), ('05/24/2003'), ('07/22/2008'), ('06/16/2003'), 
('01/03/2007'), ('01/05/2004'), ('12/28/2009'), ('01/24/2004'), ('02/26/2010'), ('02/03/2007'), 
('02/02/2008'), ('02/22/2005'), ('12/18/2004'), ('08/25/2003'), ('04/06/2007'), ('05/21/2003'), 
('06/23/2009'), ('05/25/2010'), ('09/27/2006'), ('02/17/2007'), ('08/08/2007'), ('11/18/2008'), 
('07/17/2007'), ('07/27/2009'), ('12/13/2007'), ('12/08/2004'), ('04/13/2004'), ('12/19/2008'), 
('06/14/2008'), ('11/06/2009'), ('06/01/2005'), ('05/05/2009'), ('07/03/2009'), ('12/20/2007'), 
('04/28/2007'), ('03/09/2003'), ('07/18/2008'), ('01/22/2005'), ('07/01/2009'), ('08/18/2004'), 
('02/09/2004'), ('08/25/2004'), ('04/25/2010'), ('04/05/2007'), ('02/07/2003'), ('11/15/2010'), 
('09/28/2007'), ('02/03/2009'), ('06/03/2008'), ('03/02/2008'), ('12/19/2003'), ('12/13/2005'), 
('06/16/2008'), ('08/03/2003'), ('07/26/2005'), ('10/11/2010'), ('10/20/2007'), ('12/22/2007'), 
('01/27/2008'), ('05/07/2008'), ('01/25/2007'), ('07/28/2006'), ('02/16/2004'), ('12/12/2006'), 
('07/10/2003'), ('09/14/2009'), ('09/02/2010'), ('07/13/2008'), ('02/25/2007'), ('02/21/2007'), 
('01/27/2004'), ('01/14/2005'), ('04/24/2006'), ('02/08/2005'), ('09/11/2009'), ('09/04/2008'), 
('12/03/2008'), ('05/10/2010'), ('01/12/2009'), ('06/21/2008'), ('01/10/2009'), ('08/05/2008'), 
('11/24/2003'), ('05/12/2008'), ('01/21/2010'), ('08/26/2004'), ('09/11/2004'), ('05/14/2008'), 
('09/01/2003'), ('02/03/2006'), ('12/27/2008'), ('09/08/2010'), ('03/02/2007'), ('04/21/2008'), 
('02/10/2007'), ('03/02/2010'), ('02/11/2009'), ('01/12/2010'), ('12/15/2005'), ('03/15/2010'), 
('08/13/2008'), ('05/17/2006'), ('07/06/2009'), ('08/26/2010'), ('12/02/2009'), ('02/10/2004'), 
('03/16/2006'), ('03/20/2008'), ('11/22/2007'), ('01/07/2010'), ('06/13/2006'), ('05/05/2005'), 
('04/27/2009'), ('11/16/2007'), ('04/06/2006'), ('10/23/2004'), ('10/26/2003'), ('06/19/2005'), 
('01/02/2004'), ('03/17/2003'), ('05/19/2007'), ('05/28/2003'), ('03/01/2005'), ('07/01/2006'), 
('08/26/2003'), ('06/13/2003'), ('02/06/2008'), ('02/23/2007')

INSERT INTO FACT_TRANSACTIONS VALUES
(114, 10015, 2001, '02/15/2005', 52, 1), 
(110, 10027, 2003, '10/23/2005', 84, 1), 
(110, 10038, 2004, '02/26/2003', 170, 2), 
(130, 10044, 2001, '05/25/2009', 500, 1), 
(107, 10043, 2001, '04/16/2003', 126, 1), 
(126, 10022, 2005, '11/03/2003', 169, 1), 
(111, 10045, 2003, '01/01/2010', 286, 1), 
(118, 10012, 2010, '04/21/2007', 149, 1), 
(128, 10044, 2005, '10/19/2010', 318, 1), 
(124, 10003, 2009, '10/03/2010', 435, 1), 
(117, 10002, 2003, '10/13/2010', 54, 1), 
(112, 10049, 2008, '05/20/2003', 18, 1), 
(129, 10041, 2006, '02/04/2004', 409, 1), 
(126, 10048, 2004, '10/22/2010', 173, 1), 
(112, 10024, 2010, '03/23/2005', 17, 1), 
(101, 10018, 2006, '02/11/2005', 381, 1), 
(107, 10018, 2010, '10/08/2008', 122, 1), 
(113, 10014, 2005, '10/06/2008', 33, 1), 
(112, 10009, 2006, '05/14/2006', 18, 1), 
(123, 10017, 2007, '04/22/2010', 393, 1), 
(106, 10041, 2009, '12/12/2005', 203, 1), 
(103, 10027, 2006, '03/27/2010', 457, 1), 
(104, 10033, 2004, '03/07/2007', 505, 1), 
(114, 10023, 2007, '04/17/2006', 52, 1), 
(118, 10049, 2001, '10/01/2005', 153, 1), 
(115, 10048, 2001, '09/18/2010', 32, 1), 
(106, 10008, 2006, '10/06/2004', 205, 1), 
(121, 10008, 2003, '03/27/2009', 179, 1), 
(109, 10041, 2008, '07/09/2010', 314, 2), 
(108, 10027, 2004, '05/04/2010', 153, 1), 
(127, 10034, 2009, '04/22/2004', 190, 1), 
(119, 10016, 2002, '09/21/2005', 173, 1), 
(126, 10025, 2009, '01/08/2008', 173, 1), 
(123, 10027, 2006, '02/15/2009', 394, 1), 
(112, 10045, 2001, '03/14/2007', 17, 1), 
(129, 10050, 2002, '11/09/2009', 406, 1), 
(118, 10006, 2003, '02/21/2010', 300, 2), 
(101, 10023, 2008, '10/04/2009', 760, 2), 
(122, 10025, 2005, '07/05/2003', 858, 3), 
(115, 10029, 2001, '01/04/2005', 32, 1), 
(117, 10048, 2005, '08/04/2008', 57, 1), 
(107, 10045, 2004, '08/02/2010', 125, 1), 
(113, 10038, 2008, '05/14/2006', 33, 1), 
(107, 10034, 2005, '07/26/2009', 366, 3), 
(102, 10030, 2008, '02/18/2006', 415, 1), 
(101, 10019, 2001, '02/21/2009', 380, 1), 
(103, 10036, 2009, '03/10/2004', 461, 1), 
(112, 10025, 2006, '01/20/2007', 16, 1), 
(105, 10047, 2009, '07/22/2006', 556, 1), 
(107, 10027, 2009, '05/19/2009', 125, 1), 
(109, 10039, 2005, '04/14/2008', 157, 3), 
(119, 10048, 2008, '08/09/2008', 170, 1), 
(124, 10024, 2008, '07/18/2007', 435, 1), 
(110, 10009, 2001, '03/26/2007', 82, 1), 
(122, 10026, 2008, '08/06/2006', 285, 1), 
(126, 10033, 2009, '02/11/2003', 170, 1), 
(104, 10013, 2004, '01/06/2005', 505, 1), 
(109, 10047, 2008, '01/10/2006', 159, 1), 
(118, 10009, 2002, '07/10/2004', 151, 1), 
(122, 10042, 2001, '01/15/2004', 286, 1), 
(110, 10025, 2005, '01/09/2005', 85, 1), 
(123, 10047, 2009, '07/25/2007', 394, 1), 
(118, 10022, 2007, '04/21/2003', 153, 1), 
(101, 10023, 2009, '05/19/2010', 382, 1), 
(104, 10002, 2008, '02/15/2004', 503, 1), 
(122, 10011, 2002, '06/04/2009', 286, 1), 
(115, 10036, 2009, '08/12/2005', 31, 1), 
(111, 10029, 2003, '04/09/2010', 284, 1), 
(115, 10046, 2008, '04/11/2008', 29, 1), 
(126, 10041, 2001, '09/18/2003', 172, 1), 
(104, 10041, 2006, '06/28/2005', 505, 1), 
(101, 10022, 2009, '11/28/2003', 380, 1), 
(114, 10028, 2004, '02/04/2010', 49, 1), 
(104, 10004, 2002, '09/04/2004', 504, 1), 
(129, 10043, 2006, '05/05/2007', 406, 1), 
(106, 10012, 2006, '05/07/2010', 202, 1), 
(111, 10034, 2009, '07/16/2008', 287, 1), 
(108, 10024, 2007, '02/05/2007', 151, 1), 
(123, 10007, 2009, '10/20/2006', 392, 1), 
(108, 10015, 2006, '03/07/2008', 150, 1), 
(106, 10022, 2004, '02/09/2005', 202, 1), 
(124, 10021, 2005, '01/27/2007', 434, 1), 
(105, 10036, 2001, '06/12/2006', 553, 1), 
(104, 10027, 2006, '10/03/2008', 503, 1), 
(105, 10039, 2007, '02/12/2005', 553, 1), 
(107, 10003, 2006, '05/15/2009', 122, 1), 
(105, 10037, 2007, '08/27/2003', 554, 1), 
(104, 10045, 2005, '10/19/2008', 505, 1), 
(124, 10045, 2006, '02/26/2005', 435, 1), 
(109, 10028, 2009, '09/05/2006', 157, 1), 
(125, 10030, 2009, '04/03/2004', 665, 1), 
(112, 10027, 2010, '06/20/2004', 18, 1), 
(109, 10045, 2005, '03/05/2008', 160, 1), 
(127, 10030, 2004, '04/19/2008', 194, 1), 
(124, 10034, 2009, '10/11/2007', 434, 1), 
(122, 10023, 2002, '05/18/2010', 288, 1), 
(112, 10013, 2007, '05/08/2007', 19, 1), 
(128, 10039, 2009, '02/08/2004', 319, 1), 
(119, 10015, 2007, '04/27/2007', 169, 1), 
(126, 10042, 2001, '09/03/2006', 173, 1), 
(120, 10025, 2001, '03/19/2009', 221, 1), 
(104, 10017, 2006, '11/01/2008', 502, 1), 
(130, 10049, 2005, '08/01/2008', 496, 1), 
(110, 10050, 2008, '04/27/2006', 83, 1), 
(130, 10042, 2010, '04/05/2005', 500, 1), 
(116, 10029, 2003, '02/10/2009', 58, 1), 
(109, 10038, 2003, '07/14/2006', 157, 1), 
(110, 10028, 2002, '07/16/2005', 86, 1), 
(115, 10013, 2006, '09/17/2006', 33, 1), 
(128, 10013, 2003, '04/02/2004', 322, 1), 
(101, 10039, 2001, '10/24/2005', 378, 1), 
(110, 10021, 2006, '05/18/2005', 84, 1), 
(115, 10005, 2004, '05/25/2003', 33, 1), 
(121, 10029, 2008, '03/09/2010', 179, 1), 
(103, 10045, 2009, '02/18/2004', 458, 1), 
(102, 10019, 2007, '10/03/2006', 417, 1), 
(130, 10008, 2003, '06/05/2003', 498, 1), 
(108, 10037, 2009, '09/03/2007', 150, 1), 
(111, 10005, 2007, '11/06/2007', 286, 1), 
(114, 10040, 2004, '02/09/2006', 52, 1), 
(108, 10036, 2001, '11/03/2006', 149, 1), 
(111, 10042, 2001, '07/23/2008', 285, 1), 
(123, 10043, 2009, '06/24/2010', 395, 1), 
(112, 10040, 2003, '11/13/2006', 32, 2), 
(105, 10034, 2004, '08/18/2008', 553, 1), 
(114, 10021, 2009, '05/06/2005', 96, 2), 
(123, 10033, 2006, '12/21/2004', 395, 1), 
(105, 10003, 2008, '10/06/2006', 553, 1), 
(128, 10020, 2008, '04/19/2009', 319, 1), 
(130, 10006, 2004, '11/18/2004', 498, 1), 
(114, 10029, 2003, '08/03/2006', 96, 2), 
(129, 10040, 2008, '11/19/2005', 407, 1), 
(108, 10006, 2007, '07/23/2010', 153, 1), 
(110, 10001, 2001, '01/21/2005', 84, 1), 
(102, 10048, 2002, '09/13/2005', 416, 1), 
(106, 10029, 2004, '06/22/2010', 202, 1), 
(105, 10022, 2002, '06/02/2010', 557, 1), 
(116, 10007, 2006, '10/13/2006', 60, 1), 
(111, 10007, 2010, '08/01/2007', 288, 1), 
(129, 10001, 2003, '09/07/2006', 406, 1), 
(101, 10047, 2009, '03/28/2009', 760, 2), 
(122, 10046, 2007, '09/03/2007', 287, 1), 
(120, 10033, 2009, '05/18/2007', 217, 1), 
(128, 10003, 2007, '05/04/2005', 319, 1), 
(117, 10014, 2002, '07/23/2004', 56, 1), 
(124, 10013, 2002, '05/27/2006', 433, 1), 
(109, 10029, 2002, '08/14/2010', 156, 1), 
(122, 10042, 2007, '09/23/2010', 286, 1), 
(105, 10027, 2005, '09/18/2010', 556, 1), 
(103, 10012, 2006, '12/15/2006', 458, 1), 
(116, 10041, 2001, '10/21/2004', 58, 1), 
(129, 10007, 2005, '08/15/2003', 410, 1), 
(101, 10036, 2003, '08/19/2009', 1140, 3), 
(101, 10009, 2005, '07/14/2006', 382, 1), 
(113, 10039, 2007, '01/16/2008', 36, 1), 
(112, 10017, 2008, '09/24/2009', 19, 1), 
(130, 10012, 2002, '07/17/2006', 992, 2), 
(105, 10042, 2003, '01/27/2005', 1108, 2), 
(118, 10007, 2005, '10/08/2005', 149, 1), 
(121, 10013, 2006, '03/05/2007', 178, 1), 
(129, 10044, 2010, '12/13/2006', 408, 1), 
(106, 10024, 2004, '11/15/2007', 204, 1), 
(126, 10036, 2009, '05/24/2003', 172, 1), 
(123, 10012, 2001, '07/22/2008', 392, 1), 
(114, 10010, 2004, '06/16/2003', 52, 1), 
(128, 10044, 2003, '01/03/2007', 321, 1), 
(102, 10001, 2004, '01/05/2004', 419, 1), 
(107, 10041, 2005, '12/28/2009', 372, 3), 
(129, 10027, 2009, '01/24/2004', 406, 1), 
(108, 10002, 2010, '02/26/2010', 151, 1), 
(106, 10048, 2004, '02/03/2007', 203, 1), 
(105, 10026, 2001, '02/02/2008', 556, 1), 
(108, 10040, 2003, '02/22/2005', 149, 1), 
(118, 10008, 2010, '12/18/2004', 151, 1), 
(121, 10038, 2005, '08/25/2003', 180, 1), 
(111, 10012, 2005, '04/06/2007', 287, 1), 
(104, 10038, 2010, '05/21/2003', 502, 1), 
(126, 10037, 2006, '06/23/2009', 170, 1), 
(103, 10042, 2007, '05/25/2010', 458, 1), 
(104, 10036, 2006, '09/27/2006', 503, 1), 
(123, 10002, 2004, '02/17/2007', 396, 1), 
(103, 10014, 2003, '08/08/2007', 920, 2), 
(111, 10038, 2008, '11/18/2008', 284, 1), 
(126, 10019, 2002, '07/17/2007', 172, 1), 
(101, 10001, 2006, '07/27/2009', 381, 1), 
(115, 10013, 2002, '12/13/2007', 33, 1), 
(101, 10001, 2007, '05/14/2006', 760, 2), 
(120, 10015, 2001, '12/08/2004', 219, 1), 
(105, 10037, 2009, '04/13/2004', 557, 1), 
(105, 10041, 2008, '12/19/2008', 553, 1), 
(130, 10014, 2002, '06/14/2008', 499, 1), 
(101, 10048, 2007, '11/06/2009', 380, 1), 
(106, 10008, 2008, '06/01/2005', 404, 2), 
(109, 10021, 2006, '05/05/2009', 160, 1), 
(113, 10048, 2003, '09/07/2006', 32, 1), 
(101, 10034, 2009, '07/03/2009', 382, 1), 
(114, 10009, 2003, '12/20/2007', 52, 1), 
(126, 10044, 2009, '04/28/2007', 170, 1), 
(111, 10019, 2006, '03/09/2003', 286, 1), 
(120, 10045, 2002, '07/18/2008', 221, 1), 
(102, 10009, 2008, '01/22/2005', 830, 2), 
(101, 10006, 2010, '07/01/2009', 1524, 4), 
(106, 10017, 2008, '08/18/2004', 206, 1), 
(104, 10025, 2010, '02/09/2004', 505, 1), 
(104, 10022, 2001, '08/25/2004', 503, 1), 
(123, 10036, 2002, '04/25/2010', 396, 1), 
(129, 10049, 2001, '04/05/2007', 406, 1), 
(113, 10009, 2008, '02/07/2003', 35, 1), 
(125, 10009, 2010, '11/15/2010', 665, 1), 
(129, 10019, 2010, '09/28/2007', 409, 1), 
(107, 10006, 2006, '02/03/2009', 123, 1), 
(121, 10002, 2009, '06/03/2008', 180, 1), 
(110, 10014, 2006, '03/02/2008', 82, 1), 
(123, 10036, 2006, '12/19/2003', 394, 1), 
(130, 10032, 2010, '12/13/2005', 499, 1), 
(122, 10023, 2001, '06/16/2008', 288, 1), 
(127, 10037, 2004, '08/03/2003', 194, 1), 
(107, 10038, 2004, '07/26/2005', 122, 1), 
(126, 10033, 2004, '10/11/2010', 173, 1), 
(121, 10033, 2006, '10/20/2007', 178, 1), 
(124, 10031, 2010, '12/22/2007', 436, 1), 
(116, 10034, 2009, '01/27/2008', 60, 1), 
(104, 10045, 2009, '05/07/2008', 503, 1), 
(118, 10039, 2001, '01/25/2007', 151, 1), 
(122, 10010, 2002, '07/28/2006', 285, 1), 
(112, 10006, 2002, '02/16/2004', 15, 1), 
(120, 10012, 2010, '12/12/2006', 218, 1), 
(113, 10010, 2005, '07/10/2003', 32, 1), 
(101, 10007, 2004, '09/14/2009', 1528, 4), 
(113, 10007, 2007, '09/02/2010', 35, 1), 
(104, 10013, 2006, '07/13/2008', 502, 1), 
(108, 10018, 2001, '02/25/2007', 150, 1), 
(108, 10028, 2001, '02/21/2007', 152, 1), 
(111, 10019, 2004, '01/27/2004', 284, 1), 
(115, 10041, 2002, '01/14/2005', 32, 1), 
(115, 10048, 2002, '04/24/2006', 30, 1), 
(118, 10042, 2010, '02/08/2005', 149, 1), 
(125, 10036, 2008, '09/11/2009', 663, 1), 
(113, 10013, 2009, '01/06/2005', 33, 1), 
(101, 10047, 2004, '09/04/2008', 381, 1), 
(101, 10035, 2006, '09/11/2004', 379, 1), 
(121, 10002, 2005, '09/27/2006', 179, 1), 
(129, 10014, 2008, '05/14/2008', 406, 1), 
(103, 10019, 2006, '08/05/2008', 461, 1), 
(111, 10019, 2003, '02/23/2007', 288, 1), 
(106, 10029, 2007, '12/03/2008', 202, 1), 
(124, 10022, 2010, '05/10/2010', 434, 1), 
(113, 10036, 2005, '01/12/2009', 36, 1), 
(112, 10016, 2009, '06/21/2008', 16, 1), 
(109, 10042, 2003, '01/10/2009', 159, 1), 
(114, 10001, 2002, '11/24/2003', 50, 1), 
(119, 10046, 2005, '05/12/2008', 171, 1), 
(116, 10044, 2004, '01/21/2010', 57, 1), 
(104, 10041, 2009, '08/26/2004', 506, 1), 
(116, 10024, 2007, '09/01/2003', 56, 1), 
(123, 10003, 2002, '02/03/2006', 395, 1), 
(116, 10035, 2004, '12/27/2008', 59, 1), 
(122, 10030, 2008, '09/08/2010', 287, 1), 
(119, 10043, 2003, '03/02/2007', 172, 1), 
(121, 10022, 2001, '09/18/2010', 179, 1), 
(130, 10030, 2001, '04/21/2008', 500, 1), 
(114, 10015, 2007, '02/10/2007', 49, 1), 
(125, 10030, 2003, '03/02/2010', 665, 1), 
(101, 10003, 2002, '02/11/2009', 762, 2), 
(102, 10020, 2008, '01/12/2010', 832, 2), 
(130, 10018, 2005, '12/15/2005', 998, 2), 
(118, 10046, 2004, '07/22/2008', 302, 2), 
(110, 10046, 2005, '03/15/2010', 83, 1), 
(105, 10007, 2003, '08/13/2008', 557, 1), 
(110, 10040, 2010, '05/17/2006', 82, 1), 
(101, 10047, 2004, '07/06/2009', 378, 1), 
(115, 10029, 2005, '08/26/2010', 29, 1), 
(124, 10015, 2005, '12/02/2009', 870, 2), 
(117, 10013, 2002, '02/10/2004', 56, 1), 
(105, 10003, 2002, '03/27/2007', 1106, 2), 
(123, 10044, 2004, '07/06/2009', 392, 1), 
(116, 10028, 2001, '03/16/2006', 60, 1), 
(104, 10045, 2007, '03/20/2008', 502, 1), 
(101, 10048, 2006, '11/22/2007', 381, 1), 
(118, 10042, 2010, '01/07/2010', 152, 1), 
(108, 10050, 2010, '06/13/2006', 153, 1), 
(126, 10014, 2007, '05/05/2005', 338, 2), 
(128, 10003, 2003, '01/27/2008', 322, 1), 
(107, 10025, 2003, '05/05/2009', 248, 2), 
(121, 10020, 2010, '04/27/2009', 352, 2), 
(108, 10024, 2009, '11/16/2007', 152, 1), 
(104, 10035, 2009, '04/06/2006', 503, 1), 
(126, 10033, 2006, '10/23/2004', 170, 1), 
(124, 10022, 2003, '10/26/2003', 434, 1), 
(106, 10042, 2004, '06/19/2005', 202, 1), 
(106, 10014, 2008, '07/22/2006', 406, 2), 
(119, 10018, 2002, '01/02/2004', 169, 1), 
(115, 10018, 2010, '03/17/2003', 32, 1), 
(101, 10018, 2007, '05/19/2007', 378, 1), 
(113, 10002, 2008, '05/28/2003', 35, 1), 
(102, 10043, 2009, '03/01/2005', 417, 1), 
(112, 10047, 2002, '07/01/2006', 17, 1), 
(113, 10011, 2002, '08/26/2003', 35, 1), 
(125, 10006, 2010, '06/13/2003', 667, 1), 
(130, 10023, 2010, '02/06/2008', 497, 1) 

SELECT * FROM (
SELECT 'DIM_MANUFACTURER' AS TABLE_NAME, COUNT(*) AS NO_OF_RECORDS FROM DIM_MANUFACTURER UNION ALL
SELECT 'DIM_MODEL' AS TABLE_NAME, COUNT(*) AS NO_OF_RECORDS FROM DIM_MODEL UNION ALL
SELECT 'DIM_CUSTOMER' AS TABLE_NAME, COUNT(*) AS NO_OF_RECORDS FROM DIM_CUSTOMER UNION ALL
SELECT 'DIM_LOCATION' AS TABLE_NAME, COUNT(*) AS NO_OF_RECORDS FROM DIM_LOCATION UNION ALL
SELECT 'DIM_DATE' AS TABLE_NAME, COUNT(*) AS NO_OF_RECORDS FROM DIM_DATE UNION ALL
SELECT 'FACT_TRANSACTIONS' AS TABLE_NAME, COUNT(*) AS NO_OF_RECORDS FROM FACT_TRANSACTIONS
) TBL

SELECT * FROM DIM_MANUFACTURER
SELECT * FROM DIM_MODEL
SELECT * FROM DIM_CUSTOMER
SELECT * FROM DIM_LOCATION
SELECT * FROM DIM_DATE
SELECT * FROM FACT_TRANSACTIONS





--1. List all the states in which we have customers who have bought cellphones from 2005 till today. 

  SELECT DISTINCT State
  FROM DIM_LOCATION T1
  INNER JOIN 
  FACT_TRANSACTIONS T2 ON T1.IDLocation=T2.IDLocation
  WHERE YEAR(Date)>=2005  AND YEAR(Date)<YEAR(GETDATE())
 
  
--2.What state in the US is buying more 'Samsung' cell phones? 

  SELECT DISTINCT D1.STATE,COUNT(*) Transactions FROM DIM_LOCATION D1
  LEFT JOIN FACT_TRANSACTIONS D2 ON D1.IDLocation=D2.IDLocation
  LEFT JOIN DIM_MODEL D3 ON D2.IDModel=D3.IDModel 
  LEFT JOIN DIM_MANUFACTURER D4 ON D3.IDManufacturer =D4.IDManufacturer
  WHERE D1.Country='US' AND D4.Manufacturer_Name='Samsung'
  GROUP BY  D4.Manufacturer_Name,D1.State
  ORDER BY 2 DESC


--3. Show the number of transactions for each model per zip code per state. 

  SELECT T1.Model_Name, T3.ZipCode,T3.State, COUNT(*)[No Of Transactions]
  FROM DIM_MODEL T1
  LEFT JOIN FACT_TRANSACTIONS T2 ON T1.IDModel=T2.IDModel
  LEFT JOIN DIM_LOCATION T3 ON T2.IDLocation=T3.IDLocation
  GROUP BY T3.ZipCode,T3.State,T1.Model_Name
  ORDER BY 1,2


--4. Show the cheapest cellphone

  SELECT Model_Name,Unit_price FROm DIM_MODEL WHERE Unit_price=(SELECT MIN(Unit_price) FROM DIM_MODEL)



--5. Find out the average price for each model in the top5 manufacturers in terms of sales quantity and order by average price. 

  SELECT T1.MODEL_NAME, round(AVG(T2.TOTALPRICE),2) AS AVERAGE_PRICE 
  FROM DIM_MODEL T1 LEFT JOIN FACT_TRANSACTIONS T2 ON T1.IDModel = T2.IDModel
  LEFT JOIN DIM_MANUFACTURER T3 ON T1.IDManufacturer = T3.IDManufacturer 
  WHERE T3.Manufacturer_Name IN  
            (SELECT TOP 5 (T3.Manufacturer_Name) 
			 FROM DIM_MODEL T1 
			 LEFT JOIN FACT_TRANSACTIONS T2 ON T1.IDModel = T2.IDModel
			 LEFT JOIN DIM_MANUFACTURER T3 ON T1.IDManufacturer = T3.IDManufacturer 
			 GROUP BY T3.Manufacturer_Name
			 ORDER BY SUM(T2.Quantity) DESC)
  GROUP BY T1.Model_Name	
  ORDER BY AVG(T2.TOTALPRICE) DESC


SELECT  T3.Manufacturer_Name ,SUM(T2.Quantity)
			 FROM DIM_MODEL T1 
			 LEFT JOIN FACT_TRANSACTIONS T2 ON T1.IDModel = T2.IDModel
			 LEFT JOIN DIM_MANUFACTURER T3 ON T1.IDManufacturer = T3.IDManufacturer
			  GROUP BY T3.Manufacturer_Name 


--6. List the names of the customers and the average amount spent in 2009,where the average is higher than 500 


  SELECT Customer_NAME, AVG(TotalPrice) AverageAmountSpent 
  FROM DIM_CUSTOMER T1 
  INNER JOIN FACT_TRANSACTIONS T2 ON T1.IDCustomer=T2.IDCustomer
  WHERE YEAR(T2.Date) = 2009
  GROUP BY T1.Customer_Name
  HAVING AVG(TotalPrice) > 500
  ORDER BY 2 DESC

  select * from  FACT_TRANSACTIONS

--7. List if there is any model that was in the top 5 in terms of quantity,simultaneously in 2008, 2009 and 2010 

  SELECT * FROM
  ( SELECT TOP 5 Model_Name 
    FROM DIM_MODEL T1
    INNER JOIN FACT_TRANSACTIONS T2 ON T1.IDModel=T2.IDModel
    INNER JOIN DIM_DATE T3 ON T2.Date=T3.DATE
    WHERE YEAR='2008'
    GROUP BY Model_Name,YEAR
    ORDER BY SUM(Quantity) DESC
      INTERSECT
    SELECT TOP 5 Model_Name 
    FROM DIM_MODEL T1
    INNER JOIN FACT_TRANSACTIONS T2 ON T1.IDModel=T2.IDModel
    INNER JOIN DIM_DATE T3 ON T2.Date=T3.DATE
    WHERE YEAR='2009'
    GROUP BY Model_Name,YEAR
    ORDER BY SUM(Quantity) DESC
      INTERSECT
    SELECT TOP 5 Model_Name 
    FROM DIM_MODEL T1
    INNER JOIN FACT_TRANSACTIONS T2 ON T1.IDModel=T2.IDModel
    INNER JOIN DIM_DATE T3 ON T2.Date=T3.DATE
    WHERE YEAR='2010'
    GROUP BY Model_Name,YEAR
    ORDER BY SUM(Quantity) DESC) AS T




--8.Show the manufacturer with the 2nd top sales in the year of 2009 and the manufacturer with the 2nd top sales in the year of 2010. 


   SELECT DISTINCT(YEAR(T3.DATE)) AS YEAR, T1.MANUFACTURER_NAME
	FROM DIM_MANUFACTURER T1
    LEFT JOIN DIM_MODEL T2 ON T1.IdManufacturer = T2.IdManufacturer
	LEFT JOIN FACT_TRANSACTIONS T3 ON T2.IdModel = T3.IdModel
	WHERE (YEAR(T3.DATE) = 2009 )AND T3.TotalPrice =(SELECT MAX(TotalPrice) 
										              FROM FACT_TRANSACTIONS 
													  WHERE YEAR(DATE) = 2009 AND TotalPrice NOT IN(SELECT MAX(TotalPrice) 
										                                                            FROM FACT_TRANSACTIONS 
																									WHERE YEAR(DATE) = 2009))
	OR (YEAR(T3.DATE) = 2010) AND T3.TotalPrice =  (SELECT MAX(TotalPrice) 
										             FROM FACT_TRANSACTIONS
													 WHERE YEAR(DATE) = 2010 AND TotalPrice NOT IN(SELECT MAX(TotalPrice) 
													                                               FROM FACT_TRANSACTIONS
																						           WHERE YEAR(DATE) = 2010))



--Q9.Show the manufacturers that sold cellphone in 2010 but didn�t in 2009. 
  
    SELECT DISTINCT(T1.IDManufacturer),Manufacturer_Name
	FROM DIM_MANUFACTURER T1 
	INNER JOIN DIM_MODEL T2 ON T1.IdManufacturer = T2.IdManufacturer 
	INNER JOIN FACT_TRANSACTIONS T3 ON T2.IdModel = T3.IdModel
	WHERE YEAR(T3.DATE)=2010
		EXCEPT
    SELECT DISTINCT(T1.IDManufacturer),Manufacturer_Name
    FROM DIM_MANUFACTURER T1 
	INNER JOIN DIM_MODEL T2 ON T1.IdManufacturer = T2.IdManufacturer 
	INNER JOIN FACT_TRANSACTIONS T3 ON T2.IdModel = T3.IdModel
	WHERE YEAR(T3.DATE)=2009


	


--10. Find top 10 customers and their average spend, average quantity by each year. Also find the percentage of change in their spend. 
  
  
   
	  SELECT  T1.CUSTOMER_NAME 
		,	AVG(CASE WHEN YEAR(T2.DATE) = 2003 THEN (T2.TOTALPRICE) END) AS AVG_SPENT_IN_2003
		,	AVG(CASE WHEN YEAR(T2.DATE) = 2003 THEN (T2.QUANTITY) END) AS AVG_QUANTITY_IN_2003
		,	AVG(CASE WHEN YEAR(T2.DATE) = 2004 THEN (T2.TOTALPRICE) END) AS AVG_SPENT_IN_2004
		,	AVG(CASE WHEN YEAR(T2.DATE) = 2004 THEN (T2.QUANTITY) END) AS AVG_QUANTITY_IN_2004
		,	AVG(CASE WHEN YEAR(T2.DATE) = 2005 THEN (T2.TOTALPRICE) END) AS AVG_SPENT_IN_2005 
		,	AVG(CASE WHEN YEAR(T2.DATE) = 2005 THEN (T2.QUANTITY) END) AS AVG_QUANTITY_IN_2005
		,	AVG(CASE WHEN YEAR(T2.DATE) = 2006 THEN (T2.TOTALPRICE) END) AS AVG_SPENT_IN_2006
		,	AVG(CASE WHEN YEAR(T2.DATE) = 2006 THEN (T2.QUANTITY) END) AS AVG_QUANTITY_IN_2006
		,	AVG(CASE WHEN YEAR(T2.DATE) = 2007 THEN (T2.TOTALPRICE) END) AS AVG_SPENT_IN_2007
		,	AVG(CASE WHEN YEAR(T2.DATE) = 2007 THEN (T2.QUANTITY) END) AS AVG_QUANTITY_IN_2007
		,	AVG(CASE WHEN YEAR(T2.DATE) = 2008 THEN (T2.TOTALPRICE) END) AS AVG_SPENT_IN_2008
		,	AVG(CASE WHEN YEAR(T2.DATE) = 2008 THEN (T2.QUANTITY) END) AS AVG_QUANTITY_IN_2008
		,	AVG(CASE WHEN YEAR(T2.DATE) = 2009 THEN (T2.TOTALPRICE) END) AS AVG_SPENT_IN_2009
		,	AVG(CASE WHEN YEAR(T2.DATE) = 2009 THEN (T2.QUANTITY) END) AS AVG_QUANTITY_IN_2009
		,	AVG(CASE WHEN YEAR(T2.DATE) = 2010 THEN (T2.TOTALPRICE) END) AS AVG_SPENT_IN_2010
		,	AVG(CASE WHEN YEAR(T2.DATE) = 2010 THEN (T2.QUANTITY) END) AS AVG_QUANTITY_IN_2010												
					FROM DIM_CUSTOMER T1 LEFT JOIN FACT_TRANSACTIONS T2 
					ON T1.IdCustomer = T2.IdCustomer
					WHERE Customer_Name IN ( SELECT TOP 10 Customer_Name FROM DIM_CUSTOMER T1
                                             LEFT JOIN FACT_TRANSACTIONS T2
											 ON T1.IDCustomer=T2.IDCustomer
                                             GROUP BY Customer_Name,T1.IDCustomer
                                             ORDER BY SUM(TotalPrice) DESC)
					GROUP BY  T1.CUSTOMER_NAME
					ORDER BY SUM(T2.TOTALPRICE)
  

  --OR


  SELECT Customer_Name AS Names,Average_Quantity,
   ( CASE WHEN Y_03 IS NOT NULL THEN (Y_04-Y_03)/Y_03*100 END) Diff_04,
   ( CASE WHEN Y_04 IS NOT NULL THEN (Y_05-Y_04)/Y_04*100 END) Diff_05,
   ( CASE WHEN Y_05 IS NOT NULL THEN (Y_06-Y_05)/Y_05*100 END) Diff_06,
   ( CASE WHEN Y_06 IS NOT NULL THEN (Y_07-Y_06)/Y_06*100 END) Diff_07,
   ( CASE WHEN Y_07 IS NOT NULL THEN (Y_08-Y_07)/Y_07*100 END) Diff_08,
   ( CASE WHEN Y_08 IS NOT NULL THEN (Y_09-Y_08)/Y_08*100 END) Diff_09,
   ( CASE WHEN Y_09 IS NOT NULL THEN (Y_10-Y_09)/Y_09*100 END) Diff_10
   FROM (
          SELECT Customer_Name,AVG(Quantity) AS Average_Quantity,
		  AVG((CASE WHEN YEAR(Date)=2003 THEN TotalPrice END)) Y_03,
		  AVG((CASE WHEN YEAR(Date)=2004 THEN TotalPrice END)) Y_04,
		  AVG((CASE WHEN YEAR(Date)=2005 THEN TotalPrice END)) Y_05,
		  AVG((CASE WHEN YEAR(Date)=2006 THEN TotalPrice END)) Y_06,
		  AVG((CASE WHEN YEAR(Date)=2007 THEN TotalPrice END)) Y_07,
		  AVG((CASE WHEN YEAR(Date)=2008 THEN TotalPrice END)) Y_08,
		  AVG((CASE WHEN YEAR(Date)=2009 THEN TotalPrice END)) Y_09,
		  AVG((CASE WHEN YEAR(Date)=2010 THEN TotalPrice END)) Y_10
		  FROM FACT_TRANSACTIONS AS T1
		  JOIN DIM_CUSTOMER AS T2 ON T1.IDCustomer=T2.IDCustomer
		  GROUP BY Customer_Name )S
