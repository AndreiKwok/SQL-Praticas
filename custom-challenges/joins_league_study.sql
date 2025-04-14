/*
Praticando join`s
1.Crie uma query para listar todos os jogadores, mesmo que seu time não esteja na league.

2.Descubra quantos jogadores cada time tem (incluindo times sem jogadores).

3.Encontre jogadores que estão em times que não existem na league.

*/

-- 1
select * from league;
select * from players;


select l.team, p.player_name from players p
right join league l
on l.team = p.team;

--2
select l.team, count(p.player_id) as 'Qtd players'
from league l
left join players p 
on l.team = p.team
group by l.team
;

--3
select p.player_name
from players p
left join league l
on p.team = l.team
where l.team is null;

SELECT p.player_name
FROM players p
LEFT JOIN league l ON p.team = l.team
WHERE l.team IS NULL;