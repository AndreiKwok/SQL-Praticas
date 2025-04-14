select * from league;

select * from players;
/*
1.Selecionar Todos os Times
Escreva uma query para mostrar todos os times da tabela league.

2.Filtrar por Posi��o
Mostre os times que est�o entre a 5� e a 10� posi��o.

3.Contar N�mero de Times
Quantos times existem na liga?

4.M�dia de Gols por Time
Usando a tabela players, calcule a m�dia de gols por time.

5.Jogadores com Mais de 10 Participa��es em Gols
Liste jogadores cuja soma de gols e assist�ncias seja maior que 10.

6.Times sem Jogadores Cadastrados
Liste os times da league que n�o t�m jogadores na tabela players.

7.Ranking de Efici�ncia
Crie um ranking de jogadores baseado na f�rmula (goals * 2) + assists, ordenando do maior para o menor.

8.Posi��o vs. Desempenho
Compare a posi��o do time na league com o total de gols dos seus jogadores (use JOIN).

9.Diferen�a de Gols
Calcule a diferen�a entre o n�mero de gols do artilheiro e a m�dia de gols da liga.

10.Rebaixamento e Promo��o
Crie uma query que:

Mostre os 3 primeiros times como "Podium: [team]".

Mostre os 2 �ltimos como "Demoted: [team]".

Ordene os resultados para que o p�dio apare�a primeiro.

11.Janela de Desempenho
Mostrar os gols de cada jogador.
Mostrar a m�dia de gols do time ao qual o jogador pertence (usando fun��es de janela).

12.OTIMIZA��O DE CONSULTA
Escreva uma query que encontre o time com a maior quantidade de jogadores com mais de 5 gols, mas sem usar subconsultas no WHERE.
*/
--1
select team from league;

--2
select position,team from league
where position between 5 and 10;

--3
select count(team) as 'Count Time' from league;

select * from players;

--4
select p.team, avg(p.goals) as 'Mean Goals'
from players p 
group by p.team
order by [Mean Goals] desc;

--5
select player_name, goals + assists as 'total_apparence'
from players 
where goals + assists > 10
order by total_apparence desc;


--6
select l.team 
from league l left join players p
on l.team = p.team 
where p.team is null;

--7 
select team, player_name, (goals * 2) + assists as 'ranking'
from players 
order by ranking desc;

--8
select l.position, l.team, p.goals
from league l 
inner join players p 
on l.team = p.team
order by p.goals desc;

--9
select * from players;
select max(goals) as 'artilheiro', avg(goals) as 'Mean goals in league', 
max(goals) - avg(goals) as 'Difference'
from players;


-- 10
select position ,name
from (
	select
	1 as sort_order,
	l1.position as position,concat('Podium:', l1.team) as name
	from league l1
	where l1.position <= 3
	
	union all
	
	select
	2 as sort_order,
	l2.position as position, concat('Demoted:', l2.team) as name
	from league l2
	--where l2.position >= 2
	order by l2.position desc 
	offset 0 rows
	fetch next 2 rows only) as combined
	order by sort_order,position;

-- 11
select team, player_name, goals as 'goals_player', avg(goals) over
(partition by team) as 'mean_goals_team'
from players
order by mean_goals_team;

-- 12
select top 1 team, count(*) as 'players with more five goals'
from players where goals > 5
group by team
order by [players with more five goals] desc;