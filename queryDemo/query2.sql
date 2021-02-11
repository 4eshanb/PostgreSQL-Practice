SELECT DISTINCT M.name AS theName, M.description AS theDescription, M.price AS thePrice
FROM MenuItem M, BillEntry E
WHERE E.menuItemID = M.menuItemID
;