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
('Orange',1111,'orangeface@color.com','1789 Sunny Ln. Gotham, CA 72831','8108371645'),
('Yellow',1112,'yellowhair@color.com','1376 Rain Dr. Smallville, CA 72840','8100193755'),
('Green',1113,'greenpea@color.com','3278 Olive Ave. Metropolis, CA 72821','8109175523'),
('Blue',1114,'bluepoo@color.com','3278 Clues Ave. Central, CA 72810','8101999999'),
('PurpLe',1115,'purpleman@color.com','1359 Pinky Ave. Gorilla, CA 72823','8101094675'),
('DragoMaids',1116,'dragmaid@clean.com','3278 Waifu Ln. Long Beach, CA 72810','8101432312'),
('Pewter',1117,'pwter@poke.com','1152 Olive Ave. Themiscyra, CA 72850','8101111111'),
('Cerulean',1118,'cerulean@poke.com','8389 Gym St. New York, CA 72831','8109999999'),
('Vermilion',1119,'vermilion@poke.com','2568 Water Ave. Huntington Beach, CA 92830','8108108100'),
('Celadon',1120,'celadon@poke.com','7130 Emon Ave. Imveryhungry, CA 72833','8106666666'),
('Fuschia',1121,'fuschia@poke.com','6088 Gym Hwy. Whatiswiththis, CA 72838','8101112345'),
('Saffron',1122,'saffron@poke.com','5890 Gym Ave. Diemidterms, CA 72860','8108677908'),
('Cinnabar',1123,'cinnabar@poke.com','3278 Gym Ave. Godthisisalot, CA 72430','8105738268'),
('Hyrule',1124,'hyrulecastle@zelda.com','9516 Castle Ave. Kaymorecities, CA 73830','8101234863'),
('Mushroom',1125,'mushroom@peach.com','2638 Poison Ln. Silicon, CA 72831','8101234567'),
('Viridian',1126,'viridian@poke.com','3278 Orb St. Rain, CA 72838','8107654321'),
('Goron',1127,'goronsan@zelda.com','6599 Solomon Dr. Mordor, CA 72833','8100987654'),
('Gerudo',1128,'gerudo@zelda.com','4998 Desert Hwy. Hogwarts, CA 72810','8107435134'),
('Kakariko',1129,'kaka@zelda.com','1801 Ugly Dr. Gotham, CA 72832','8109873541'),
('Zora',1130,'zora@zelda.com','5720 Green St. Hogwarts, CA 72831','8100192837'),
('Rainbow',1131,'rainbow@wut.com','9133 Unicorn Ln. Long Beach, CA 72838','8106574839'),
('Maximum',1132,'max@drive.com','2770 Overload Dr. Sacramento, CA 72832','8101230987'),
('Vwoosh',1133,'vwoosh@cuzitzfun.com','3278 Speedy Ave. New York, CA 72839','8108765332'),
('Boom',1134,'boom@bam.com','6539 Hazard Ave. Gorilla, CA 72810','8100985422'),
('Bam',1135,'bam@boom.com','9002 Danger St. Irvine, CA 72833','8107463333'),
('Stoneworks',1136,'stone@works.com','1236 Olive Blvd. Star, CA 90234','6197897890'),
('Zip',1137,'zip@zap.com','6723 Steven St. Smallville, CA 90123','6196786789'),
('Zap',1138,'zap@zip.com','3278 Grape Ave. Themiscyra, CA 72830','6195675678'),
('Click',1139,'click@clack.com','3278 Olivera St. Watchtower, CA 72830','6194564567'),
('Clack',1140,'clack@click.com','7698 Grapevine Blvd. Naboo, CA 90154','6193453456'),
('Backpick',1141,'backpick@random.com','3278 Olive Ave. Tatooine, NV 72830','6192342345'),
('Blerch',1142,'blerch@gmail.com','5768 Harley Ln. Tatooine, CA 97162','6191231234'),
('Falling',1143,'falling@gmail.com','6781 Addison Blvd. Endor, AZ 72830','3107897890'),
('Title',1144,'title@yahoo.com','123 Green Ave. Kamino, NV 18223','3106786789'),
('Greyproduct',1145,'greyP@gmail.com','32145 Grey Ave. Mustafar, CA 91273','3105675678'),
('Tears',1146,'Tears@yahoo.com','4763 Stone Rd. Gotham, CA 91298','3104564567'),
('All4One',1147,'All@one.com','1233 Pleaseant Ave. Hoth, NV 91273','3103453456'),
('One4All',1148,'One@all.com','6712 Silver Ave. Curuscant, AZ 91297','3102342345'),
('Customers',1149,'customers@consumer.com','1 Malibu Ave. Hoth, CA 91238','3101231234'),
('OrderIt',1150,'orderIt@gmail.com','1600 Pennsylvania Ave. Kamino, AZ 90127','3237897890'),
('Cheque',1151,'cheque@hotmail.com','7682 El Rancho Verde Ave. Bespin, NV 90123','3236786789'),
('Display',1152,'display@gmail.com','6512 Blue Ln. Alderaan, NV 90703','3235675678'),
('Qarkeys',1153,'qar@paypal.com','5672 Qar Blvd. Kashyyyk, CA 21933','3234564567'),
('Blen',1154,'blen@earthlink.com','4567 Blen Rd. Gotham, CA 12394','3233453456'),
('Spazz',1155,'spazz@gmail.com','9821 Spazz Way Endor, WA 28273','3232342345'),
('Floggers',1156,'flogger@yahoo.com','7812 Flogger Ln. Alderaan, WA 12384','3231231234'),
('OutofBusiness',1157,'broke@business.com','2135 Poopstain Rd. Gotham, WA 87765','2137897890'),
('This sucks',1158,'this@sucks.com','24828 Fracture Ave. Gotham, WA 90909','2136786789'),
('Fake business',1159,'fake@news.com','12384 Crizis Lane. Curuscant, WA 27981','2135675678'),
('Product Giver',1160,'product@gmail.com','672 Justice Ave. Yavin, WA 98712','2134564567'),
('Plants R Us',1161,'plants@RUS.com','56272 Fortress St. Bespin, WA 65783','2133453456'),
('Months',1162,'months@calander.com','12346 Oilver Ave. Gotham, WA 56475','2132342345'),
('California',1163,'cali@fornia.com','564 Skywalker Ln. Endor, WA 90746','2131231234'),
('Best Buy',1164,'bestbuy@tech.com','652 Obiwan St. Alderaan, WA 90464','5627897890'),
('Circuit City',1165,'broke@donefor.com','12378 Darth Ave. Curuscant, WA 79032','5626786789'),
('Kohls',1166,'kohls@stores.com','1223 Maul Ave. Kashyyyk, WA 23874','5625675678'),
('JCPenny',1167,'jcpenny@stores.com','9172 Vader Ave. Mustafar, WA 72830','5624564567'),
('Payless',1168,'payless@stores.com','5782 Jarjar Ave. Yavin, WA 63287','5623453456'),
('Midterm',1169,'hardtest@school.com','5467 Exit Ln. Bespin, WA 56355','5622342345'),
('Gardenscapers',1170,'gardenscape@gmail.com','7182 Newberry Ave. Gotham, CA 32455','5621231234');
