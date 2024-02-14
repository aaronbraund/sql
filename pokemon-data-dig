SELECT name, MAX(attack) as max_attack
FROM pokemon;

SELECT name, attack, speed
FROM pokemon
WHERE attack > 170 OR speed >150;

SELECT COUNT(*) AS pokemon,
CASE
    WHEN attack > 150 THEN 'S Tier'
    WHEN attack > 120 THEN 'A Tier'
    WHEN attack > 100 THEN 'B Tier'
    WHEN attack > 80 THEN 'C Tier'
    WHEN attack > 60 THEN 'D Tier'
    WHEN attack > 40 THEN 'E Tier'
    ELSE 'Weaklings'
    END AS poke_attack_tiers
FROM pokemon
GROUP BY poke_attack_tiers;

SELECT MIN(attack) FROM pokemon;

SELECT COUNT(name) FROM pokemon;

SELECT SUM(attack) FROM pokemon;

SELECT SUM(attack)/COUNT(name) AS average_attack FROM pokemon;

SELECT name, legendary
FROM pokemon
WHERE legendary = "True" AND attack > 150;

SELECT name, Type_1, Type_2
FROM pokemon
GROUP BY Type_1
HAVING HP > 100
