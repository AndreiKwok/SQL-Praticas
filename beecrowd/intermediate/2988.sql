SELECT 
    t.name,
    COUNT(m.id) AS partidas,
    SUM(
        CASE 
            WHEN (t.id = m.team_1 AND m.team_1_goals > m.team_2_goals) 
              OR (t.id = m.team_2 AND m.team_2_goals > m.team_1_goals) 
            THEN 1 ELSE 0 
        END
    ) AS vitorias,
    SUM(
        CASE 
            WHEN (t.id = m.team_1 AND m.team_1_goals < m.team_2_goals) 
              OR (t.id = m.team_2 AND m.team_2_goals < m.team_1_goals) 
            THEN 1 ELSE 0 
        END
    ) AS derrotas,
    SUM(
        CASE 
            WHEN m.team_1_goals = m.team_2_goals THEN 1 ELSE 0 
        END
    ) AS empates,
    (SUM(
        CASE 
            WHEN (t.id = m.team_1 AND m.team_1_goals > m.team_2_goals) 
              OR (t.id = m.team_2 AND m.team_2_goals > m.team_1_goals) 
            THEN 3 ELSE 0 
        END
    ) + SUM(
        CASE 
            WHEN m.team_1_goals = m.team_2_goals THEN 1 ELSE 0 
        END
    )) AS pontos
FROM teams t
LEFT JOIN matches m ON t.id = m.team_1 OR t.id = m.team_2
GROUP BY t.name
ORDER BY pontos DESC;
