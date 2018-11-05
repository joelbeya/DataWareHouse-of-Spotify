--------------------------------------------------------------------- DROP TABLE ---------------------------------------------------------------

DROP TABLE SPOTIFY_SUBSCRIPTION_DIM;
DROP TABLE PLATFORM_DIM;
DROP TABLE PROMOTION_DIM;
DROP TABLE SUBSCRIPTION_TYPE_DIM;
DROP TABLE USER_DIM;
DROP TABLE TIME_DAY_DIM;
DROP TABLE DATE_DIM;

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
    GIFT_PERIOD_INDICATOR NOT NULL
);

CREATE TABLE TIME_DAY_DIM (
    TIME_DAY_KEY INT,
    FULL_TIME TIME NOT NULL,
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
    EMAIL VARCHAR(20) NOT NULL,
    CIVILITY VARCHAR(2),
    BIRTH_DATE DATE,
    ZIP_CODE VARCHAR(6),
    CITY VARCHAR(20),
    COUNTRY VARCHAR(30),
    CONTINENT VARCHAR (20),
    PAYMENTS_OPTION VARCHAR(20),
    PHONE_BRAND VARCHAR(20)
);

CREATE TABLE SUBSCRIPTION_TYPE_DIM (
    SUBSCRIPTION_TYPE_KEY INT,
    NAME VARCHAR(20),
    DESCRIPTION VARCHAR(50),
    POPULATION_REACHED VARCHAR(30),
    NUMBER_OF_USER NUMBER(8),
    PRICE NUMERIC(2,2),
    BEGIN_DATE DATE,
    END_DATE DATE,
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

CREATE TABLE PLATFORM_DIM (
    PLATFORM_KEY INT,
    DESCRIPTION VARCHAR(50) NOT NULL,
    TYPE VARCHAR(20) NOT NULL,
    SCREEN_HEIGHT VARCHAR(5),
    SCREEN_WIDTH VARCHAR(5),
    OPERATING SYSTEM VARCHAR(20),
    PROCESSOR VARCHAR(20),
    IP_ADDRESS VARCHAR(20),
    APP_VERSION VARCHAR(10)
);

CREATE TABLE SPOTIFY_SUBSCRIPTION_DIM (
    DATE_KEY INT,
    TIME_DAY_KEY INT,
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

-- PRIMARY KEY
ALTER TABLE DATE_DIM ADD CONSTRAINT PK_DATE PRIMARY KEY (DATE_KEY);
ALTER TABLE TIME_DAY_DIM ADD CONSTRAINT PK_TIME_DAY PRIMARY KEY (TIME_DAY_KEY);
ALTER TABLE USER_DIM ADD CONSTRAINT PK_USER PRIMARY KEY (USER_KEY);
ALTER TABLE SUBSCRIPTION_TYPE_DIM ADD CONSTRAINT PK_SUBSCRIPTION_TYPE PRIMARY KEY (SUBSCRIPTION_TYPE_KEY);
ALTER TABLE PROMOTION_DIM ADD CONSTRAINT PK_PROMOTION PRIMARY KEY (PROMOTION_KEY);
ALTER TABLE PLATFORM_DIM ADD CONSTRAINT PK_PLATFORM PRIMARY KEY (PLATFORM_KEY);


-- FOREIGN KEY
ALTER TABLE SPOTIFY_SUBSCRIPTION_DIM ADD CONSTRAINT FK_DATE_SUBSCRIPTION FOREIGN KEY (DATE_KEY) REFERENCES DATE_DIM(DATE_KEY);
ALTER TABLE SPOTIFY_SUBSCRIPTION_DIM ADD CONSTRAINT FK_TIME_DAY_SUBSCRIPTION FOREIGN KEY (TIME_DAY_KEY) REFERENCES TIME_DAY_DIM(TIME_DAY_KEY);
ALTER TABLE SPOTIFY_SUBSCRIPTION_DIM ADD CONSTRAINT FK_USER_SUBSCRIPTION FOREIGN KEY (USER_KEY) REFERENCES USER_DIM(USER_KEY);
ALTER TABLE SPOTIFY_SUBSCRIPTION_DIM ADD CONSTRAINT FK_SUBSCRIPTION_TYPE_SUBSCRIPTION FOREIGN KEY (SUBSCRIPTION_TYPE_KEY) REFERENCES SUBSCRIPTION_TYPE_DIM(SUBSCRIPTION_TYPE_KEY);
ALTER TABLE SPOTIFY_SUBSCRIPTION_DIM ADD CONSTRAINT FK_PROMOTION_SUBSCRIPTION FOREIGN KEY (PROMOTION_KEY) REFERENCES PROMOTION_DIM(PROMOTION_KEY);
ALTER TABLE SPOTIFY_SUBSCRIPTION_DIM ADD CONSTRAINT FK_PLATFORM_SUBSCRIPTION FOREIGN KEY (PLATFORM_KEY) REFERENCES PLATFORM_DIM(PLATFORM_KEY);

-- CHECK CONSTRAINT
ALTER TABLE DATE_DIM ADD CONSTRAINT CHK_SEASON_DATE_TIME CHECK (SEASON IN ('SPRING','SUMMER','AUTUMN','WINTER'));
ALTER TABLE DATE_DIM ADD CONSTRAINT CHK_DAY CHECK (DAY IN ('MON','TUE','WED','THU','FRI','SAT','SUN'));
ALTER TABLE DATE_DIM ADD CONSTRAINT CHK_MONTH CHECK (MONTH IN ('JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'));
ALTER TABLE DATE_DIM ADD CONSTRAINT CHK_WEEK_IND CHECK (WEEK_IND IN ('YES','NO'));
ALTER TABLE DATE_DIM ADD CONSTRAINT CHK_GIFT_PERIOD_INDICATOR CHECK (GIFT_PERIOD_INDICATOR IN ('YES','NO'));
ALTER TABLE TIME_DAY_DIM ADD CONSTRAINT CHK_AM_PM_INDICATOR CHECK (AM_PM_INDICATOR IN ('AM','PM'));
ALTER TABLE TIME_DAY_DIM ADD CONSTRAINT CHK_DAY_PART_SEGMENT CHECK (DAY_PART_SEGMENT IN ('MORNING','NOON','AFTERNOON','EVENING','NIGHT','DAWN'));
ALTER TABLE TIME_DAY_DIM ADD CONSTRAINT CHK_DAY_OF_WEEK CHECK (DAY_OF_WEEK IN ('MON','TUE','WED','THU','FRI','SAT','SUN'));
ALTER TABLE TIME_DAY_DIM ADD CONSTRAINT CHK_SEASON_TIME_DAY CHECK (SEASON IN ('SPRING','SUMMER','AUTUMN','WINTER'));
ALTER TABLE USER_DIM ADD CONSTRAINT CHK_PAYMENTS_OPTION CHECK (PAYMENTS_OPTION IN ('NONE','VISA','MASTERCARD','AMERICAN EXPRESS','GIFT CARD'));
ALTER TABLE USER_DIM ADD CONSTRAINT CHK_CIVILITY CHECK (CIVILITY IN ('M','F'));
ALTER TABLE SUBSCRIPTION_TYPE_DIM ADD CONSTRAINT CHK_NAME_SUBSCRIPTION CHECK (NAME IN ('FREE','PREMIUM','FAMILY PREMIUM','STUDENT PREMIUM'));
ALTER TABLE SUBSCRIPTION_TYPE_DIM ADD CONSTRAINT CHK_MAX_AUDIO_QUALITY CHECK (MAX_AUDIO_QUALITY IN ('96','160','256','320'));
ALTER TABLE SUBSCRIPTION_TYPE_DIM ADD CONSTRAINT CHK_OFFLINE_LISTENING CHECK (OFFLINE_LISTENING IN ('YES','NO'));