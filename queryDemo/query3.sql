SELECT C.custID, C.name
FROM Customer C, Visit V
WHERE C.custID = V.custID
	AND V.custArrive >= TIMESTAMP '2018-12-18 8:00:00'
	AND V.custDepart <= TIMESTAMP '2018-12-21 23:00:00'
	GROUP BY C.custID, C.name
	HAVING COUNT(*) >= 2
;