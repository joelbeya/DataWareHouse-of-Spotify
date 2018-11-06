--------------------------------------------------------------------- DROP TABLE ---------------------------------------------------------------

DROP TABLE SPOTIFY_STREAM CASCADE CONSTRAINTS;
DROP TABLE PLATFORM_DIM CASCADE CONSTRAINTS;
DROP TABLE PLAYLIST_DIM CASCADE CONSTRAINTS;
DROP TABLE ARTIST_DIM CASCADE CONSTRAINTS;
DROP TABLE MUSIC_DIM CASCADE CONSTRAINTS;
DROP TABLE USER_DIM CASCADE CONSTRAINTS;
DROP TABLE TIME_DAY_DIM CASCADE CONSTRAINTS;
DROP TABLE DATE_DIM CASCADE CONSTRAINTS;

-------------------------------------------------------------------- CREATE TABLE --------------------------------------------------------------

CREATE TABLE DATE_DIM (
    DATE_KEY INT,
    FULL_DATE DATE NOT NULL,
    HOUR NUMBER(2) NOT NULL,
    DAY VARCHAR(4) NOT NULL,
    MONTH VARCHAR(4) NOT NULL,
    YEAR NUMBER(4) NOT NULL,
    SEASON VARCHAR(20) NOT NULL,
    WEEKEND_INDICATOR VARCHAR(3) NOT NULL,
    GIFT_PERIOD_INDICATOR VARCHAR(3) NOT NULL
);

CREATE TABLE TIME_DAY_DIM (
    TIME_DAY_KEY INT,
    FULL_TIME TIMESTAMP NOT NULL,
    HOUR NUMBER(2) NOT NULL,
    MINUTE NUMBER(2) NOT NULL,
    SECOND NUMBER(2) NOT NULL,
    AM_PM_INDICATOR VARCHAR(3) NOT NULL,
    DAY_PART_SEGMENT VARCHAR(15) NOT NULL,
    DAY_OF_WEEK VARCHAR(3) NOT NULL,
    SEASON VARCHAR(20) NOT NULL,
    SUMMER_TIME VARCHAR(3) NOT NULL
);

CREATE TABLE USER_DIM (
    USER_KEY INT,
    NAME VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(80) NOT NULL,
    CIVILITY VARCHAR(2),
    BIRTH_DATE DATE,
    ZIP_CODE VARCHAR(20),
    CITY VARCHAR(70),
    COUNTRY VARCHAR(70),
    CONTINENT VARCHAR (20),
    PAYMENTS_OPTION VARCHAR(20),
    PHONE_BRAND VARCHAR(20)
);

CREATE TABLE MUSIC_DIM (
    MUSIC_KEY INT NOT NULL,
    TITLE VARCHAR(30) NOT NULL,
    GENRE VARCHAR(20) NOT NULL,
    RELEASE_DATE DATE NOT NULL,
    DURATION TIMESTAMP NOT NULL,
    EXPLICIT VARCHAR(3) NOT NULL,
    BEATS_PER_MINUTE NUMBER(3) NOT NULL,
    ADDED_TO_LIBRARY VARCHAR(3) NOT NULL
);

CREATE TABLE ARTIST_DIM (
    ARTIST_KEY INT,
    NAME VARCHAR(50) NOT NULL,
    BIRTH_DATE DATE,
    MUSIC_TYPE VARCHAR(20),
    NATIONALITY VARCHAR(20),
    SUBSCRIBERS NUMBER(9) NOT NULL,
    MONTHLY_LISTENERS NUMBER(9) NOT NULL,
    LANGUAGE VARCHAR(20),
    BIOGRAPHY VARCHAR(100),
    REGISTRATION_DATE DATE NOT NULL
);

