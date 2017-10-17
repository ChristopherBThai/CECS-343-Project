CREATE TABLE Homeowner
(
    hName       VARCHAR(20)     NOT NULL,
    webID       INT             NOT NUll,
    hAddress    VARCHAR(60),
    hPhoneNum   VARCHAR(10),
    hEmail      VARCHAR(20),
    houseType   VARCHAR(30)
--     CONSTRAINT  Homeowner_PK PRIMARY KEY(hName, webID) 
);

ALTER TABLE Homeowner
    ADD CONSTRAINT Homeowner_PK PRIMARY KEY (hName,webID);

CREATE TABLE Business
(
    bName       VARCHAR(20)     NOT NULL,
    webID       INT             NOT NULL,
    bEmail      VARCHAR(20)     NOT NULL,
    bAddress    VARCHAR(60),
    bPhoneNum   VARCHAR(10)
--     CONSTRAINT  Business_PK PRIMARY KEY(bName, webID)
);

ALTER TABLE Business
    ADD CONSTRAINT Business_PK PRIMARY KEY (bName,webID);


CREATE TABLE Home_Service
(
    serviceNeed VARCHAR(15)     NOT NULL,
    hName       VARCHAR(20)     NOT NULL,
    web1ID      INT             NOT NULL,
    serviceDate DATE            NOT NULL,
    serviceLoc  VARCHAR(30),
    CONSTRAINT  Home_Service_PK PRIMARY KEY(serviceNeed)
);

ALTER TABLE Home_Service   
    ADD CONSTRAINT  Home_Service_FK FOREIGN KEY(hName,web1ID) REFERENCES Homeowner (hName, webID);


CREATE TABLE Business_Service
(
    serviceType VARCHAR(15)     NOT NULL,
    b1Name      VARCHAR(20)     NOT NULL,
    web1ID      INT             NOT NULL,
    serviceRate FLOAT           NOT NULL,
    startDate   DATE,
    CONSTRAINT  Business_Service_PK PRIMARY KEY(serviceType, serviceRate)
   
);

ALTER TABLE Business_Service
    ADD CONSTRAINT  Business_Service_FK FOREIGN KEY (b1Name,web1ID) REFERENCES Business (bName,webID);