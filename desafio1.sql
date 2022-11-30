DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;
  
CREATE TABLE SpotifyClone.User(
      id_user INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      username VARCHAR(100) NOT NULL,
      age INT NOT NULL
  ) engine = InnoDB;

CREATE TABLE SpotifyClone.Plan(
      plan_name VARCHAR(100) NOT NULL,
      value_plan DECIMAL(19,2),
   User_id_plan INT,
    FOREIGN KEY (User_id_plan)
    REFERENCES SpotifyClone.User (id_user)
 )engine = InnoDB;

 CREATE TABLE SpotifyClone.Artist (
  id_artist INT NOT NULL PRIMARY KEY,
  artist_name VARCHAR(100) NOT NULL,
 )ENGINE = InnoDB;

 CREATE TABLE SpotifyClone.Album (
  id_album INT NOT NULL PRIMARY KEY,
  name_album VARCHAR(100) NOT NULL,
  artist_id_artist INT,
    FOREIGN KEY (artist_id_artist)
    REFERENCES SpotifyClone.Artist (id_artist)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.Musics (
  id_music INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  music_name VARCHAR(255) NOT NULL,
  album_id_album INT NOT NULL,
  duration INT NOT NULL,
    FOREIGN KEY (album_id_album)
    REFERENCES SpotifyClone.Album (`id_album`)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.History (
  datetime DATETIME NOT NULL,
  users_id_users INT NOT NULL,
  musics_id_music INT NOT NULL,
  musics_id_history INT NOT NULL,
    FOREIGN KEY (users_id_users)
    REFERENCES SpotifyClone.User (id_user),
    FOREIGN KEY (musics_id_music)
    REFERENCES SpotifyClone.Musics (id_music)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.Follow (
  artista_id_artist INT,
  users_id_users INT,
    FOREIGN KEY (artista_id_artist)
    REFERENCES SpotifyClone.Artista (id_artist),
    FOREIGN KEY (users_id_users)
    REFERENCES SpotifyClone.User (id_user)
)ENGINE = InnoDB;

   INSERT INTO SpotifyClone.Plan (plan_name, value_plan)
  VALUES
    ('gratuito', '0.00'),
    ('gratuito', '0.00'),
    ('familiar', '7.99'),
    ('familiar', '7.99'),
    ('familiar', '7.99'),
    ('universitário', '5.99'),
    ('universitário', '5.99'),
    ('pessoal', '6.99'),
    ('pessoal', '6.99'),
    ('pessoal', '6.99');

  INSERT INTO SpotifyClone.User (username, age) VALUES
    ('Barbara Liskov', '82'),
    ('Robert Cecil Martin', '58'),
    ('Ada Lovelace', '37'),
    ('Martin Fowler', '46'),
    ('Sandi Metz', '58'),
    ('Paulo Freire', '19'),
    ('Bell Hooks', '26'),
    ('Christopher Alexander', '85'),
    ('Judith Butler', '45'),
    ('Jorge Amado', '58');