CREATE TABLE PLAYLIST_DIM (
    PLAYLIST_KEY INT,
    TITLE VARCHAR(30) NOT NULL,
    OWNER VARCHAR(30) NOT NULL,
    DESCRIPTION VARCHAR(100),
    YEAR NUMBER(4) NOT NULL,
    SONGS_NUMBER NUMBER(4) NOT NULL,
    GENRE VARCHAR(20),
    LABEL VARCHAR(30),
    PLAYLIST_DURATION TIMESTAMP NOT NULL,
    COVER VARCHAR(3) NOT NULL,
    ADDED_TO_LIBRARY VARCHAR(3) NOT NULL
);

CREATE TABLE PLATFORM_DIM (
    PLATFORM_KEY INT,
    DESCRIPTION VARCHAR(50) NOT NULL,
    TYPE VARCHAR(20) NOT NULL,
    SCREEN_HEIGHT VARCHAR(5),
    SCREEN_WIDTH VARCHAR(5),
    OPERATING_SYSTEM VARCHAR(20),
    PROCESSOR VARCHAR(20),
    IP_ADDRESS VARCHAR(20),
    APP_VERSION VARCHAR(10)
);

CREATE TABLE SPOTIFY_STREAM (
    DATE_KEY INT,
    TIME_DAY_KEY INT,
    USER_KEY INT,
    MUSIC_KEY INT,
    ARTIST_KEY INT,
    PLAYLIST_KEY INT,
    PLATFORM_KEY INT,
    LISTENED_OFFLINE VARCHAR(3) NOT NULL,
    STREAM_DURATION TIMESTAMP NOT NULL,
    TIME_PAUSED TIMESTAMP NOT NULL,
    END_OF_LISTENING VARCHAR(3) NOT NULL
);

---------------------------------------------------------------------- ALTER TABLE ------------------------------------------------------------------------------

---------- PRIMARY KEYS

ALTER TABLE DATE_DIM ADD CONSTRAINT PK_DATE_STREAM PRIMARY KEY (DATE_KEY);
ALTER TABLE TIME_DAY_DIM ADD CONSTRAINT PK_TIME_DAY_STREAM PRIMARY KEY (TIME_DAY_KEY);
ALTER TABLE USER_DIM ADD CONSTRAINT PK_USER_STREAM PRIMARY KEY (USER_KEY);
ALTER TABLE MUSIC_DIM ADD CONSTRAINT PK_MUSIC_STREAM PRIMARY KEY (MUSIC_KEY);
ALTER TABLE ARTIST_DIM ADD CONSTRAINT PK_ARTIST_STREAM PRIMARY KEY (ARTIST_KEY);
ALTER TABLE PLAYLIST_DIM ADD CONSTRAINT PK_ALBUM_STREAM PRIMARY KEY (PLAYLIST_KEY);
ALTER TABLE PLATFORM_DIM ADD CONSTRAINT PK_PLATFORM_STREAM PRIMARY KEY (PLATFORM_KEY);

---------- FOREIGN KEYS

ALTER TABLE SPOTIFY_STREAM ADD CONSTRAINT FK_DATE_STREAM FOREIGN KEY (DATE_KEY) REFERENCES DATE_DIM(DATE_KEY);
ALTER TABLE SPOTIFY_STREAM ADD CONSTRAINT FK_TIME_DAY_STREAM FOREIGN KEY (TIME_DAY_KEY) REFERENCES TIME_DAY_DIM(TIME_DAY_KEY);
ALTER TABLE SPOTIFY_STREAM ADD CONSTRAINT FK_PLATFORM_STREAM FOREIGN KEY (PLATFORM_KEY) REFERENCES PLATFORM_DIM(PLATFORM_KEY);
ALTER TABLE SPOTIFY_STREAM ADD CONSTRAINT FK_ARTIST_STREAM FOREIGN KEY (ARTIST_KEY) REFERENCES ARTIST_DIM(ARTIST_KEY);
ALTER TABLE SPOTIFY_STREAM ADD CONSTRAINT FK_USER_STREAM FOREIGN KEY (USER_KEY) REFERENCES USER_DIM(USER_KEY);
ALTER TABLE SPOTIFY_STREAM ADD CONSTRAINT FK_MUSIC_STREAM FOREIGN KEY (MUSIC_KEY) REFERENCES MUSIC_DIM(MUSIC_KEY);
ALTER TABLE SPOTIFY_STREAM ADD CONSTRAINT FK_PLAYLIST_STREAM FOREIGN KEY (PLAYLIST_KEY) REFERENCES PLAYLIST_DIM(PLAYLIST_KEY);

