DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE SpotifyClone.Plan (
  id_plan INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  plan_name VARCHAR(100) NULL,
  value DECIMAL(19,2) NULL
)ENGINE = InnoDB;
  
CREATE TABLE SpotifyClone.User (
  id_user INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(100) NOT NULL,
  age INT,
  plan_id INT,
  signature_date DATE NULL,
    FOREIGN KEY (plan_id)
    REFERENCES SpotifyClone.Plan (id_plan)
)ENGINE = InnoDB;



CREATE TABLE SpotifyClone.Artist (
  id_artist INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NULL
)ENGINE = InnoDB;

CREATE TABLE SpotifyClone.Album (
  id_album INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  album_name VARCHAR(100) NULL,
  Artist_id_artist INT NULL,
  CONSTRAINT fk_Album_Artist1
    FOREIGN KEY (Artist_id_artist)
    REFERENCES SpotifyClone.Artist (id_artist)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.Music(
  id_music INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  music_name VARCHAR(100) NULL,
  duration INT,
  year_music INT,
  Album_id_album INT NULL,
  CONSTRAINT fk_Music_Album1
    FOREIGN KEY (Album_id_album)
    REFERENCES SpotifyClone.Album (id_album)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.History (
  User_id_history INT NOT NULL,
  date_musics DATETIME NULL,
  Music_id_music INT NOT NULL,
  CONSTRAINT fk_History_User1
    FOREIGN KEY (User_id_history)
    REFERENCES SpotifyClone.User (id_user),
  CONSTRAINT fk_History_Music1
    FOREIGN KEY (Music_id_music)
    REFERENCES SpotifyClone.Music (id_music),
    CONSTRAINT PRIMARY KEY (User_id_history, Music_id_music)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.Follow (
  User_id_follow INT NOT NULL,
  Artist_id_artist INT NOT NULL,
  CONSTRAINT fk_Follow_User1
    FOREIGN KEY (User_id_follow)
    REFERENCES SpotifyClone.User (id_user),
  CONSTRAINT fk_Follow_Artist1
    FOREIGN KEY (Artist_id_artist)
    REFERENCES SpotifyClone.Artist (id_artist),
	CONSTRAINT PRIMARY KEY(User_id_follow, Artist_id_artist)
)ENGINE = InnoDB;

  INSERT INTO SpotifyClone.Plan (plan_name, value)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

  INSERT INTO SpotifyClone.User (username, age, plan_id) VALUES
    ('Barbara Liskov', '82', 1),
    ('Robert Cecil Martin', '58', 1),
    ('Ada Lovelace', '37', 2),
    ('Martin Fowler', '46', 2),
    ('Sandi Metz', '58', 2),
    ('Paulo Freire', '19', 3),
    ('Bell Hooks', '26', 3),
    ('Christopher Alexander', '85', 4),
    ('Judith Butler', '45', 4),
    ('Jorge Amado', '58', 4);

  INSERT INTO SpotifyClone.Artist (name) VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

  INSERT INTO SpotifyClone.Music (music_name, duration, year_music) VALUES
  ('BREAK MY SOUL', '279', '2022'),
  ('VIRGO’S GROOVE', '369', '2022'),
  ('ALIEN SUPERSTAR', '116', '2022'),
  ('Don’t Stop Me Now', '203', '1978'),
  ('Under Pressure', '152', '1982'),
  ('Como Nossos Pais', '105', '1998'),
  ('O Medo de Amar é o Medo de Ser Livre', '207', '2001'),
  ('Samba em Paris', '267', '2003'),
  ('The Bard’s Song', '244', '2007'),
  ('Feeling Good', '100', '2012');

  INSERT INTO SpotifyClone.Album (album_name) VALUES
  ('Renaissance'),
  ('Jazz'),
  ('Hot Space'),
  ('Falso Brilhante'),
  ('Vento de Maio'),
  ('QVVJFA?'),
  ('Somewhere Far Beyond'),
  ('I Put A Spell On You');

  INSERT INTO SpotifyClone.History (User_id_history, Music_id_music, date_musics) VALUES
  (1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10,'2020-03-06 11:22:33'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');

  INSERT INTO SpotifyClone.Follow (User_id_follow, Artist_id_artist) VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);