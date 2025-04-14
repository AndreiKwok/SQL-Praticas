select prod.name, c.name from products prod 
inner join categories c on prod.id_categories = c.id
where prod.amount > 100 and c.id in (1, 2, 3, 6, 9)
order by c.id;