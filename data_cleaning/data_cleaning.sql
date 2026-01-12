-- replaces the km substrings in the distance column with empty strings
begin transaction
update runner_orders
set distance = replace(distance, 'km', '');
commit

-- replaces null strings in the pickup_time and distance columns with nulls values.
begin transaction
update runner_orders
set pickup_time = null
where pickup_time = 'null';
commit

begin transaction
update runner_orders
set distance = null
where distance = 'null';
commit

-- replaces string nulls in the duration column with null values.
begin transaction 
update runner_orders
set duration = null
where duration = 'null';
commit

-- replaces with words minutes, minute, min, and mins in the duration column with empty strings.
begin transaction
update runner_orders
set duration = replace(
replace(
replace(
replace(duration, 'minutes', ''),
'minute', ''),
'min', ''),
'mins', '');
commit

-- replaces the remaining s with empty strings.
begin transaction
update runner_orders
set duration = replace(duration, 's', '');
commit

-- replaces null strings and empty strings in the cancellation column with null values with a
-- case expression.
begin transaction
update runner_orders
set cancellation = case
	when cancellation = 'null' or cancellation = '' then null
	else cancellation 
end;
commit

-- replaces null strings in the exclusions column with null values.
begin transaction
update customer_orders
set exclusions = null
where exclusions = 'null';
commit

-- replaces empty string in the exclusions column with null values.
begin transaction 
update customer_orders
set exclusions = null
where exclusions = '';
commit

-- replaces null strings in the extras column with null values.
begin transaction
update customer_orders
set extras = null
where extras = 'null';
commit

--replaces empty strings in the extras column with null values.
begin transaction 
update customer_orders
set extras = null
where extras= '';
commit
