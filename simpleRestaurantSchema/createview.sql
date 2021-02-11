
CREATE VIEW costView AS 
    SELECT V.visitID,
	    CASE
		    WHEN SUM(B.quantity * M.price) IS NULL THEN 0 
		    ELSE SUM(B.quantity * M.price)
	    END AS calculatedCost
    FROM visit V
    LEFT OUTER JOIN billEntry B ON V.visitID = B.visitID
    LEFT OUTER JOIN menuItem M ON M.menuItemID = B.menuItemID
    GROUP BY V.visitID;