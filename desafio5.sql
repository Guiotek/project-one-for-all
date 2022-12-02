SELECT music_name AS cancao, COUNT(Music_id_music) AS reproducoes FROM SpotifyClone.Music
INNER JOIN SpotifyClone.History ON
id_music=Music_id_music
WHERE id_music=8 OR id_music=10 GROUP BY music_name ORDER BY music_name;