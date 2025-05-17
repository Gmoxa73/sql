INSERT INTO Album (AlbumID, name_a, year)
VALUES (1, 'Sonic', 2018);
INSERT INTO Album (AlbumID, name_a, year)
VALUES (2, 'MetalG', 2020);
INSERT INTO Album (AlbumID, name_a, year)
VALUES (3, 'Family', 2022);
INSERT INTO Album (AlbumID, name_a, year)
VALUES (4, 'BadGays', 2021);

INSERT INTO Artist (ArtistID, name)
VALUES (1, 'Luise');
INSERT INTO Artist (ArtistID, name)
VALUES (2, 'Dolche');
INSERT INTO Artist (ArtistID, name)
VALUES (3, 'Frady Mercury');
INSERT INTO Artist (ArtistID, name)
VALUES (4, 'Bily Jons');
INSERT INTO Artist (ArtistID, name)
VALUES (5, 'Rick Rasmus');
INSERT INTO Artist (ArtistID, name)
VALUES (6, 'Gary Rich');
INSERT INTO Artist (ArtistID, name)
VALUES (7, 'Samata Fox');

INSERT INTO Genre (GenreID, genre)
VALUES (1, 'Pop');
INSERT INTO Genre (GenreID, genre)
VALUES (2, 'Rock');
INSERT INTO Genre (GenreID, genre)
VALUES (3, 'Classical');
INSERT INTO Genre (GenreID, genre)
VALUES (4, 'Pap');

INSERT INTO Trek (TrekID, name, duration, Albumid)
VALUES (1, 'Soul', 2.20, 1);
INSERT INTO Trek (TrekID, name, duration, Albumid)
VALUES (2, 'Future', 3.15, 3);
INSERT INTO Trek (TrekID, name, duration, Albumid)
VALUES (3, 'Guests', 2.45, 1);
INSERT INTO Trek (TrekID, name, duration, Albumid)
VALUES (4, 'Pity', 3.15, 2);
INSERT INTO Trek (TrekID, name, duration, Albumid)
VALUES (5, 'Discussion', 2.30, 4);
INSERT INTO Trek (TrekID, name, duration, Albumid)
VALUES (6, 'Lambada', 2.03, 4);
INSERT INTO Trek (TrekID, name, duration, Albumid)
VALUES (7, 'Robots', 2.29, 3);
INSERT INTO Trek (TrekID, name, duration, Albumid)
VALUES (8, 'Exit', 3.02, 3);

INSERT INTO Mix (MixID, name, year)
VALUES (1, 'SuperMix', 2023);
INSERT INTO Mix (MixID, name, year)
VALUES (2, 'HotMix24', 2024);
INSERT INTO Mix (MixID, name, year)
VALUES (3, 'RedHot', 2021);
INSERT INTO Mix (MixID, name, year)
VALUES (4, 'Lady', 2022);
INSERT INTO Mix (MixID, name, year)
VALUES (5, 'Rouse', 2022);

INSERT INTO Artist_Album  (AAID, ArtistID, AlbumID)
VALUES (1, 1, 2);
INSERT INTO Artist_Album  (AAID, ArtistID, AlbumID)
VALUES (2, 1, 4);
INSERT INTO Artist_Album  (AAID, ArtistID, AlbumID)
VALUES (3, 2, 1);
INSERT INTO Artist_Album  (AAID, ArtistID, AlbumID)
VALUES (4, 3, 3);
INSERT INTO Artist_Album  (AAID, ArtistID, AlbumID)
VALUES (5, 4, 2);
INSERT INTO Artist_Album  (AAID, ArtistID, AlbumID)
VALUES (6, 5, 1);
INSERT INTO Artist_Album  (AAID, ArtistID, AlbumID)
VALUES (7, 6, 3);
INSERT INTO Artist_Album  (AAID, ArtistID, AlbumID)
VALUES (8, 7, 1);

INSERT INTO Artist_Genre  (AGID, ArtistID, GenreID)
VALUES (1, 1, 1);
INSERT INTO Artist_Genre  (AGID, ArtistID, GenreID)
VALUES (2, 2, 2);
INSERT INTO Artist_Genre  (AGID, ArtistID, GenreID)
VALUES (3, 3, 3);
INSERT INTO Artist_Genre  (AGID, ArtistID, GenreID)
VALUES (4, 4, 4);
INSERT INTO Artist_Genre  (AGID, ArtistID, GenreID)
VALUES (5, 5, 3);
INSERT INTO Artist_Genre  (AGID, ArtistID, GenreID)
VALUES (6, 6, 4);
INSERT INTO Artist_Genre  (AGID, ArtistID, GenreID)
VALUES (7, 7, 2);
INSERT INTO Artist_Genre  (AGID, ArtistID, GenreID)
VALUES (8, 5, 1);
INSERT INTO Artist_Genre  (AGID, ArtistID, GenreID)
VALUES (9, 3, 3);

INSERT INTO Trek_Mix  (TrekID, MixID)
VALUES (1,1);
INSERT INTO Trek_Mix  (TrekID, MixID)
VALUES (2,3);
INSERT INTO Trek_Mix  (TrekID, MixID)
VALUES (3,2);
INSERT INTO Trek_Mix  (TrekID, MixID)
VALUES (4,4);
INSERT INTO Trek_Mix  (TrekID, MixID)
VALUES (5,1);
INSERT INTO Trek_Mix  (TrekID, MixID)
VALUES (6,3);
INSERT INTO Trek_Mix  (TrekID, MixID)
VALUES (7,2);
INSERT INTO Trek_Mix  (TrekID, MixID)
VALUES (3,4);
