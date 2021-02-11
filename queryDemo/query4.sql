SELECT B.visitID, B.menuItemID, M.name AS menuItemName, M.price * B.quantity AS totalItemCost
FROM BillEntry B, MenuItem M
WHERE M.menuItemID = B.MenuItemID
;