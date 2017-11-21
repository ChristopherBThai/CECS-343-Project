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
    hWebID      INT             NOT NUll,
    typeName    VARCHAR(100)     NOT NULL,
    CONSTRAINT  Home_Type_FK FOREIGN KEY(hWebID) REFERENCES Homeowner(hWebID),
    CONSTRAINT  Home_Type_PK PRIMARY KEY(hWebID, typeName)
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
    bWebID      INT             NOT NULL,
    typeName    VARCHAR(100)     NOT NULL,
    typeRate	INT,
    CONSTRAINT  Business_Type_FK FOREIGN KEY(bWebID) REFERENCES Business(bWebID),
    CONSTRAINT  Business_Type_PK PRIMARY KEY(bWebID, typeName)
);

CREATE TABLE Review
(
    hWebID      INT             NOT NULL,
    bWebID      INT             NOT NULL,
    typeName    VARCHAR(100)    NOT NULL,
    dateReview  DATETIME        NOT NULL,
    reviewStars INT             NOT NULL,
    rAnonymous  VARCHAR(1),
    rDetails    VARCHAR(500),
    CONSTRAINT  Review_Home_FK FOREIGN KEY(hWebID) REFERENCES Homeowner(hWebID),
    CONSTRAINT  Review_Business_FK FOREIGN KEY(bWebID, typeName) REFERENCES BusinessType(bWebID, typeName),
    CONSTRAINT  Reieve_PK PRIMARY KEY(dateReview)  
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
    hWebID AS "ID"
FROM HouseType ORDER BY typeName;

SELECT 
    typeName AS "Business Type", 
    bWebID AS "ID", 
    typeRate AS "Cost Per Hour"
FROM BusinessType ORDER BY typeName;
