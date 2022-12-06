SELECT name AS artista, album_name AS album, COUNT(Artist_id_artist) AS seguidores FROM SpotifyClone.Artist 
INNER JOIN SpotifyClone.Album ON id_artist=A_id_artist 
INNER JOIN SpotifyClone.Follow ON Artist_id_artist=id_artist GROUP BY album_name, Artist_id_artist
ORDER BY COUNT(Artist_id_artist) DESC, name, album_name