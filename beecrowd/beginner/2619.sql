select prod.name, prov.name, prod.price from products prod
inner join providers prov on prod.id_providers = prov.id
inner join categories c on prod.id_categories = c.id
where c.name = 'Super Luxury' and prod.price > 1000;