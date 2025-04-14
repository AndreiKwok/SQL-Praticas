select prod.name from providers prov 
inner join products prod on prov.id = prod.id_providers
where prov.name like 'P%' and prod.amount between 10 and 20;