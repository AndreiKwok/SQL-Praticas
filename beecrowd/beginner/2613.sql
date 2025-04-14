select mov.id, mov.name from movies mov 
inner join prices p on mov.id_prices = p.id
where p.value < '2.00';