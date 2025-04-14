select c.name, r.rentals_date from customers c
inner join rentals r on c.id = r.id_customers
where extract(year from r.rentals_date) = 2016
and extract(month from r.rentals_date) = 9;