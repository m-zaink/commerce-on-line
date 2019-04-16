-- 12. Write trigger to check that a product is not sent to a warehouse that doesn’t have enough capacity.

-- delimiter //
-- create or replace trigger before_sending_to_warehouse
-- before insert on warehouse
-- DECLARE
-- int totalCapacity;
-- int capacity;
-- cursor c is select capacity from warehouse;
-- BEGIN
--     set totalCapacity = 0;
--     for capacity in c loop
--         totalCapacity = totalCapacity + capacity;
    
--     if (totalCapacity -


-- 13.Write a trigger to disallow storage of products in the warehouse that cost lesser than 10 rupees.