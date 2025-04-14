select prod.name, prov.name, c.name from products prod
inner join providers prov on prod.id_providers = prov.id
inner join categories c on prod.id_categories = c.id
where lower(prov.name) = 'sansul sa' 
and c.name = 'Imported';