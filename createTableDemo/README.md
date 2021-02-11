# Create Table

These tables are for a very simplified version of a Restaurant database, with tables for customer, menutItem, dinnerTable, 
visit, server, and billEntry.

customer(<u custID>, name, address, joinDate, status)
menuItem(menuItemID, name, description, price)
dinnerTable(dinnerTableID, numSeats, InUse)
server(serverID, name, level, salary)
visit(visitID, custID, dinnerTableID, serverID, numPeople, cost, custArrive, custDepart)
billEntry(visitID, menuItemID, quantity)

This assignment was for cse 180 at UCSC with Professor Sheldon Finkelstein.