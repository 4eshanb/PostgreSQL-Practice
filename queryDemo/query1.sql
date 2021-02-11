SELECT DISTINCT name, address
FROM Customer
WHERE status = 'H' 
	AND name LIKE '%n'
;

-- there is a not null constraint on the name column and
-- address can be nullable, and there is a unique constraint 
-- on name and address. Therefore, if name is the same and address is null
-- you will see multiple records without the distinct in the select.