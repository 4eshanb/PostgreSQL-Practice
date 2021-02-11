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