# SQL queries

## Tables
Refer to the createTableDemo folder in the previous directory. The tables created here are almost the same as those, 
but there are some additional UNIQUE constraints and some restrictions on NULL.

The following attributes cannot be NULL. All other attributes can be, aside from those in primary keys of course.
> In customer: name  
In menuItem: name  
In dinnerTable: numSeats  
  

Also, the following must be unique for the specified table. That is, there cannot be identical rows in that
table that have exactly the same (non-NULL) values for all of those attributes (composite unique
constraint).
> In customer: the 2 attributes name and address  
In menuItem: the attribute name  
In visit: the 2 attributes custID and custArrive  

  
For example, the third constraint says that there can’t be two rows in visit that have the same values for
both custID and custArrive, if both custID and custArrive are not NULL. Think of this as saying that
there can’t be two different visits by the same customer that have the same customer arrival timestamp

## Queries

### Query 1
The name and address for all customers whose status is ‘H’ (uppercase H) and whose name ends
with the letter ‘n’ (lowercase n) is found. No duplicates appear in the result.  
  
### Query 2
The name, description and price of each menuItem that appears on at least one billEntry is output. The
attributes in the result  appear as theName, theDescription and thePrice. No duplicates 
appear in the result.  
  
### Query 3
The custID and name for each customer who had at least two different visits that were between
December 18, 2018 at 8am and December 21, 2018 at 11pm is found. No duplicates appear in the result.  
  
### Query 4
The billEntry table has attributes visitID, menuItemID and quantity. The totalItemCost of a billEntry
(which is not an attribute) is the price of the billEntry’s menuItem multiplied by its quantity.
For each billEntry, its visitID, menuItemID, the name of that menuItem, and the billEntry’s
totalItemCost is output. The attributes in the result appear as visitID, menuItemID, menuItemName and
totalItemCost. No duplicates appear in the result.  
  
### Query 5
For each visit in which all of the following are true:
a) the cost is greater than or equal to two hundred. 
b) the server for the visit has a status that is not NULL. 
c) the number of people (numPeople) for the visit is equal to the number of seats (numSeats) at the
dinner table.  
The visitID the name of the customer and the name of the server is output. The customer’s name 
appears as custName and the server’s name appears as serverName in the result. No duplicates
appear in the result.  
  

This assignment was for cse 180 at UCSC with Professor Sheldon Finkelstein.
