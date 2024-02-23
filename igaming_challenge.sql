SELECT 
	player_id, registration_date
FROM 
	player
ORDER BY
	registration_date DESC;

SELECT DISTINCT
	status
FROM
	player;

SELECT 
	SUM(deposit_amount)
FROM 
	deposit
WHERE 
	deposit_date BETWEEN '2024-02-12' AND '2024-02-19';

SELECT 
	player.player_id, player.acquisition_channel, COUNT(deposit.deposit_timestamp) as deposit_count
FROM 
	player
LEFT JOIN 
	deposit ON player.player_id = deposit.player_id
GROUP BY 
        player.acquisition_channel;


SELECT deposit.deposit_amount
CASE
	WHEN deposit_amount > 0 and deposit_amount <= 20 THEN "Low Depositors"
	WHEN deposit_amount > 20 and deposit_amount <= 40 THEN "Medium Depositors"
	WHEN deposit_amount > 40 and deposit_amount <= 60 THEN "High Depositors"
	ELSE "VIP Depositors"
END as deposit_tiers
FROM 
	deposit
LEFT JOIN
ON 
	deposit.player_id = player.player_id AND player.registration_date > 2024-01-01	
WHERE 
	(player.status = "ACTIVE" or player.status = "TEST")
	AND deposit.deposit_date = '2024-02-19'
