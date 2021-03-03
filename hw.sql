-- question 1 --
SELECT * FROM movies;

-- question 2 --
SELECT title, id FROM movies
LIMIT 10;

-- question 3 --
SELECT * FROM movies
WHERE id = 485;

-- question 4 -- 
SELECT id FROM movies
WHERE title = 'Made in America (1993)';

-- question 5 --
SELECT * FROM movies
ASC
LIMIT 10;

-- question 6 --
SELECT * FROM movies
WHERE title LIKE '%(2002)%';

-- question 7 --
SELECT substr(title, 17,4) as Year, title FROM movies
WHERE id =  858;

-- question 8 --
SELECT * FROM movies
WHERE genres LIKE '%Comedy%';

-- question 9 --
SELECT * FROM movies
WHERE genres LIKE '%Comedy%' 
AND title like '%(2000)%';

-- question 10 --
SELECT * FROM movies
WHERE genres LIKE '%Comedy%' 
AND genres LIKE '%Horror%';

-- question 11 --
SELECT * FROM movies
WHERE (title LIKE '%(2001)%' AND  title LIKE '%super%') 
 OR (title LIKE '%(2002)%' AND  title LIKE '%super%') ;

 -- with JOINS --
 -- question 1 --
SELECT m.title, r.rating 
FROM movies m
JOIN ratings r ON m.id = r.movie_id
WHERE title = 'Godfather, The (1972)';

-- question 2 --
SELECT m.title, r.rating, r.timestamp
FROM movies m
JOIN ratings r ON m.id = r.movie_id
WHERE title = 'Godfather, The (1972)'
ORDER BY r.timestamp ASC;

-- question 3 --
SELECT m.title, l.imdb_id 
FROM movies m
JOIN links l ON m.id = l.movie_id
WHERE m.title LIKE '%comedy%' AND m.title LIKE '%(2005)%';

-- question 4 --
SELECT m.title 
FROM movies m
LEFT JOIN ratings r ON m.id = r.movie_id
WHERE r.rating is  null;

--Aggregation --
-- question 1 --
SELECT m.title as Title, AVG(r.rating) as Average
FROM movies m
JOIN ratings r ON m.id = r.movie_id
GROUP BY m.title;

-- question 2 --
SELECT m.title as Title, SUM(r.rating) as Total
FROM movies m
JOIN ratings r ON m.id = r.movie_id
GROUP BY m.title;

-- question 3 --
SELECT genres, count(title) as Total_Movies
FROM movies 
GROUP BY genres;

-- question 4 --
SELECT user_id, avg(rating) 
FROM ratings
GROUP BY user_id;

-- question 5 --
SELECT user_id, count(rating) as Most_Rating
FROM ratings
WHERE 
GROUP BY user_id
ORDER BY Most_Rating DESC
LIMIT 1;

-- question 6 --
SELECT avg(rating) as HighestAvg , user_id
FROM ratings
GROUP BY user_id
ORDER BY HighestAvg Desc
LIMIT 1;

-- question 7 --
SELECT avg(rating) as HighestAvg , user_id, count(rating) as countR
FROM ratings
GROUP BY user_id
Having countR > 50
ORDER BY HighestAvg Desc
LIMIT 1;

-- question 8 --
SELECT title, avg(r.rating) as Rating
FROM movies m
JOIN ratings r ON m.id = r.movie_id
WHERE Rating > 4
GROUP BY m.title;


--HARD MODE --
-- question 1 --

-- question 2 --

-- question 3 --

-- question 4 --
SELECT  REPLACE(LOWER(tag),' ','-') as Lower_Tag , tag 
FROM tags;



