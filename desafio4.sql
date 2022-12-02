SELECT username AS usuario, IF(MAX(Year(date_musics)) < 2021 , 'Usuário inativo', 'Usuário ativo')
AS status_usuario
FROM SpotifyClone.User AS u INNER JOIN
SpotifyClone.History AS h ON
u.id_user=h.User_id_history 
GROUP BY User_id_history ORDER BY username;