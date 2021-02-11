ALTER TABLE visit
    ADD FOREIGN KEY (dinnerTableID) REFERENCES dinnerTable,
    ADD FOREIGN KEY (custID) REFERENCES customer
        ON DELETE CASCADE,
    ADD FOREIGN KEY (serverID) REFERENCES server
        ON UPDATE CASCADE
        ON DELETE SET NULL;