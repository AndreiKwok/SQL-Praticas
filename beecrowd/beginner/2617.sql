select prod.name, prov.name from providers prov
inner join products prod on prov.id = prod.id_providers 
where lower(prov.name) = 'ajax sa';