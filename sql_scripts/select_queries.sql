-- 1. Get all the products which were ordered before ‘2018’.

select p.id , p.name , o.order_date
from product p , orders o
where p.id=o.p_id and o.order_date < '2018'  ; 


-- 2.Get the customers who have got the products from the specific brand ‘abc’

select c.customer_name
from customer c , seller_brands sb , sells s , orders o 
where 
    o.c_id = c.customer_id 
    and 
    sb.seller_id = s.s_id 
    and 
    o.p_id = s.p_id 
    and
    sb.brand = 'abc' ; 

-- 3.What are the names of the customers who have bought products that cost the maximum to be stored in the warehouse.

select distinct c.customer_name
from customer c , orders o  , stored_in w
where c.customer_id = o.c_id and o.p_id = w.p_id and w.cost = (
    select max(cost) from stored_in
) ; 

-- 4.Get the list of all those products which cost more than 1000 units to be stored.

select p.id , p.name 
from product p , stored_in w
where w.cost>1000 ; 

-- 5.Who are all those sellers who have subscribed for the warehouse that contain the maximum storage capacity.

select s.seller_id , s.seller_name
from seller s , warehouse w , subscribes_for sb
where sb.s_id = s.seller_id and sb.w_id=w.warehouse_id and w.capacity=(select max(capacity) from warehouse) ; 


-- 6.Who are those sellers that sell the costliest products.
select s.seller_id , s.seller_name
from seller s , sells sp , product p 
where s.seller_id = sp.s_id and sp.p_id  = p.id and sb.cost = (select max(cost) from sells) ; 


-- 7.Who are those sellers that sell the maximum number of products.


-- 8.List all the orders that are still in-transit
select * from orders where order_status = 'in-transit' ; 


-- 9.What products are brought by the customer whose email is ‘customer@gmail.com’
select p.id , p.name 
from customer c , product p , orders o 
where o.p_id = c.customer_id and o.p_id=p.id c.email='customer@gmail.com' ; 

