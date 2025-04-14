SELECT prod.name, prov.name from products prod
inner join providers prov on prod.id_providers = prov.id
where prod.id_categories = '6';