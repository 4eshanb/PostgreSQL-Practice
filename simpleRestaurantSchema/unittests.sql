INSERT INTO visit
(visitid, custid, dinnertableid, serverid, numpeople, cost, custarrive, custdepart)
VALUES(12, 10, 1000, 5, 10, 110, null, null);


INSERT INTO visit
(visitid, custid, dinnertableid, serverid, numpeople, cost, custarrive, custdepart)
VALUES(12, 100, 8, 5, 10, 110, null, null);


INSERT INTO visit
(visitid, custid, dinnertableid, serverid, numpeople, cost, custarrive, custdepart)
VALUES(12, 10, 8, 50, 10, 110, null, null);

-- meets constraint
UPDATE menuItem
    SET price = 10;

-- violates constraint
UPDATE menuItem
    SET price = -1;

-- meets constraint
UPDATE visit
    SET custArrive = custDepart;

-- violates constraint
UPDATE visit
    SET custDepart = CURRENT_TIMESTAMP, custArrive = CURRENT_TIMESTAMP + '1';

-- meets constraint
UPDATE dinnerTable
    SET inUse = TRUE, numSeats = 1;

-- violates constraint
UPDATE dinnerTable
    SET inUse = TRUE, numSeats = -1;
