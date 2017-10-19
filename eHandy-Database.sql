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
('Orange',1111,'orangeface@color.com','1789 Sunny Ln. Gotham, CA 72831','8108371645')
('Yellow',1112,'yellowhair@color.com','1376 Rain Dr. Smallville, CA 72840','8100193755')
('Green',1113,'greenpea@color.com','3278 Olive Ave. Metropolis, CA 72821,'8109175523')
('Blue',1114,'bluepoo@color.com','3278 Clues Ave. Central, CA 72810','8101999999')
('PurpLe',1115,'purpleman@color.com','1359 Pinky Ave. Gorilla, CA 72823','8101094675')
('DragoMaids',1116,'dragmaid@clean.com','3278 Waifu Ln. Long Beach, CA 72810','8101432312')
('Pewter',1117,'pwter@poke.com','1152 Olive Ave. Themiscyra, CA 72850','8101111111')
('Cerulean',1118,'cerulean@poke.com','8389 Gym St. New York, CA 72831','8109999999')
('Vermilion',1119,'vermilion@poke.com','2568 Water Ave. Huntington Beach, CA 92830','8108108100')
('Celadon',1120,'celadon@poke.com','7130 Emon Ave. Imveryhungry, CA 72833','8106666666')
('Fuschia',1121,'fuschia@poke.com','6088 Gym Hwy. Whatiswiththis, CA 72838','8101112345')
('Saffron',1122,'saffron@poke.com','5890 Gym Ave. Diemidterms, CA 72860','8108677908')
('Cinnabar',1123,'cinnabar@poke.com','3278 Gym Ave. Godthisisalot, CA 72430','8105738268')
('Hyrule',1124,'hyrulecastle@zelda.com','9516 Castle Ave. Kaymorecities, CA 73830','8101234863')
('Mushroom',1125,'mushroom@peach.com','2638 Poison Ln. Silicon, CA 72831','8101234567')
('Viridian',1126,'viridian@poke.com','3278 Orb St. Rain, CA 72838','8107654321')
('Goron',1127,'goronsan@zelda.com','6599 Solomon Dr. Mordor, CA 72833','8100987654')
('Gerudo',1128,'gerudo@zelda.com','4998 Desert Hwy. Hogwarts, CA 72810','8107435134')
('Kakariko',1129,'kaka@zelda.com','1801 Ugly Dr. Gotham, CA 72832','8109873541')
('Zora',1130,'zora@zelda.com','5720 Green St. Hogwarts, CA 72831','8100192837')
('Rainbow',1131,'rainbow@wut.com','9133 Unicorn Ln. Long Beach, CA 72838','8106574839')
('Maximum',1132,'max@drive.com','2770 Overload Dr. Sacramento, CA 72832','8101230987')
('Vwoosh',1133,'vwoosh@cuzitzfun.com','3278 Speedy Ave. New York, CA 72839','8108765332')
('Boom',1134,'boom@bam.com','6539 Hazard Ave. Gorilla, CA 72810','8100985422')
('Bam',1135,'bam@boom.com','9002 Danger St. Irvine, CA 72833','8107463333')
('Amazon',1136,'Amazon@amazon.com','3278 Olive Ave. Central, WA 72830','8105738268')
('Amazon',1137,'Amazon@amazon.com','3278 Olive Ave. Smallville, WA 72830','6196786789')
('Amazon',1138,'Amazon@amazon.com','3278 Olive Ave. Themiscyra, WA 72830','6195675678')
('Amazon',1139,'Amazon@amazon.com','3278 Olive Ave. Watchtower, WA 72830','6194564567')
('Amazon',1140,'Amazon@amazon.com','3278 Olive Ave. Naboo, WA 72830','6193453456')
('Amazon',1141,'Amazon@amazon.com','3278 Olive Ave. Tatooine, WA 72830','6192342345')
('Amazon',1142,'Amazon@amazon.com','3278 Olive Ave. Tatooine, WA 72830','6191231234')
('Amazon',1143,'Amazon@amazon.com','3278 Olive Ave. Endor, WA 72830','3107897890')
('Amazon',1144,'Amazon@amazon.com','3278 Olive Ave. Kamino, WA 72830','3106786789')
('Amazon',1145,'Amazon@amazon.com','3278 Olive Ave. Mustafar, WA 72830','3105675678')
('Amazon',1146,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','3104564567')
('Amazon',1147,'Amazon@amazon.com','3278 Olive Ave. Hoth, WA 72830','3103453456')
('Amazon',1148,'Amazon@amazon.com','3278 Olive Ave. Curuscant, WA 72830','3102342345')
('Amazon',1149,'Amazon@amazon.com','3278 Olive Ave. Hoth, WA 72830','3101231234')
('Amazon',1150,'Amazon@amazon.com','3278 Olive Ave. Kamino, WA 72830','3237897890')
('Amazon',1151,'Amazon@amazon.com','3278 Olive Ave. Bespin, WA 72830','3236786789')
('Amazon',1152,'Amazon@amazon.com','3278 Olive Ave. Alderaan, WA 72830','3235675678')
('Amazon',1153,'Amazon@amazon.com','3278 Olive Ave. Kashyyyk, WA 72830','3234564567')
('Amazon',1154,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','3233453456')
('Amazon',1155,'Amazon@amazon.com','3278 Olive Ave. Endor, WA 72830','3232342345')
('Amazon',1156,'Amazon@amazon.com','3278 Olive Ave. Alderaan, WA 72830','3231231234')
('Amazon',1157,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','2137897890')
('Amazon',1158,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','2136786789')
('Amazon',1159,'Amazon@amazon.com','3278 Olive Ave. Curuscant, WA 72830','2135675678')
('Amazon',1160,'Amazon@amazon.com','3278 Olive Ave. Yavin, WA 72830','2134564567')
('Amazon',1161,'Amazon@amazon.com','3278 Olive Ave. Bespin, WA 72830','2133453456')
('Amazon',1162,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','2132342345')
('Amazon',1163,'Amazon@amazon.com','3278 Olive Ave. Endor, WA 72830','2131231234')
('Amazon',1164,'Amazon@amazon.com','3278 Olive Ave. Alderaan, WA 72830','5627897890')
('Amazon',1165,'Amazon@amazon.com','3278 Olive Ave. Curuscant, WA 72830','5626786789')
('Amazon',1166,'Amazon@amazon.com','3278 Olive Ave. Kashyyyk, WA 72830','5625675678')
('Amazon',1167,'Amazon@amazon.com','3278 Olive Ave. Mustafar, WA 72830','5624564567')
('Amazon',1168,'Amazon@amazon.com','3278 Olive Ave. Yavin, WA 72830','5623453456')
('Amazon',1169,'Amazon@amazon.com','3278 Olive Ave. Bespin, WA 72830','5622342345')
('Gardenscapers',1170,'gardenscape@gmail.com','7182 Newberry Ave. Gotham, CA 90001','5621231234'
