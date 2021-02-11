--SELECT * 
--FROM visit;
--update happens before insert because if their order was switched, 
--the update statement would do unnecessary work.

UPDATE visit 
SET custID = modifyVisit.custID, dinnerTableID = modifyVisit.dinnerTableID, 
    serverID = modifyVisit.serverID, numPeople = modifyVisit.numPeople
FROM modifyVisit
WHERE visit.visitID = modifyVisit.visitID
;

INSERT INTO visit
       ( visitID, custID, dinnerTableID, serverId, numPeople, cost, custArrive, custDepart )
SELECT M.visitID, M.custID, M.dinnerTableID, M.serverID, M.numPeople, NULL, CURRENT_TIMESTAMP, NULL
FROM modifyVisit M
WHERE M.visitID NOT IN (SELECT V.visitID
                        FROM visit V
                        )
;
--UPDATE visit
--SET custArrive = CURRENT_TIMESTAMP, cost = NULL, custDepart = NULL
--FROM modifyVisit

--SELECT * 
--FROM visit;
