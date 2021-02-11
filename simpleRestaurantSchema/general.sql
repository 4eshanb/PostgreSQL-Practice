ALTER TABLE menuItem
    ADD CONSTRAINT positivePrice 
        CHECK (price > 0);

ALTER TABLE visit
    ADD CHECK (custArrive <= custDepart);

ALTER TABLE dinnerTable
    ADD CHECK (inUse IS NULL OR numSeats > 0);