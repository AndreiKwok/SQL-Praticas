SELECT name FROM (
    SELECT 1 AS sort_order, CONCAT('Podium: ', team) AS name, position
    FROM league
    WHERE position <= 3
    UNION ALL
    SELECT 2 AS sort_order, CONCAT('Demoted: ', team) AS name, position
    FROM (
        SELECT team, position
        FROM league
        ORDER BY position DESC
        LIMIT 2
    ) AS demoted
) AS combined
ORDER BY sort_order, position;