---------- CHECK CONSTRAINTS

ALTER TABLE DATE_DIM ADD CONSTRAINT CHK_SEASON_DATE_TIME_STR CHECK (SEASON IN ('SPRING','SUMMER','AUTUMN','WINTER'));
ALTER TABLE DATE_DIM ADD CONSTRAINT CHK_DAY_STR CHECK (DAY IN ('MON','TUE','WED','THU','FRI','SAT','SUN'));
ALTER TABLE DATE_DIM ADD CONSTRAINT CHK_MONTH_STR CHECK (MONTH IN ('JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'));
ALTER TABLE DATE_DIM ADD CONSTRAINT CHK_WEEKEND_INDICATOR_STR CHECK (WEEKEND_INDICATOR IN ('YES','NO'));
ALTER TABLE DATE_DIM ADD CONSTRAINT CHK_GIFT_PERIOD_INDICATOR_STR CHECK (GIFT_PERIOD_INDICATOR IN ('YES','NO'));
ALTER TABLE TIME_DAY_DIM ADD CONSTRAINT CHK_AM_PM_INDICATOR_STR CHECK (AM_PM_INDICATOR IN ('AM','PM'));
ALTER TABLE TIME_DAY_DIM ADD CONSTRAINT CHK_DAY_PART_SEGMENT_STR CHECK (DAY_PART_SEGMENT IN ('MORNING','NOON','AFTERNOON','EVENING','NIGHT','DAWN'));
ALTER TABLE TIME_DAY_DIM ADD CONSTRAINT CHK_DAY_OF_WEEK_STR CHECK (DAY_OF_WEEK IN ('MON','TUE','WED','THU','FRI','SAT','SUN'));
ALTER TABLE TIME_DAY_DIM ADD CONSTRAINT CHK_SEASON_TIME_DAY_STR CHECK (SEASON IN ('SPRING','SUMMER','AUTUMN','WINTER'));
ALTER TABLE USER_DIM ADD CONSTRAINT CHK_PAYMENTS_OPTION_STR CHECK (PAYMENTS_OPTION IN ('NONE','VISA','MASTERCARD','AMERICAN EXPRESS','GIFT CARD'));
ALTER TABLE USER_DIM ADD CONSTRAINT CHK_CIVILITY_STR CHECK (CIVILITY IN ('M','F'));
ALTER TABLE MUSIC_DIM ADD CONSTRAINT CHK_ADDED_TO_LIBRARY_MUSIC_STR CHECK (ADDED_TO_LIBRARY IN ('YES','NO'));
ALTER TABLE MUSIC_DIM ADD CONSTRAINT CHK_EXPLICIT_STR CHECK (EXPLICIT IN ('YES','NO'));
ALTER TABLE PLAYLIST_DIM ADD CONSTRAINT CHK_COVER_STR CHECK (COVER IN ('YES','NO'));
ALTER TABLE PLAYLIST_DIM ADD CONSTRAINT CHK_ADDED_TO_LIBRARY_ALBUM_STR CHECK (ADDED_TO_LIBRARY IN ('YES','NO'));
ALTER TABLE SPOTIFY_STREAM ADD CONSTRAINT CHK_LISTENED_OFFLINE_STR CHECK (LISTENED_OFFLINE IN ('YES','NO'));
ALTER TABLE SPOTIFY_STREAM ADD CONSTRAINT CHK_END_OF_LISTENING_STR CHECK (END_OF_LISTENING IN ('YES','NO'));
