create table if not exists Artist
(
ArtistID SERIAL PRIMARY KEY,
name varchar(50) NOT NULL
);

create table if not exists Genre
(
GenreID SERIAL PRIMARY KEY,
name varchar(50) NOT NULL
);

create table if not exists Album
(
AlbumID SERIAL PRIMARY KEY,
name varchar(50) NOT NULL,
year INT NOT NULL
);

create table if not exists Artist_Genre
(
AGID SERIAL PRIMARY KEY,
ArtistID INT NOT NULL,
GenreID INT NOT NULL,
CONSTRAINT FK_Artist FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID),
CONSTRAINT FK_Genre FOREIGN KEY (GenreID) references Genre(GenreID)
);

create table if not exists Artist_Album
(
AAID SERIAL PRIMARY KEY,
ArtistID INT NOT NULL,
AlbumID INT NOT NULL,
CONSTRAINT FK_Artist FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID),
CONSTRAINT FK_Album FOREIGN KEY (AlbumID) references Album(AlbumID)
);

create table if not exists Trek
(
TrekID SERIAL PRIMARY KEY,
ArtistID INT NOT NULL,
name VARCHAR(50) NOT NULL,
duration INT NOT NULL,
AlbumID INT NOT NULL,
CONSTRAINT FK_Album_Trek FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID)
);

create table if not exists Mix
(
MixID SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
year INT NOT NULL,
AlbumID INT NOT NULL,
TrekID INT NOT NULL,
CONSTRAINT FK_Album_Trek FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID),
CONSTRAINT FK_Album_Album FOREIGN KEY (TrekID) REFERENCES Trek(TrekID)
);
