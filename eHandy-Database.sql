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
    bEmail      VARCHAR(20)     NOT NULL,
    bAddress    VARCHAR(60),
    bPhoneNum   VARCHAR(10),
    CONSTRAINT  Business_PK PRIMARY KEY(bName, webID)
);

CREATE TABLE Home_Service
(
    serviceNeed VARCHAR(15)     NOT NULL,
    hName       VARCHAR(20)     NOT NULL,
    serviceDate DATE            NOT NULL,
    serviceLoc  VARCHAR(30),
    CONSTRAINT  Home_Service_FK FOREIGN KEY(hName) REFERENCES Homeowner.hName,
    CONSTRAINT  Home_Service_PK PRIMARY KEY(serviceNeed)
);

CREATE TABLE Business_Service
(
    serviceType VARCHAR(15)     NOT NULL,
    bName       VARCHAR(20)     NOT NULL,
    serviceRate FLOAT          NOT NULL,
    startDate   DATE,
    CONSTRAINT  Business_Service_FK FOREIGN KEY(bName) REFERENCES Business.bName,
    CONSTRAINT  Business_Service_PK PRIMARY KEY(serviceType, serviceRate)
);


