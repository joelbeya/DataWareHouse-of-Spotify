----Artiste
INSERT INTO ARTIST_DIM VALUES (11,'Michael Jackson','09-Jun-1960','Pop','American',2241536,542316,'English',NULL,'03-Mar-2013');

------- Music
INSERT INTO MUSIC_DIM VALUES (22,'Billie Jean','Pop', '22-06-1983',300,'NO',120,'YES');
INSERT INTO MUSIC_DIM VALUES (23,'Beat it','Pop', '22-07-1983',240,'NO',120,'NO');

------ Stream
INSERT INTO SPOTIFY_STREAM VALUES (43,6,2,22,11,1,3,'NO',21,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (43,54,2,22,11,1,3,'NO',210,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (43,1,2,23,11,1,2,'NO',60,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (46,546,2,17,11,1,1,'NO',67,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (46,333,2,17,11,1,2,'NO',211,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (65,5,2,22,21,1,3,'NO',300,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (65,1398,2,22,11,1,3,'NO',21,0,'NO');

------ Subscription
INSERT INTO SPOTIFY_SUBSCRIPTION_DIM VALUES (9,2,1,3,0,NULL,NULL,NULL);

