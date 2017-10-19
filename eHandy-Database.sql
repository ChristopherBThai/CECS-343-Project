CREATE TABLE Homeowner
(
    hName       VARCHAR(20)     NOT NULL,
    hWebID      INT             NOT NUll,
    hEmail      VARCHAR(20),
    hAddress    VARCHAR(60),
    hPhoneNum   VARCHAR(10),
    CONSTRAINT  Homeowner_PK PRIMARY KEY(hWebID) 
);

CREATE TABLE HouseType
(
    typeName    VARCHAR(20)     NOT NULL,
    hWebID      INT             NOT NUll,
    monthlyPay  FLOAT,
    CONSTRAINT  Home_Type_FK FOREIGN KEY(hWebID) REFERENCES Homeowner(hWebID),
    CONSTRAINT  Home_Type_PK PRIMARY KEY(typeName)
);

CREATE TABLE Business
(
    bName       VARCHAR(20)     NOT NULL,
    bWebID      INT             NOT NULL,
    bEmail      VARCHAR(20)     NOT NULL,
    bAddress    VARCHAR(60),
    bPhoneNum   VARCHAR(10),
    CONSTRAINT  Business_PK PRIMARY KEY(bWebID)
);

CREATE TABLE BusinessType
(
    typeName    VARCHAR(20)     NOT NULL,
    bWebID      INT             NOT NULL,       
    typeRate    FLOAT,
    CONSTRAINT  Business_Type_FK FOREIGN KEY(bWebID) REFERENCES Business(bWebID),
    CONSTRAINT  Business_Type_PK PRIMARY KEY(typeName)
);

CREATE TABLE Review
(
    dateReview  DATETIME        NOT NULL,
    reviewStars INT             NOT NULL,
    hWebID      INT             NOT NULL,
    bWebID      INT             NOT NULL,
    rDetails    VARCHAR(500),
    rAnonymous  VARCHAR(1),
    CONSTRAINT  Review_Home_FK FOREIGN KEY(hWebID) REFERENCES Homeowner(hWebID),
    CONSTRAINT  Review_Business_FK FOREIGN KEY(bWebID) REFERENCES Business(bWebID),
    CONSTRAINT  Reieve_PK PRIMARY KEY(dateReview, reviewStars)  
);


-- Useful Commands --
SELECT 
    hName AS "Full Name", 
    hWebID AS "ID", 
    hEmail AS "Email", 
    hAddress AS "Address", 
    hPhoneNum AS "Phone Number" 
FROM Homeowner ORDER BY hName;

SELECT 
    bName AS "Full Name", 
    bWebID AS "ID", 
    bEmail AS "Email", 
    bAddress AS "Address", 
    bPhoneNum AS "Phone Number" 
FROM Business ORDER BY bName;

SELECT 
    typeName AS "Home Type", 
    hWebID AS "ID", 
    monthlyPay AS "Monthly Cost"
FROM HouseType ORDER BY typeName;

SELECT 
    typeName AS "Business Type", 
    bWebID AS "ID", 
    typeRate AS "Cost Per Hour"
FROM BusinessType ORDER BY typeName;





-- Insertion Section for Homeowner --
INSERT INTO Homeowner
(
    hName, 
    hWebID, 
    hEmail, 
    hAddress, 
    hPhoneNum
)
VALUES
(
    'Aingty Eung',
    2772,
    'aingtyeung@yahoo.com',
    '1234 Avenue St. Long Beach, CA 90807',
    '5627357936'
),
(
    'Brian Pham',
    4805,
    'brianthongpham@gmail.com',
    '1234 Broadway St. Mordor, CA 91122',
    '6572076886'
),
(
    'Christopher Thai',
    2962,
    'ChristopherBThai@gmail.com',
    '239 Temp St. LAS VegAS, NV 89834',
    '7146249903'
),
(
    'Kunal Patel',
    9054,
    'kunal1005@yahoo.com',
    '9876 Ocean Dr. Dragonstone, NY 73451',
    '5623087579'
),
(
    'Matthew Vu',
    5195,
    'tokamakuyokuu@gmail.com',
    '4971 High Road Mustafar, TX 28743',
    '6576660273'
);
-- End of Homeowner Insertion --

