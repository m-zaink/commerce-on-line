create table customer(
  customer_id varchar(50) not null,
  customer_name varchar(50) not null,
  customer_email varchar(50) not null,
  constraint pk_customer primary key(customer_id),
  constraint validate_email check(customer_email like '%@%.com')
);
create table product(
  id varchar(50) not null,
  name varchar(50) not null,
  type VARCHAR(50),
  constraint validate_type check(type in ('fragile', 'nonfragile')),
  constraint pk_product primary key (id)
);
create table warehouse(
  warehouse_id varchar(50) not null,
  warehouse_name varchar(50) not null,
  capacity int,
  constraint pk_warehouse primary key(warehouse_id),
  constraint validate_capacity check(capacity > 0)
);
create table seller(
  seller_id varchar(50),
  seller_name varchar(50),
  constraint pk_seller primary key(seller_id)
);
create table sells(
  s_id varchar(50),
  p_id varchar(50),
  cost int,
  constraint validate_cost check(cost >= 0),
  constraint pk_sells primary key(s_id, p_id),
  constraint fk_sells_product FOREIGN key(p_id) REFERENCES product(id)
);
create table subscribes_for(
  s_id varchar(50),
  w_id varchar(50),
  constraint pk_subscribes_for primary key(s_id, w_id),
  constraint fk_subscribes_for_seller foreign key(s_id) references seller(seller_id),
  constraint fk_subscribes_for_warehouse foreign key(w_id) references warehouse(warehouse_id)
);
create table seller_brands (
  seller_id varchar(50) not null,
  brand varchar(50) not null,
  constraint pk_seller_brands primary key(seller_id),
  constraint fk_seller_brands_seller foreign key(seller_id) references seller(seller_id)
);
create table stored_in(
  p_id VARCHAR(50),
  w_id VARCHAR(50),
  cost int,
  start_date DATE,
  constraint pk_stored_in primary key(p_id, w_id),
  constraint fk_stored_in_warehouse FOREIGN key(w_id) REFERENCES warehouse(warehouse_id),
  constraint fk_stored_in_product FOREIGN key(p_id) REFERENCES product(id)
);
create table orders(
  c_id VARCHAR(50),
  p_id VARCHAR(50),
  order_no VARCHAR(50),
  order_date date,
  payment_mode VARCHAR(50),
  order_status varchar(50),
  constraint pk_orders PRIMARY key(c_id, p_id),
  CONSTRAINT fk_orders_customer FOREIGN key(c_id) REFERENCES customer(customer_id),
  constraint fk_orders_product FOREIGN key(p_id) REFERENCES product(id),
  constraint validate_status check(
    order_status in ('pending', 'delivered', 'cancelled')
  )
);