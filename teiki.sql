----Artiste
INSERT INTO ARTIST_DIM VALUES (11,'Michael Jackson','09-Jun-1960','Pop','American',2241536,542316,'English',NULL,'03-Mar-2013');

------- Music
INSERT INTO MUSIC_DIM VALUES (22,'Billie Jean','Pop', '22-06-1983',300,'NO',120,'YES');
INSERT INTO MUSIC_DIM VALUES (23,'Beat it','Pop', '22-07-1983',240,'NO',120,'NO');

------ Stream
INSERT INTO SPOTIFY_STREAM VALUES (20180521,065421,2,22,11,1,3,'NO',21,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20180521,065900,2,22,11,1,3,'NO',210,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20180522,075321,2,23,11,1,2,'NO',60,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20180621,162421,2,17,8,1,1,'NO',67,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20181001,135411,2,17,8,1,2,'NO',211,34,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20180621,125454,2,22,21,1,3,'NO',300,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180811,131313,2,22,11,1,3,'NO',21,1,'NO');

INSERT INTO SPOTIFY_STREAM VALUES (20180410,065421,6,22,11,1,3,'NO',21,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20180527,142810,6,22,11,1,3,'NO',210,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20180528,235321,6,23,11,1,2,'NO',60,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20180601,162421,6,17,8,1,1,'NO',67,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20181001,135411,6,1,1,1,59,'YES',11,1,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20180621,125454,6,1,1,1,3,'NO',127,21,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180811,131313,6,22,11,1,3,'NO',21,3,'NO');

------ Subscription
INSERT INTO SPOTIFY_SUBSCRIPTION VALUES (20180215,2,1,3,6,0.00,NULL,NULL,NULL);
INSERT INTO SPOTIFY_SUBSCRIPTION VALUES (20180314,6,3,1,4,9.99,'03-Apr-2018',NULL,NULL);
