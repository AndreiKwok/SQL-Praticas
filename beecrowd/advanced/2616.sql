select c.id, c.name from customers c 
where c.id not in (select id_customers from locations)
order by c.id;