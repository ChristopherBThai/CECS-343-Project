CREATE TABLE Homeowner
(
    hName       VARCHAR(20)     NOT NULL,
    webID       INT             NOT NUll,
    hAddress    VARCHAR(60),
    hPhoneNum   VARCHAR(10),
    hEmail      VARCHAR(20),
    houseType   VARCHAR(30),
    CONSTRAINT  Homeowner_PK PRIMARY KEY(hName, webID) 
);

CREATE TABLE Business
(
    bName       VARCHAR(20)     NOT NULL,
    webID       INT             NOT NULL,
    bAddress    VARCHAR(60),
    bPhoneNum   VARCHAR(10),
    bEmail      VARCHAR(20),
    CONSTRAINT  Business_PK PRIMARY KEY(bName, webID)
);

CREATE TABLE Home_Service
(
    serviceNeed VARCHAR(15)     NOT NULL,
    hName       VARCHAR(20)     NOT NULL,
    serviceDate DATETIME,
    CONSTRAINT  Home_Service_FK FOREIGN KEY(hName) REFERENCES Homeowner.hName,
    CONSTRAINT  Home_Service_PK PRIMARY KEY(serviceNeed)
);