-- Insertion Section for Business --
INSERT INTO Business(bName, bWebID, bEmail, bAddress, bPhoneNum) VALUES
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1112,'Amazon@amazon.com','3278 Olive Ave. Smallville, WA 72830','8105738268')
('Amazon',1113,'Amazon@amazon.com','3278 Olive Ave. Metropolis, WA 72830','8105738268')
('Amazon',1114,'Amazon@amazon.com','3278 Olive Ave. Central, WA 72830','8105738268')
('Amazon',1115,'Amazon@amazon.com','3278 Olive Ave. Gorilla, WA 72830','8105738268')
('Amazon',1116,'Amazon@amazon.com','3278 Olive Ave. Long Beach, WA 72830','8105738268')
('Amazon',1117,'Amazon@amazon.com','3278 Olive Ave. Themiscyra, WA 72830','8105738268')
('Amazon',1118,'Amazon@amazon.com','3278 Olive Ave. New York, WA 72830','8105738268')
('Amazon',1119,'Amazon@amazon.com','3278 Olive Ave. Huntington Beach, WA 72830','8105738268')
('Amazon',1120,'Amazon@amazon.com','3278 Olive Ave. Imveryhungry, WA 72830','8105738268')
('Amazon',1121,'Amazon@amazon.com','3278 Olive Ave. Whatiswiththis, WA 72830','8105738268')
('Amazon',1122,'Amazon@amazon.com','3278 Olive Ave. Diemidterms, WA 72830','8105738268')
('Amazon',1123,'Amazon@amazon.com','3278 Olive Ave. Godthisisalot, WA 72830','8105738268')
('Amazon',1124,'Amazon@amazon.com','3278 Olive Ave. Kaymorecities, WA 72830','8105738268')
('Amazon',1125,'Amazon@amazon.com','3278 Olive Ave. Silicon, WA 72830','8105738268')
('Amazon',1126,'Amazon@amazon.com','3278 Olive Ave. Rain, WA 72830','8105738268')
('Amazon',1127,'Amazon@amazon.com','3278 Olive Ave. Mordor, WA 72830','8105738268')
('Amazon',1128,'Amazon@amazon.com','3278 Olive Ave. Hogwarts, WA 72830','8105738268')
('Amazon',1129,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1130,'Amazon@amazon.com','3278 Olive Ave. Hogwarts, WA 72830','8105738268')
('Amazon',1131,'Amazon@amazon.com','3278 Olive Ave. Long Beach, WA 72830','8105738268')
('Amazon',1132,'Amazon@amazon.com','3278 Olive Ave. Sacramento, WA 72830','8105738268')
('Amazon',1133,'Amazon@amazon.com','3278 Olive Ave. New York, WA 72830','8105738268')
('Amazon',1134,'Amazon@amazon.com','3278 Olive Ave. Gorilla, WA 72830','8105738268')
('Amazon',1135,'Amazon@amazon.com','3278 Olive Ave. Irvine, WA 72830','8105738268')
('Amazon',1136,'Amazon@amazon.com','3278 Olive Ave. Central, WA 72830','8105738268')
('Amazon',1137,'Amazon@amazon.com','3278 Olive Ave. Smallville, WA 72830','8105738268')
('Amazon',1138,'Amazon@amazon.com','3278 Olive Ave. Themiscyra, WA 72830','8105738268')
('Amazon',1139,'Amazon@amazon.com','3278 Olive Ave. Watchtower, WA 72830','8105738268')
('Amazon',1140,'Amazon@amazon.com','3278 Olive Ave. Naboo, WA 72830','8105738268')
('Amazon',1141,'Amazon@amazon.com','3278 Olive Ave. Tatooine, WA 72830','8105738268')
('Amazon',1142,'Amazon@amazon.com','3278 Olive Ave. Tatooine, WA 72830','8105738268')
('Amazon',1143,'Amazon@amazon.com','3278 Olive Ave. Endor, WA 72830','8105738268')
('Amazon',1144,'Amazon@amazon.com','3278 Olive Ave. Kamino, WA 72830','8105738268')
('Amazon',1145,'Amazon@amazon.com','3278 Olive Ave. Mustafar, WA 72830','8105738268')
('Amazon',1146,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1147,'Amazon@amazon.com','3278 Olive Ave. Hoth, WA 72830','8105738268')
('Amazon',1148,'Amazon@amazon.com','3278 Olive Ave. Curuscant, WA 72830','8105738268')
('Amazon',1149,'Amazon@amazon.com','3278 Olive Ave. Hoth, WA 72830','8105738268')
('Amazon',1150,'Amazon@amazon.com','3278 Olive Ave. Kamino, WA 72830','8105738268')
('Amazon',1151,'Amazon@amazon.com','3278 Olive Ave. Bespin, WA 72830','8105738268')
('Amazon',1152,'Amazon@amazon.com','3278 Olive Ave. Alderaan, WA 72830','8105738268')
('Amazon',1153,'Amazon@amazon.com','3278 Olive Ave. Kashyyyk, WA 72830','8105738268')
('Amazon',1154,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1155,'Amazon@amazon.com','3278 Olive Ave. Endor, WA 72830','8105738268')
('Amazon',1156,'Amazon@amazon.com','3278 Olive Ave. Alderaan, WA 72830','8105738268')
('Amazon',1157,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1158,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1159,'Amazon@amazon.com','3278 Olive Ave. Curuscant, WA 72830','8105738268')
('Amazon',1160,'Amazon@amazon.com','3278 Olive Ave. Yavin, WA 72830','8105738268')
('Amazon',1161,'Amazon@amazon.com','3278 Olive Ave. Bespin, WA 72830','8105738268')
('Amazon',1162,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1163,'Amazon@amazon.com','3278 Olive Ave. Endor, WA 72830','8105738268')
('Amazon',1164,'Amazon@amazon.com','3278 Olive Ave. Alderaan, WA 72830','8105738268')
('Amazon',1165,'Amazon@amazon.com','3278 Olive Ave. Curuscant, WA 72830','8105738268')
('Amazon',1166,'Amazon@amazon.com','3278 Olive Ave. Kashyyyk, WA 72830','8105738268')
('Amazon',1167,'Amazon@amazon.com','3278 Olive Ave. Mustafar, WA 72830','8105738268')
('Amazon',1168,'Amazon@amazon.com','3278 Olive Ave. Yavin, WA 72830','8105738268')
('Amazon',1169,'Amazon@amazon.com','3278 Olive Ave. Bespin, WA 72830','8105738268')
('Amazon',1160,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268');