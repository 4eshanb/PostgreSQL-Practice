
SELECT V.visitID, C.name AS customerName, V.cost, CV.calculatedCost
FROM costView CV, visit V, customer C
WHERE V.custID in (SELECT custID FROM visit GROUP BY custID HAVING COUNT(*) >= 3)
    AND V.visitID = CV.visitID
    AND C.custID = V.custID
    AND V.cost != CV.calculatedCost
;


--visitid |  customername   |  cost  | calculatedcost
-----------+-----------------+--------+----------------
--       2 | Indiana Jones   | 950.00 |         458.92
--       3 | Sherlock Holmes | 950.00 |        1000.17
--       8 | Sherlock Holmes | 228.00 |          18.50
--       6 | Sherlock Holmes |  53.00 |         466.69
--      11 | Indiana Jones   | 950.00 |         448.92
--       7 | Sherlock Holmes | 150.00 |         116.69
--       1 | Indiana Jones   | 950.00 |         458.92
--(7 rows)

DELETE FROM billEntry
    WHERE visitID = 10
    AND menuItemID = 3;

DELETE FROM billEntry
    WHERE visitID = 2
    AND menuItemID = 1;


--visitid |  customername   |  cost  | calculatedcost
-----------+-----------------+--------+----------------
--       2 | Indiana Jones   | 950.00 |         234.46
--       3 | Sherlock Holmes | 950.00 |        1000.17
--       8 | Sherlock Holmes | 228.00 |          18.50
--       6 | Sherlock Holmes |  53.00 |         466.69
--      11 | Indiana Jones   | 950.00 |         448.92
--       7 | Sherlock Holmes | 150.00 |         116.69
--       1 | Indiana Jones   | 950.00 |         458.92
--(7 rows)


--Do you get a different answer?
-- Yes, the visitid 2 tuple reduced calculated cost to 234.46. This 
-- is because the second delete is deleting one bill entry for visitid 2.
-- The first delete does not make a difference because visit 10(visitID) is from
-- customer 7(custID), who does not have more than 3 visits and therefore is not 
-- a frequent customer.