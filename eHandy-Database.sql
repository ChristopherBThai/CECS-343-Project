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
    rAnonymous  VARCHAR(1),
    CONSTRAINT  Review_Home_FK FOREIGN KEY(hWebID) REFERENCES Homeowner(hWebID),
    CONSTRAINT  Review_Business_FK FOREIGN KEY(bWebID) REFERENCES Business(bWebID),
    CONSTRAINT  Reieve_PK PRIMARY KEY(dateReview, reviewStars)  
);

##### INSERTS HERE!!!! #####