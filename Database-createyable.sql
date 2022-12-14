CREATE DATABASE sequelmovie;
USE sequelmovie;

CREATE TABLE movie(

movieID INT NOT NULL AUTO_INCREMENT,
movieTitle VARCHAR(100) NOT NULL,
movieDesc VARCHAR(150),
movieReleaseDate DATE,
movieRunTime INT(3) CHECK (movieRunTime > 25),
movieRating INT(1) CHECK  (movieRating > 0 AND movieRating <= 5),
PRIMARY KEY (movieID)
);


CREATE TABLE poster(

posterID INT(5) NOT NULL AUTO_INCREMENT,
posterLink VARCHAR(200) DEFAULT 'http://www.uidownload.com/files/478/82/442/error-404-page-not-found-icon.jpg',
p_movieID INT(5) NOT NULL,
PRIMARY KEY (posterID),
CONSTRAINT poster_fk_movie FOREIGN KEY (p_movieID) REFERENCES movie (movieID)
);


CREATE TABLE trailer (
    trailerID INT(5) NOT NULL,
    trailerLength INT(2),
    trailerURL VARCHAR(150),
    t_movieID INT(5) NOT NULL,
    PRIMARY KEY (trailerID),
    CONSTRAINT trailer_fk_movie FOREIGN KEY (t_movieID)
        REFERENCES movie (movieID)
);

CREATE TABLE studio(
    studioID INT(5) NOT NULL,
    studioName VARCHAR(50) NOT NULL,
    studioAddress VARCHAR(200),
	PRIMARY KEY (studioID)
);

CREATE TABLE movie_studio(
    movie_studioID INT(5) NOT NULL AUTO_INCREMENT,
    m_movieID INT(5) NOT NULL,
    s_studioID INT(5) NOT NULL,
	PRIMARY KEY (movie_studioID),
    CONSTRAINT movie_studio_fk_movie FOREIGN KEY (m_movieID) REFERENCES movie (movieID),
    CONSTRAINT movie_studio_fk_studio FOREIGN KEY (s_studioID) REFERENCES studio (studioID)
);

CREATE TABLE genre(
    genreID INT(5) NOT NULL,
    genreType VARCHAR(25) NOT NULL,
    genreDesc VARCHAR(200),
	PRIMARY KEY (genreID)
);

CREATE TABLE movie_genre(
    movie_genreID INT(5) NOT NULL,
    m_movieID INT(5) NOT NULL,
    g_genreID INT(5) NOT NULL,
    PRIMARY KEY (movie_genreID),
    CONSTRAINT movie_genre_fk_movie FOREIGN KEY (m_movieID) REFERENCES movie (movieID),
    CONSTRAINT movie_genre_fk_genre FOREIGN KEY (g_genreID) REFERENCES genre (genreID)
);


CREATE TABLE person(
    personID INT(5) NOT NULL,
    personFirstName VARCHAR(50) NOT NULL,
    personLastName VARCHAR(50),
    personNationality VARCHAR(50),
    personPicture VARCHAR (150),
	PRIMARY KEY (personID)
);

CREATE TABLE role(
    roleID INT(5) NOT NULL,
    roleDesc VARCHAR(25) NOT NULL,
    m_movieID INT(5) NOT NULL,
    p_personID INT(5) NOT NULL,
    PRIMARY KEY (roleID),
    CONSTRAINT role_fk_movie FOREIGN KEY (m_movieID) REFERENCES movie (movieID),
    CONSTRAINT role_fk_person FOREIGN KEY (p_personID) REFERENCES person (personID)
);

CREATE TABLE soundtrack(
    soundtrackID INT(5) NOT NULL,
    soundtrackName VARCHAR(100) NOT NULL,
    soundtrackSize INT(2),
    m_movieID INT(5) NOT NULL,
    PRIMARY KEY (soundtrackID),
    CONSTRAINT soundtrack_fk_movie FOREIGN KEY (m_movieID) REFERENCES movie (movieID)
);

CREATE TABLE song(
    songID INT(5) NOT NULL,
    songName VARCHAR(100) NOT NULL,
    songLength INT(3),
    songURL VARCHAR(150),
	PRIMARY KEY (songID)
);

CREATE TABLE soundtrack_song(
    soundtrack_songID INT(5) NOT NULL,
    soundtrack_soundtrackID INT(5) NOT NULL,
    song_songID INT(5) NOT NULL,
	PRIMARY KEY (soundtrack_songID),
    CONSTRAINT soundtrack_song_fk_soundtrack FOREIGN KEY (soundtrack_soundtrackID) REFERENCES soundtrack (soundtrackID),
    CONSTRAINT soundtrack_song_fk_song FOREIGN KEY (song_songID) REFERENCES song (songID)
);


CREATE TABLE artiste(
    artisteID INT(5) NOT NULL,
    artisteName VARCHAR(50) NOT NULL,
    artisteNationality VARCHAR(50),
	PRIMARY KEY (artisteID)
);


CREATE TABLE song_artiste(
    song_artisteID INT(5) NOT NULL,
    s_songID INT(5) NOT NULL,
    a_artisteID INT(5) NOT NULL,
    PRIMARY KEY (song_artisteID),
    CONSTRAINT song_artiste_fk_song FOREIGN KEY (s_songID) REFERENCES song (songID),
    CONSTRAINT song_artiste_fk_artiste FOREIGN KEY (a_artisteID) REFERENCES artiste (artisteID)
);


CREATE TABLE band(
    bandID INT(5) NOT NULL,
    bandName VARCHAR(25) NOT NULL,
	PRIMARY KEY (bandID)
);


CREATE TABLE song_band(
    song_bandID INT(5) NOT NULL,
    song_songID INT(5) NOT NULL,
    b_bandID INT(5) NOT NULL,
    PRIMARY KEY (song_bandID),
    CONSTRAINT song_band_fk_song FOREIGN KEY (song_songID) REFERENCES song (songID),
    CONSTRAINT song_band_fk_band FOREIGN KEY (b_bandID) REFERENCES band (bandID)
);

CREATE TABLE artiste_band(
    artiste_bandID INT(5) NOT NULL,
    bandRole VARCHAR(50),
    a_artisteID INT(5) NOT NULL,
    b_bandID INT(5) NOT NULL,
	PRIMARY KEY (artiste_bandID),
    CONSTRAINT artiste_band_fk_artiste FOREIGN KEY (a_artisteID) REFERENCES artiste (artisteID),
    CONSTRAINT artiste_band_fk_band FOREIGN KEY (b_bandID) REFERENCES band (bandID)
);