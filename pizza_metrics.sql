-- number of pizzas ordered
select count(pizza_id) as n_pizzas
from customer_orders;

-- unique customer orders
select count(distinct order_id) as n_orders
from customer_orders;

-- total number of pizzas delivered in a single order
select 
count(co.pizza_id) as n_pizzas
from runner_orders ro join customer_orders co
on ro.order_id = co.order_id
where ro.cancellation is null;

-- pizzas with exclusions and extra toppings.
select 
count(co.pizza_id) as n_pizzas
from customer_orders co join runner_orders ro
on co.order_id = ro.order_id
where ro.cancellation is null
and co.exclusions is not null
and co.extras is not null;