select c.name, o.id from customers c 
inner join orders o on c.id = o.id_customers
where extract(year from o.orders_date) = 2016 and extract(month from o.orders_date)
between 1 and 6;