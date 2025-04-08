CREATE TABLE Mapping (
    `table` VARCHAR(255),
    old_key VARCHAR(255),
    new_key VARCHAR(255) NOT NULL UNIQUE,

    PRIMARY KEY(`table`, old_key)
);

CREATE INDEX mapping_index ON Mapping(`table`, old_key);
