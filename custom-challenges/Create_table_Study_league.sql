-- CREATE TABLE'S
CREATE TABLE league (
    position INT PRIMARY KEY,
    team VARCHAR(255) NOT NULL
);

INSERT INTO league (position, team) VALUES
(1, 'The Quack Bats'),
(2, 'The Responsible Hornets'),
(3, 'The Bawdy Dolphins'),
(4, 'The Abstracted Sharks'),
(5, 'The Nervous Zebras'),
(6, 'The Oafish Owls'),
(7, 'The Unequaled Bison'),
(8, 'The Keen Kangaroos'),
(9, 'The Left Nightingales'),
(10, 'The Terrific Elks'),
(11, 'The Lumpy Frogs'),
(12, 'The Swift Buffalo'),
(13, 'The Big Chargers'),
(14, 'The Rough Robins'),
(15, 'The Silver Crocs');

CREATE TABLE players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(255),
    team VARCHAR(255),
    goals INT,
    assists INT
);

INSERT INTO players (player_id, player_name, team, goals, assists) VALUES
(1, 'John Doe', 'The Quack Bats', 10, 5),
(2, 'Jane Smith', 'The Responsible Hornets', 8, 7),
(3, 'Bob Wilson', 'The Bawdy Dolphins', 5, 12),
(4, 'Alice Brown', 'The Abstracted Sharks', 15, 3),
(5, 'Charlie Green', 'The Nervous Zebras', 7, 9);