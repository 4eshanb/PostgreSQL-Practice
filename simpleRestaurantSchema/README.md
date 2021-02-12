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
1. In menuItem, price must be positive. The constraint is named positivePrice.  
  

2. In visit, custArrive must be less than or equal to custDepart.  

  
3. In dinnerTable, if inUse is not NULL, then numSeats must greater than 0.  
  

These commands are in general.sql  

## Unit Tests
Unit tests are important for verifying that constraints are working as you expect. 

> For each of the 3 foreign key constraints, an INSERT command that violates the foreign key constraint (and elicits an error).  

> For each of the 3 general constraints, 2 unit tests are written:  
 &ensp;An UPDATE command that meets the constraint.  
 &ensp;An UPDATE command that violates the constraint (and elicits an error).  
  
These 9 unit tests, in the order given above, are in the file unittests.sql.

## Create a view
Although the visit table has a cost field, there’s another way to calculate the cost of a visit. For each
visitID, there may be billEntry tuples for that visitID. Each billEntry tuple has a quantity, and each billEntry
tuple has a menuItemID that identifies a menuItem tuple that has a price. So the calculatedCost of a visit can be
calculated by adding up price*quantity for all of the billEntry tuples for that visit.  
  
A view called costView is created that has 2 attributes, visitID and calculatedCost. This view has a tuple
for each visitID that gives the calculated cost for that visitID. The view has no duplicates in it.
A GROUP BY is needed in the view.  
  
What happens if there’s a visitID for which there are no billEntry tuples?    
There still is a tuple for that visitID in the costView, and that tuple’s calculatedCost is 0.  
  
The script for creating the costView view is saved in a file called createview.sql.

## Query view

Let’s define a Frequent Customer to be a customer who visited at least 3 times. For some visits, the cost
that appears in the visit table is not the same as the calculatedCost in the costView view. The visitID, customer name, cost and calculatedCost is output 
for each visit that was made by a Frequent Customer in which the cost and calculatedCost are different. 
In the result, the attributes appear as visitID, customerName, cost and calculatedCost. 
No duplicates appear in the result.  
  
Before running this query, recreate the Lab3 schema once again using the create.sql script,
and load the data using the script data.sql. That way, any changes done for previous
parts of Lab3 (e.g., Unit Test) won’t affect the results of this query. Then the results of that query are wriiten in a
comment.  
  
Commands that delete just the tuples that have the following primary keys from the billEntry table are written:
• the tuple with visitID 10, menuItem 3  
• the tuple with visitID 2, menuItem 1  
  
The “Incorrect Costs for Frequent Customers” query is ran once again after those deletions. The output of
the query is written in a second comment. 
  
These commands are in the script named queryview.sql. 

## Create an index
Indexes are data structures used by the database to improve query performance. Locating all of tuples in the
billEntry table for a particular menuItem might be slow if the database system has to search the entire billEntry
table. To speed up that search, an index named LookUpBillItems is created over the menuItemID and quantity
columns (in that order) of the billEntry table.  
The command is saved in the file createindex.sql.  
  
Of course, one can run the same SQL statements whether or not this index exists; having indexes just changes
the performance of SQL statements. But the index could make it faster to search for the billEntry entries in
which a particular menuItem had been ordered with a quantity that was 3 or more.
  
This assignment was for cse 180 at UCSC with Professor Sheldon Finkelstein.