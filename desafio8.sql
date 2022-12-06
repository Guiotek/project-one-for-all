SELECT name AS artista, album_name AS album FROM SpotifyClone.Artist INNER JOIN SpotifyClone.Album 
ON id_artist=A_id_artist  
WHERE name='Elis Regina' ORDER BY album_name