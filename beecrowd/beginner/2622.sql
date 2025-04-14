select c.name from customers c 
where c.id in (select id_customers from legal_person);