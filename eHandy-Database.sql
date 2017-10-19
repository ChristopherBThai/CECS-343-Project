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
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
('Amazon',1111,'Amazon@amazon.com','3278 Olive Ave. Gotham, WA 72830','8105738268')
;