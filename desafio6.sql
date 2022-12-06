SELECT MIN(value) AS faturamento_minimo, 
( MAX(value) ) AS faturamento_maximo ,
(SELECT ROUND(AVG(value), 2) FROM SpotifyClone.Plan INNER JOIN
SpotifyClone.User ON plan_id = id_plan) AS faturamento_medio,
(SELECT SUM(value) FROM SpotifyClone.Plan INNER JOIN
SpotifyClone.User ON plan_id = id_plan) AS faturamento_total
FROM SpotifyClone.Plan 