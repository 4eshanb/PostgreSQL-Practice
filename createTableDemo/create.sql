DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;

CREATE TABLE customer(       
custID INT,
name VARCHAR(40),
address VARCHAR(40),
joinDate DATE,
status CHAR(1),
PRIMARY KEY (custID),
UNIQUE (name, address)
);

CREATE TABLE menuItem(
menuItemID INT,
name VARCHAR(40),
description VARCHAR(60),
price NUMERIC(5,2),
PRIMARY KEY (menuItemID),
UNIQUE (name)
);

CREATE TABLE dinnerTable(
dinnerTableID INT,
numSeats INT,
InUse BOOLEAN,
PRIMARY KEY (dinnerTableID)
);

CREATE TABLE server(
serverID INT,
name VARCHAR(40),
level CHAR(1),
salary NUMERIC(6,2),
PRIMARY KEY (serverID)
);

CREATE TABLE visit(
visitID INT,
custID INT,
dinnerTableID INT,
serverID INT,
numPeople INT,
cost NUMERIC(6,2),
custArrive TIMESTAMP,
custDepart TIMESTAMP,
PRIMARY KEY (visitID),
UNIQUE (custID, custArrive),
FOREIGN KEY (custID) REFERENCES customer,
FOREIGN KEY (dinnerTableID) REFERENCES dinnerTable,
FOREIGN KEY (serverID) REFERENCES server
);

CREATE TABLE billEntry(
visitID INT,
menuItemID INT,
quantity INT,
PRIMARY KEY (visitID, menuItemID),
FOREIGN KEY (visitID) REFERENCES visit,
FOREIGN KEY (menuItemID) REFERENCES menuItem
);

