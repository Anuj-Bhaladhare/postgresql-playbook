-- =================================================
--          Most Widely used DataType;
-- =================================================

--   Numeric     - INT DOUBLE FLOAT DECIMAL
--   String      - VARCHAR
--   Date        - date
--   Boolean     - BOOLEAN

-- Constraint - A constraint in PostgresSQL in a rule applied to a column.

-- Primary Key - 
CREATE TABLE customers
(
    acc_no INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    acc_type VARCHAR(100) NOT NULL DEFAULT 'Savings'
);

-- AUTO_INCREMENT


