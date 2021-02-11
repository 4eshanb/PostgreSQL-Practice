SELECT V.visitID, C.name AS custName, S.name AS serverName 
FROM Customer C, Visit V, Server S, DinnerTable T
WHERE V.serverid = S.serverid
	and V.custid = C.custid
	and V.dinnertableid = T.dinnertableid
	AND V.cost >= 200
	AND S.level IS NOT NULL
	AND V.numPeople =  T.numSeats
;