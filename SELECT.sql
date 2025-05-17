SELECT name , duration  
FROM trek
WHERE duration = (SELECT MAX(duration) FROM trek);

SELECT name 
FROM trek
WHERE duration >= 3.5;

SELECT name 
FROM mix
WHERE "year" BETWEEN 2018 AND 2025; 

SELECT name
FROM artist 
WHERE name NOT LIKE '% %'

SELECT name 
FROM trek
WHERE name LIKE '%bad%';

-----------------------------------------------------------------------------------------------

SELECT genre, COUNT(ArtistID) artist FROM Artist_Genre ag
JOIN Genre g ON ag.GenreID = g.GenreID
GROUP BY genre;

SELECT name_a album_name, COUNT(name) count_trek FROM trek t
JOIN Album a ON a.albumid = t.albumid
WHERE a."year" BETWEEN 2019 AND 2020
GROUP BY name_a;

SELECT name_a album_name, ROUND(AVG(duration)::numeric, 2) avg_time FROM trek t
JOIN Album a ON a.albumid = t.albumid
GROUP BY name_a;

SELECT name
FROM artist a 
WHERE NOT EXISTS
	(
	SELECT 1
	FROM artist_album aa 
	JOIN album al ON al.albumid = aa.albumid
	WHERE a.artistid = aa.artistid AND al."year" = 2020
	)
GROUP BY "name";

SELECT m.name
FROM mix m
JOIN trek_mix tm ON tm.mixid = m.mixid
JOIN trek t ON tm.trekid  = t.trekid
JOIN album al ON t.albumid = al.albumid
JOIN artist_album aa ON al.albumid = aa.albumid
JOIN artist a ON a.artistid = aa.artistid
WHERE a.name = 'Luise';

-------------------------------------------------------------------------

SELECT al.name_a
FROM album al
JOIN artist_album aa ON al.albumid = aa.albumid
JOIN artist a ON a.artistid = aa.artistid
JOIN artist_genre ag ON ag.artistid = a.artistid 
GROUP BY al.name_a 
HAVING COUNT(ag.genreid) > 1

SELECT t.name
FROM trek t
WHERE NOT EXISTS 
	(
    SELECT 1
    FROM trek_mix tm
    WHERE tm.trekid = t.trekid
    );
    
SELECT a.name
FROM artist a 
JOIN artist_album aa ON a.artistid = aa.artistid
JOIN album al ON al.albumid = aa.albumid
JOIN trek t ON al.albumid = t.albumid
WHERE duration = 
	(
	SELECT MIN(duration) FROM trek
	)

 
SELECT al.name_a, t."name"
FROM album al
JOIN trek t ON t.albumid = al.albumid
WHERE al.albumid = 
	(
    SELECT albumid
    FROM trek
    GROUP BY albumid
    ORDER BY COUNT(*)
    LIMIT 1
	)
