-- create table customer(
--     customer_id int not null,
--     customer_name varchar(50) not null, 
--     customer_email varchar(50) not null,
--     constraint pk_customer primary key(customer_id),
--     constraint validate_email check(customer_email like '%@%.com')
-- );


-- create table warehouse(
--     warehouse_id varchar(50) not null, 
--     warehouse_name varchar(50) not null,
--     capacity int,
--     constraint pk_warehouse primary key(warehouse_id),
--     constraint validate_capacity check(capacity > 0)
-- );

-- create table subscribes_for(
--     s_id varchar(50), 
--     w_id varchar(50), 
--     constraint pk_subscribes_for primary key(s_id, w_id),
--     constraint fk_subscribes_for_seller foreign key(s_id) references seller(seller_id),
--     constraint fk_subscribes_for_warehouse foreign key(w_id) references warehouse(warehouse_id)
-- );

create table seller_brands (
    seller_id varchar(50) not null, 
    brand varchar(50) not null,
    constraint pk_seller_brands primary key(seller_id),
    constraint fk_seller_brands_seller foreign key(seller_id) references seller(seller_id)
);