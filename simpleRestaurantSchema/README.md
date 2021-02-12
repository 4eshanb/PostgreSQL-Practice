# Simple Restaurant Schema

## Tables
customer(<ins>custID</ins>, name, address, joinDate, status)  
menuItem(<ins>menuItemID</ins>, name, description, price)  
dinnerTable(<ins>dinnerTableID</ins>, numSeats, InUse)  
server(<ins>serverID</ins>, name, level, salary)  
visit(<ins>visitID</ins>, custID, dinnerTableID, serverID, numPeople, cost, custArrive, custDepart)  
billEntry(<ins>visitID</ins>, menuItemID, quantity)  
modifyVisit(<ins>visitID</ins>, custID, dinnerTableID, serverID, numPeople)  
  
The primary key for each table is underlined. Run both create.sql and data.sql before running other parts of lab.

## Combine Data
For each “new customer” tuple in modifyVisit, there might already be a tuple in the visit table that has the same
visitID. If there isn’t a tuple with the same visitID , then this is a new visit that should be inserted. If there
already is a tuple with that visitID, then this is an update of information about that visit tuple. So here are the
actions that taken:
1. If there isn’t already a tuple in the visit table that has that visitID, then a tuple is inserted into the visit table
corresponding to that modifyVisit tuple; visitID, custID, dinnerTableID, serverID and numPeople, are used as
provided in the modifyVisit tuple; custArrive is set to be the current time; cost and custDepart are set to NULL.  
  

2. If there already is a tuple in the visit table that has that visitID, then the visit table is updated based on that
modifyVisit tuple; custArrive, custDepart or cost for that visit aren't changed. But, custID,
dinnerTableID, serverID and numPeople are updated based on the values of those attributes in the modifyVisit tuple.  
  

##  Foreign Key Constraints
Note, before running foreign.sql, general.sql, and unittests.sql, recreate the Lab3 schema using the create.sql
script, and load the data using the script data.sql. That way, any database changes that are
done for Combine won’t propagate to these other parts of Lab3.  
Foreign Key Constraints are also referred to as Referential Integrity constraints.
Note that, for example, when we say that a customer in the visit table must appear in the customer table, that refers to the
custID field in both tables.  
  
1. Each dinnerTableID that’s in the visit table must appear in the dinnerTable table. If there are visits for
a particular dinner table, then updates or deletions of the corresponding dinnerTableID attribute tuple
in the dinnerTable table are rejected.  
  

2. Each custID that’s in the visit table must appear in the customer table. If a tuple in the customer table
is deleted, then all visits for the corresponding custID are deleted. If there are visits for a
particular custID, then any update of the custID in the customer table is rejected.  
  

3. Each serverID that’s in the visit table must appear in the server table. If the serverID for a tuple in the
server table is updated, then all visits for the corresponding serverID are updated the same way.
If a tuple in the serverID table is deleted, then any tuples in the visits table corresponding to that
serverID have their serverID field set to NULL.  
  
These commands are in foreign.sql   

## General Constraints
1.In menuItem, price must be positive. The constraint is named positivePrice.  
  

2. In visit, custArrive must be less than or equal to custDepart.  

  
3. In dinnerTable, if inUse is not NULL, then numSeats must greater than 0.  
  

These commands are in general.sql  