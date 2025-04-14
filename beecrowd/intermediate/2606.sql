select prod.id, prod.name from products prod
inner join categories cat on cat.name like 'super%' 
where cat.id = prod.id_categories;