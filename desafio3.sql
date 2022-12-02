SELECT u.username AS usuario, COUNT(h.User_id_history) AS qt_de_musicas_ouvidas, 
SUM(ROUND(m.duration / 60, 2)) AS total_minutos
FROM SpotifyClone.User AS u
INNER JOIN SpotifyClone.History AS h
ON h.User_id_history = u.id_user INNER JOIN 
SpotifyClone.Music AS m 
ON h.Music_id_music = m.id_music
GROUP BY User_id_history, username ORDER BY username;