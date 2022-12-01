SELECT COUNT(id_music)AS cancoes,
(
SELECT COUNT(id_artist)
FROM SpotifyClone.Artist
)AS artistas,
(
SELECT COUNT(id_album) FROM
SpotifyClone.Album
) AS albuns
FROM
SpotifyClone.Music