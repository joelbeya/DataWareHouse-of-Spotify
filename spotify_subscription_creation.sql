--------------------------------------------------------------------- DROP TABLE ---------------------------------------------------------------

DROP TABLE SPOTIFY_SUBSCRIPTION_DIM CASCADE CONSTRAINTS;
DROP TABLE PROMOTION_DIM CASCADE CONSTRAINTS;
DROP TABLE SUBSCRIPTION_TYPE_DIM CASCADE CONSTRAINTS;
DROP TABLE DATE_SUB_DIM CASCADE CONSTRAINTS;

-------------------------------------------------------------------- CREATE TABLE --------------------------------------------------------------

CREATE TABLE DATE_SUB_DIM (
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

CREATE TABLE SUBSCRIPTION_TYPE_DIM (
    SUBSCRIPTION_TYPE_KEY INT,
    NAME VARCHAR(20),
    DESCRIPTION VARCHAR(50),
    POPULATION_REACHED VARCHAR(30),
    NUMBER_OF_USER NUMBER(2),
    PRICE NUMERIC(2,2),
    DURATION_SUBSCRIPTION NUMBER(2),
    MAX_AUDIO_QUALITY VARCHAR(3),
    OFFLINE_LISTENING VARCHAR(2)
);

CREATE TABLE PROMOTION_DIM (
    PROMOTION_KEY INT,
    PROMOTION_NAME VARCHAR(20),
    PRICE_REDUCTION NUMERIC(2,2),
    PROMOTION_MEDIA_TYPE VARCHAR(30),
    DISPLAT_TYPE VARCHAR(30),
    PROMOTION_BEGIN_DATE DATE,
    PROMOTION_END_DATE DATE,
    AD_TYPE VARCHAR(30)
);

CREATE TABLE SPOTIFY_SUBSCRIPTION_DIM (
    DATE_KEY INT,
    USER_KEY INT,
    SUBSCRIPTION_TYPE_KEY INT,
    PROMOTION_KEY INT,
    PLATFORM_KEY INT,
    PRICE_MONTHLY NUMERIC(2,2) NOT NULL,
    BEGIN_OF_PREMIUM DATE NOT NULL,
    END_OF_PREMIUM DATE NOT NULL,
    CANCEL_DATE DATE NOT NULL
);

---------------------------------------------------------------------- ALTER TABLE ------------------------------------------------------------------------------

---------- PRIMARY KEYS

ALTER TABLE DATE_SUB_DIM ADD CONSTRAINT PK_DATE_SUB PRIMARY KEY (DATE_KEY);
ALTER TABLE SUBSCRIPTION_TYPE_DIM ADD CONSTRAINT PK_SUBSCRIPTION_TYPE PRIMARY KEY (SUBSCRIPTION_TYPE_KEY);
ALTER TABLE PROMOTION_DIM ADD CONSTRAINT PK_PROMOTION PRIMARY KEY (PROMOTION_KEY);

---------- FOREIGN KEYS

ALTER TABLE SPOTIFY_SUBSCRIPTION_DIM ADD CONSTRAINT FK_DATE_SUB FOREIGN KEY (DATE_KEY) REFERENCES DATE_SUB_DIM(DATE_KEY);
ALTER TABLE SPOTIFY_SUBSCRIPTION_DIM ADD CONSTRAINT FK_USER_SUB FOREIGN KEY (USER_KEY) REFERENCES USER_DIM(USER_KEY);
ALTER TABLE SPOTIFY_SUBSCRIPTION_DIM ADD CONSTRAINT FK_SUBSCRIPTION_TYPE_SUB FOREIGN KEY (SUBSCRIPTION_TYPE_KEY) REFERENCES SUBSCRIPTION_TYPE_DIM(SUBSCRIPTION_TYPE_KEY);
ALTER TABLE SPOTIFY_SUBSCRIPTION_DIM ADD CONSTRAINT FK_PROMOTION_SUB FOREIGN KEY (PROMOTION_KEY) REFERENCES PROMOTION_DIM(PROMOTION_KEY);
ALTER TABLE SPOTIFY_SUBSCRIPTION_DIM ADD CONSTRAINT FK_PLATFORM_SUB FOREIGN KEY (PLATFORM_KEY) REFERENCES PLATFORM_DIM(PLATFORM_KEY);

---------- CHECK CONSTRAINTS

ALTER TABLE DATE_SUB_DIM ADD CONSTRAINT CHK_SEASON_DATE_TIME_SUB CHECK (SEASON IN ('SPRING','SUMMER','AUTUMN','WINTER'));
ALTER TABLE DATE_SUB_DIM ADD CONSTRAINT CHK_DAY_SUB CHECK (DAY IN ('MON','TUE','WED','THU','FRI','SAT','SUN'));
ALTER TABLE DATE_SUB_DIM ADD CONSTRAINT CHK_MONTH_SUB CHECK (MONTH IN ('JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'));
ALTER TABLE DATE_SUB_DIM ADD CONSTRAINT CHK_WEEKEND_INDICATOR_SUB CHECK (WEEKEND_INDICATOR IN ('YES','NO'));
ALTER TABLE DATE_SUB_DIM ADD CONSTRAINT CHK_GIFT_PERIOD_INDICATOR_SUB CHECK (GIFT_PERIOD_INDICATOR IN ('YES','NO'));
ALTER TABLE SUBSCRIPTION_TYPE_DIM ADD CONSTRAINT CHK_NAME_SUBSCRIPTION CHECK (NAME IN ('FREE','PREMIUM','FAMILY PREMIUM','STUDENT PREMIUM'));
ALTER TABLE SUBSCRIPTION_TYPE_DIM ADD CONSTRAINT CHK_MAX_AUDIO_QUALITY CHECK (MAX_AUDIO_QUALITY IN ('160 KBPS','320 KBPS'));
ALTER TABLE SUBSCRIPTION_TYPE_DIM ADD CONSTRAINT CHK_OFFLINE_LISTENING CHECK (OFFLINE_LISTENING IN ('YES','NO'));
