-- 10.Write a procedure to display the list of all orders done in a year
delimiter //
create procedure spDisplayAllOrders(localyear int)
begin
    select
        order_no, order_date , c_id , payment_mode
    from
        orders
    where
  year(order_date) = localyear;
end
// 
delimiter ;
-- 11.Write a procedure to display all customers that have ordered items from our system.

delimiter //
create procedure spDisplayAllCustomers()
begin
    select c.customer_id , c.customer_name , c.customer_email
    from customer as c, orders as o
    where o.c_id = c.customer_id;
end
//
delimiter ;

-- 12.Write trigger to check that a product is not sent to a warehouse that doesn’t have enough capacity.
-- 13.Write a trigger to disallow storage of products in the warehouse that cost lesser than 10 rupees.