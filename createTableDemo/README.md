# Create Table

These tables are for a very simplified version of a Restaurant database, with tables for customer, menutItem, dinnerTable, 
visit, server, and billEntry.  
  
customer(<ins>custID</ins>, name, address, joinDate, status)  
&ensp;A customer has an ID, a name, the date when they joined as a restaurant customer, and a status.  
  
menuItem(<ins>menuItemID</ins>, name, description, price)  
&ensp;A menu item describes an item that appears on the restaurant’s menu. Each menuItem tuples has
an ID, a name, a description and a price.  
  
dinnerTable(<ins>dinnerTableID</ins>, numSeats, InUse)  
&ensp;The dinner tables in the restaurant are described by the dinnerTable table, which has an ID,
number of seats, and an indication of whether the table is currently being used.

server(<ins>serverID</ins>, name, level, salary)  
&ensp;A server is a person employed by the restaurant to take care of meal service. Each sever has an
ID, a name, a level, and a salary.  
  
visit(<ins>visitID</ins>, custID, dinnerTableID, serverID, numPeople, cost, custArrive, custDepart)  
&ensp;A visit describes a visit by a customer to the restaurant. Each visit has an ID, and provides
information about the visit, including IDs for the customer, the dinnerTable, the server, as well as
the number of people served, the cost of the meal, and the timestamps for the arrival and
departure of that visit. That customer must appears in the customer table. That dinnerTable must appear in the dinnerTable table. That server must appear in the server table.  
  
billEntry(<ins>visitID</ins>, <ins>menuItemID</ins>, quantity)  
&ensp;A billEntry describes a menu item during a visit, providing both the ID of the visit and the
menuItem, as well as the quantity. For example, during a single visit a customer might have
ordered Shanghai Dumplings 3 times. That visit must appear in the visit table. That menu item must appear in the menuItem table.  
  
The underlined attribute (or attributes) identifies the primary key of the table.
billEntry does not have 2 primary keys; it has a key that consists of 2 attributes.  
  
This assignment was for cse 180 at UCSC with Professor Sheldon Finkelstein.